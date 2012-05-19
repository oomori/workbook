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

- (IBAction)saveDocument:(id)sender
{
    self.document.userText = textView.text;
    
    [document saveToURL:documentURL 
       forSaveOperation:UIDocumentSaveForOverwriting
      completionHandler:^(BOOL success) {
          if (success){
              NSLog(@"Saved for overwriting");
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
            NSLog(@"Delete");
        } else {
            NSLog(@"Not delete");
        }
    }];
     textView.text = self.document.userText;
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
         
         NSError *writeErr;
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
