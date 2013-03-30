//
//  OOOAppDelegate.m
//  Bezier
//
//  Created by 大森 智史 on 2013/03/03.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize pathObjects;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    pathObjects = [NSMutableArray arrayWithCapacity:3];
    OOOPointObject *pointObj1 = [[OOOPointObject alloc] init];
    pointObj1.startPoint = CGPointMake(200.0,200.0);
    pointObj1.endPoint = CGPointMake(400.0,200.0);
    pointObj1.p1Offset = CGPointMake(20.0,-50.0);
    pointObj1.p2Offset = CGPointMake(-20.0,-50.0);
    
    NSMutableArray *pointArray = [NSMutableArray arrayWithCapacity:3];
    [pointArray addObject:pointObj1];
    
    OOOPathObject *pathObj = [[OOOPathObject alloc] init];
    pathObj.startPoint = CGPointMake(200.0,200.0);
    pathObj.pointArray = pointArray;
    [pathObjects addObject:pathObj];
    
    
    //2つ目のポイント
//    OOOPointObject *pointObj2 = [[OOOPointObject alloc] init];
//    pointObj2.startPoint = CGPointMake(400.0,200.0);
//    pointObj2.endPoint = CGPointMake(600.0,400.0);
//    pointObj2.p1Offset = CGPointMake(20.0,-50.0);
//    pointObj2.p2Offset = CGPointMake(-20.0,-50.0);
//    
//    NSMutableArray *pointArray2 = [NSMutableArray arrayWithCapacity:3];
//    [pointArray2 addObject:pointObj2];
//    
//    OOOPathObject *pathObj2 = [[OOOPathObject alloc] init];
//    pathObj.startPoint = CGPointMake(400.0,200.0);
//    pathObj.pointArray = pointArray;
//    [pathObjects addObject:pathObj2];
//    
    
    NSLog(@"%.2f",pathObj.startPoint.x);
    
    
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
