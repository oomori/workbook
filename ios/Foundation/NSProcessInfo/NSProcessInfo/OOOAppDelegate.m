//
//  OOOAppDelegate.m
//  NSProcessInfo
//
//  Created by 大森 智史 on 2012/09/08.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

#pragma mark processName
-(void)method001
{
    NSProcessInfo *pInfo = [NSProcessInfo processInfo];
    NSString *processName = [pInfo processName];

    NSLog(@"%s %@",__FUNCTION__,processName);
    
    NSLog(@"%s %@",__FUNCTION__,[pInfo arguments]);
    
    NSLog(@"%s %@",__FUNCTION__,[pInfo environment]);
    
    NSLog(@"%s %d",__FUNCTION__,[pInfo processIdentifier]);
    
    NSLog(@"%s %@",__FUNCTION__,[pInfo globallyUniqueString]);
    
    [pInfo setProcessName:@"newName"];
    NSLog(@"%s %@",__FUNCTION__,[pInfo processName]);
    
    NSLog(@"%s %@",__FUNCTION__,[pInfo hostName]);
    
    NSLog(@"%s %u",__FUNCTION__,[pInfo operatingSystem]);
    
    NSLog(@"%s %@",__FUNCTION__,[pInfo operatingSystemName]);
    
    NSLog(@"%s %@",__FUNCTION__,[pInfo operatingSystemVersionString]);
    
    NSLog(@"%s physicalMemory %llu",__FUNCTION__,([pInfo physicalMemory]/1024/1024));
    NSLog(@"%s %u",__FUNCTION__,[pInfo processorCount]);
    NSLog(@"%s %u",__FUNCTION__,[pInfo activeProcessorCount]);
    NSLog(@"%s %f",__FUNCTION__,[pInfo systemUptime]);
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
