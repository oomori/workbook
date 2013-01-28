//
//  OOOAppDelegate.m
//  NSByteCountFormatter
//
//  Created by 大森 智史 on 2012/10/23.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

#pragma mark NSByteCountFormatter stringFromByteCount:countStyle:
-(void)method001
{
    NSString *string = [NSByteCountFormatter stringFromByteCount:1024 countStyle:NSByteCountFormatterCountStyleMemory];
    NSLog(@"%s %@",__FUNCTION__,string);
}

#pragma mark NSByteCountFormatter stringFromByteCount:
-(void)method002
{
    NSByteCountFormatter *bcf = [[NSByteCountFormatter alloc] init];
    bcf.countStyle = NSByteCountFormatterCountStyleMemory;
    NSString *string = [bcf stringFromByteCount:1024];
    NSLog(@"%s %@",__FUNCTION__,string);
}

#pragma mark NSByteCountFormatter stringFromByteCount:
-(void)method003
{
    NSByteCountFormatter *bcf = [[NSByteCountFormatter alloc] init];
    bcf.countStyle = NSByteCountFormatterCountStyleMemory;
    bcf.allowsNonnumericFormatting = NO;
    NSLog((bcf.allowsNonnumericFormatting)?@"YES":@"NO");
    NSString *string = [bcf stringFromByteCount:1300];
    NSLog(@"%s %@",__FUNCTION__,string);
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
    [self method002];
    
    [self method003];
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
