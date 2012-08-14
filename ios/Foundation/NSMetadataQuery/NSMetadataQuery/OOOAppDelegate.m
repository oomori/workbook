//
//  OOOAppDelegate.m
//  NSMetadataQuery
//
//  Created by 大森 智史 on 12/05/17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;
@synthesize query = _query;
#pragma mark initWithObjects:


-(void)initalGatherComplete:(id)obj

{
    NSLog(@"initalGatherComplete ! %d",[_query resultCount]);
    
}

-(void)queryDidUpdate:(id)obj

{
    
    /*
	[[NSNotificationCenter defaultCenter] removeObserver:self
     
													name:nil
     
												  object:_query];
    */
    [_query stopQuery];
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
                                     NSMetadataQueryUbiquitousDataScope]];
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
    
    NSPredicate *pred = [NSPredicate predicateWithFormat: 
                         @"%K like %@", NSMetadataItemFSNameKey, @"*.adoc"];
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
-(void)method001
{
    
    NSString *searchString = @"new";
    _query = [[NSMetadataQuery alloc] init];
    /*
    NSString *predicateFormat = @"(kMDItemTextContent == \"?%@*\"c) && (kMDItemContentType != 'com.apple.mail.emlx') && (kMDItemContentType != 'public.vcard')";
    
    NSPredicate * subPredicate = [NSPredicate predicateWithFormat:
                                      @"kMDItemTextContent like[cd] %@", 
                                      [searchString stringByAppendingString:@"*"]];
    NSPredicate *predicate = [NSCompoundPredicate andPredicateWithSubpredicates:
                     [NSArray arrayWithObjects:subPredicate, nil]];

    */
    //NSPredicate * predicate = [NSPredicate predicateWithFormat:
      //                         @"kMDItemContentType == 'com.apple.mail.emlx'"];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:
                               @"kMDItemContentType == 'public.image'"];
    
    [_query setPredicate:predicate];
    
    
    if (searchString != nil) {
        NSPredicate * subPredicate = [NSPredicate predicateWithFormat:
                                      @"kMDItemTextContent like[cd] %@", 
                                      [searchString stringByAppendingString:@"*"]];
    NSCompoundPredicate *comPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:
                     [NSArray arrayWithObjects:predicate, subPredicate, nil]];
        
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(queryDidUpdate:)
                                                 name:NSMetadataQueryDidUpdateNotification
                                               object:_query];
        
    [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(initalGatherComplete:)
                                                     name:NSMetadataQueryDidFinishGatheringNotification
                                                   object:_query]; 
        NSArray *searchScopes=[NSArray arrayWithObjects:NSMetadataQueryUbiquitousDataScope,nil];
        [_query setSearchScopes:searchScopes];
        [_query startQuery];
        NSLog(@"%s %@",__FUNCTION__,[query description]);
    }
    
    /*
    [_query setValueListAttributes:
     [NSArray arrayWithObjects:
      (id)kMDItemContentType,
      (id)kMDItemDisplayName,
      @"jp_natori_Thousand_thread_threadInternalPath",
      @"jp_natori_Thousand_thread_resCount",
      @"jp_natori_Thousand_thread_label",
      nil]];
     */
    //[_query setSearchScopes:[NSArray arrayWithObject:[NSString appLogFolderPath]]];
    
    
    
	
    
    
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //[self method001];
    [self startMonitoringUbiquitousDocumentsFolder];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
