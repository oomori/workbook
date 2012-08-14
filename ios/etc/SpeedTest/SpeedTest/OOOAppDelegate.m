//
//  OOOAppDelegate.m
//  SpeedTest
//
//  Created by 大森 智史 on 12/05/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

#import <mach/mach_time.h>

@implementation OOOAppDelegate

@synthesize window = _window;

-(void)method001
{
    
    
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //ナノ秒レベルの時間計測
    //<mach/mach_time.h>が必要
    //Saki さん Thanks!
    //http://blog.livedoor.jp/yousuke_saki/archives/51494672.html
    uint64_t start, elapsed;
    start = mach_absolute_time();
    //↓計測対象
    [self method001];
    //↑計測対象
    elapsed = mach_absolute_time() - start;
    mach_timebase_info_data_t base;
    mach_timebase_info(&base);
    uint64_t nsec = elapsed * base.numer / base.denom;
    NSLog(@"%llu nano second",nsec);
    //時間計測終了
    
    //ローカル通知を受ける
    UILocalNotification *localNotif = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNotif) {
        NSNumber *num = [localNotif.userInfo objectForKey:@"Key"];
        NSLog(@"%s, didFinishLaunchingWithOptions: %d", __FUNCTION__, [num integerValue]);
        application.applicationIconBadgeNumber = [num integerValue];
    }
    //
    
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
