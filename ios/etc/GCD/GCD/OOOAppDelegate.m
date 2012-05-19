//
//  OOOAppDelegate.m
//  GCD
//
//  Created by 大森 智史 on 12/05/07.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

#import <mach/mach_time.h>

@implementation OOOAppDelegate

@synthesize window = _window;
@synthesize counter ;

@synthesize stop;

UIBackgroundTaskIdentifier bgTask;
#pragma mark GCD



-(void)method001
{

    
    
}
- (void)application:(UIApplication *)app didReceiveLocalNotification:(UILocalNotification *)notif
{
    NSNumber *num = [notif.userInfo objectForKey:@"Key"];
    NSLog(@"%s, didReceiveLocalNotification: %d", __FUNCTION__, [num integerValue]);
    app.applicationIconBadgeNumber = [num integerValue];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
  
    
    
    [self method001];
    
    
    
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
    
    
    
    
    NSLog(@"applicationDidEnterBackground");
    UIApplication*    app = [UIApplication sharedApplication];

    if (stop) {
        [app endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;
        stop = NO;
    }
    bgTask = [app beginBackgroundTaskWithExpirationHandler:^{
        //10分間で処理しきれなかった場合に実行される
        [app endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;
        
    }];
    //10分間バックグラウンドでさせる処理
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // Do the work associated with the task.
        
        int i;
        for(i= 0;i<10000;i++) {
            
         app.applicationIconBadgeNumber = i;
            //;
            
        }
        self.counter = self.counter + i;
        
        //ローカル通知
        while ([application backgroundTimeRemaining] > 1.0) {
            UILocalNotification *localNotif = [[UILocalNotification alloc] init];
            if (localNotif) {
                localNotif.alertBody = [NSString stringWithString:NSLocalizedString(@"background", nil)];
                localNotif.alertAction = NSLocalizedString(@"action", nil);
                localNotif.soundName = UILocalNotificationDefaultSoundName;
                localNotif.applicationIconBadgeNumber = 1;
                localNotif.userInfo=[NSDictionary  dictionaryWithObject:[NSNumber numberWithInteger:1]
                                                                    forKey:@"Key"];
                 //localNotif.userInfo = [[NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:1] forKey:@"Key"];
                [application presentLocalNotificationNow:localNotif];
                break;
            }
        }
        
        //バックグラウンド処理が終わった時に呼ぶ
        [app endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;
    });
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    //うーん、処理が残ってしまう
    
    stop = YES;
    NSLog(@"applicationWillEnterForeground");
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (bgTask != UIBackgroundTaskInvalid) {
            NSLog(@"finished!");
            [[UIApplication sharedApplication] endBackgroundTask:bgTask];
            bgTask = UIBackgroundTaskInvalid;

        }
    });
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
