//
//  OOOAppDelegate.m
//  Accelerate
//
//  Created by air on 2013/10/05.
//  Copyright (c) 2013年 oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

#import <Accelerate/Accelerate.h>
#import <mach/mach_time.h>

#pragma mark vsinf サイン
-(void)method001
{
    vFloat valueArray = {0.0f,1.0f,2.0f,3.0f};
    vFloat resultArray = vsinf(valueArray);
    for (int i=0; i<4; i++) {
        printf("%f,",resultArray[i]);
    //=>0.000000,0.841471,0.909297,0.141120,
    }
    printf("\n");
}
-(void)method002
{
    vFloat valueArray = {0.0f,1.0f,2.0f,3.0f};
    vFloat resultArray = vcosf(valueArray);
    for (int i=0; i<4; i++) {
        printf("%f,",resultArray[i]);
        //=>1.000000,0.540302,-0.416147,-0.989992,
    }
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self method001];
    [self method002];
    
    
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
