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
                                                 name:nil //name:NSMetadataQueryDidUpdateNotification
                                               object:_query];
        
        
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
    [self method001];
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
