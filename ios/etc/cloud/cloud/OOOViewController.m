//
//  OOOViewController.m
//  cloud
//
//  Created by 大森 智史 on 12/05/05.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.

//http://www.techotopia.com/index.php/Managing_iPhone_Files_using_the_iOS_5_UIDocument_Class
//↑を参考にしたが日本語の取扱、アクションメソッドの命名に難点があり修正している。


#import "OOOViewController.h"

@interface OOOViewController ()

@end
@implementation OOOViewController

@synthesize textView, documentURL, document;
@synthesize query = _query;
//iCloudへ
- (void)moveFileToiCloud:(NSURL *)destinationURL {
    NSURL* aCloudUrl = 
    [[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil];
    NSString *filename=nil;
    [destinationURL getResourceValue:&filename forKey:NSURLNameKey error:nil];

    NSURL *cloudUrl = [[aCloudUrl URLByAppendingPathComponent:@"Documents"] 
                       URLByAppendingPathComponent:filename];
    
    dispatch_queue_t q_default;
    q_default = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q_default, ^(void) {
        NSFileManager *fileManager = [[NSFileManager alloc] init];
        NSError *error = nil;
        BOOL success = NO;
        success= [fileManager setUbiquitous:YES itemAtURL:destinationURL
                                   destinationURL:cloudUrl error:&error];
        dispatch_queue_t q_main = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(q_main, ^(void) {
            //NSLog(@"moved file to cloud: " );
            if (success) {
                NSLog(@"moved file to cloud: %@",[cloudUrl description] );
            }else {
                NSLog(@"could not moved file to cloud: %@",[error description] );
            }
            //if (!success) {
            //    NSLog(@"Couldn't move file to iCloud: %@", fileToMove);
            //}
        });
    });
}
- (IBAction)saveDocument:(id)sender
{
    self.document.userText = textView.text;
    
    [document saveToURL:documentURL 
       forSaveOperation:UIDocumentSaveForOverwriting
      completionHandler:^(BOOL success) {
          if (success){
              
              NSLog(@"Saved for overwriting");
              //[self moveFileToiCloud:documentURL];
              
              NSLog(@"moved file to cloud: " );
              
          } else {
              NSLog(@"Not saved for overwriting");
          }
      }];

    
}

- (IBAction)revertDocument:(id)sender
{

    [document revertToContentsOfURL:documentURL 
                  completionHandler:^(BOOL success){
        if (success){
            NSLog(@"revert");
        } else {
            NSLog(@"Not revert");
        }
    }];
     textView.text = self.document.userText;
}

- (IBAction)cloudToLocal:(id)sender {
    NSError *err = nil;
    [document readFromURL:documentURL error:&err
                      ];
        textView.text = self.document.userText;
}

- (void)queryDidFinishGathering:(NSNotification *)notif {
    NSMetadataQuery *aQuery = [notif object];
    [aQuery disableUpdates];
    [aQuery stopQuery];
    //[self loadRemoteFile:query];
    
    NSLog(@"queryDidFinishGathering %d",[aQuery resultCount]);
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSMetadataQueryDidFinishGatheringNotification object:aQuery];
}
-(void)queryDidUpdate:(id)obj

{
    
    /*
     [[NSNotificationCenter defaultCenter] removeObserver:self
     
     name:nil
     
     object:_query];
     */
    //[_query stopQuery];
    NSLog(@"! %d",[_query resultCount]);
	
    
}
- (void) startMonitoringUbiquitousDocumentsFolder
{
    //Check for iCloud
    NSURL *ubiq = [[NSFileManager defaultManager] 
                   URLForUbiquityContainerIdentifier:nil];
    if (ubiq) {
        NSLog(@"iCloud access at %@", ubiq);
        self.query = [[NSMetadataQuery alloc] init] ;
        [self.query setSearchScopes:[NSArray arrayWithObject:
                                     NSMetadataQueryUbiquitousDocumentsScope]];
        _isiCloudEnabled = YES;
    } else {
        NSLog(@"No iCloud access");
        //Get the doc directory
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        self.query = [[NSMetadataQuery alloc] init] ;
        [self.query setSearchScopes:[NSArray arrayWithObjects:
                                     [NSURL fileURLWithPath:path],nil]];
        _isiCloudEnabled = NO;
    }
    //NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K.pathExtension = ''", NSMetadataItemFSNameKey];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K == %@", NSMetadataItemFSNameKey, @"document.doc"];

    //NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K ENDSWITH '.doc'", NSMetadataItemFSNameKey];
    [self.query setPredicate:pred];
    [[NSNotificationCenter defaultCenter] 
     addObserver:self 
     selector:@selector(queryDidFinishGathering:) 
     name:NSMetadataQueryDidFinishGatheringNotification 
     object:self.query];
    
    [self.query startQuery];
}
- (void) stopMonitoringUbiquitousDocumentsFolder
{
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:NSMetadataQueryDidFinishGatheringNotification
     object:nil];
    [query stopQuery];
    query = nil;
}



- (IBAction)searchDocument:(id)sender
{
    
    [self startMonitoringUbiquitousDocumentsFolder ];
    

}
- (IBAction)testButton:(id)sender
{
    NSLog(@"TEST ");
    NSArray *dirPaths = 
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask, YES);
    
    NSString *docsDir = [dirPaths objectAtIndex:0];
    NSString *dataFile = 
    [docsDir stringByAppendingPathComponent: 
     @"document.doc"];
    
    NSURL *url = [NSURL fileURLWithPath:dataFile];
    //UIDocumentはFilePresenter準拠。
    UIDocument *doc = [[UIDocument alloc] initWithFileURL:url];
    NSFileCoordinator *coodinator = [[NSFileCoordinator alloc] initWithFilePresenter:doc];
    
    NSLog(@"TEST ");
    NSError *aerror = nil;
    __block NSError *error = nil;
    __block NSString *readStr = nil;
    //読み込み
    [coodinator coordinateReadingItemAtURL:url options:0 error:&aerror 
                                byAccessor:^(NSURL* newUrl)
     {
         NSLog(@"TEST 3");
         //readStr = [NSString stringWithContentsOfURL:newUrl 
         //                                   encoding:NSUTF8StringEncoding error:&error];
         NSData *contents = [NSData dataWithContentsOfURL:newUrl];
         readStr = [[NSString alloc] 
                              initWithBytes:[contents bytes] 
                              length:[contents length] 
                              encoding:NSUTF8StringEncoding];
         
         //[textView.textStorage.mutableString setString:text];
         //[textView setNeedsDisplay:YES];
     }];
    NSLog(@"READ str = %@",readStr);
    NSLog(@"READ err = %@",[coodinator description]);
    
    
    NSString *writeStr = [NSString stringWithFormat:@"%@%@",readStr,@"+"];
    
                              
    [coodinator coordinateWritingItemAtURL:url
                                   options:NSFileCoordinatorWritingForMoving
                                     error:&error
                                byAccessor:^(NSURL *newURL)
     {
         
         //NSError *writeErr;
         NSData *wData = [writeStr dataUsingEncoding:NSUTF8StringEncoding];
         [wData writeToURL:newURL atomically:YES];
         /*
         [writeStr writeToURL:newURL atomically:YES
                     encoding:NSUTF8StringEncoding error:&writeErr];
         
         NSFileVersion *localVersion = [NSFileVersion currentVersionOfItemAtURL:newURL];
         
         NSArray *remoteVersions = [NSFileVersion unresolvedConflictVersionsOfItemAtURL:newURL];
         NSArray *otherVersions = [NSFileVersion otherVersionsOfItemAtURL:newURL];
         */
         
         //NSLog(@"remote  = %@",[remoteVersions description]);
         
     }];
    
    
}
#pragma mark Read Data
- (void)moveiCloudToLocal:(NSURL *)destinationURL {
    NSURL* aCloudUrl = 
    [[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil];
    NSString *filename=nil;
    [destinationURL getResourceValue:&filename forKey:NSURLNameKey error:nil];
    
    NSURL *cloudUrl = [aCloudUrl
                       URLByAppendingPathComponent:filename];
    
    dispatch_queue_t q_default;
    q_default = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q_default, ^(void) {
        NSFileManager *fileManager = [[NSFileManager alloc] init];
        NSError *error = nil;
        BOOL success = [fileManager setUbiquitous:NO itemAtURL:destinationURL
                                   destinationURL:cloudUrl error:&error];
        dispatch_queue_t q_main = dispatch_get_main_queue();
        dispatch_async(q_main, ^(void) {
            NSLog(@"moved file to local " );
            if (success) {
                NSLog(@"moved file to local " );
            }else {
                NSLog(@"could not moved local: %@",[error description] );
            }
            //if (!success) {
            //    NSLog(@"Couldn't move file to iCloud: %@", fileToMove);
            //}
        });
    });
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSArray *dirPaths = 
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                        NSUserDomainMask, YES);
    
    NSString *docsDir = [dirPaths objectAtIndex:0];
    NSString *dataFile = 
    [docsDir stringByAppendingPathComponent: 
     @"document.doc"];
    
    self.documentURL = [NSURL fileURLWithPath:dataFile];
    self.document = [[MyDocument alloc] initWithFileURL:documentURL];
    self.document.userText = @"";
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    [self moveiCloudToLocal:documentURL];
        
    if ([filemgr fileExistsAtPath: dataFile])
    {
        [document openWithCompletionHandler:
         ^(BOOL success) {
             if (success){
                 NSLog(@"Opened %@",self.document.userText);
                 textView.text = document.userText;
             } else {
                 NSLog(@"Not opened");
             }
         }];
        
    } else {
        [document saveToURL:documentURL
           forSaveOperation: UIDocumentSaveForCreating
          completionHandler:^(BOOL success) {
              if (success){
                  NSLog(@"Created");
              } else {
                  NSLog(@"Not created");
              }
          }];
    }

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
