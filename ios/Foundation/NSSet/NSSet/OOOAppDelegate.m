//
//  OOOAppDelegate.m
//  NSSet
//
//  Created by 大森 智史 on 12/05/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"
#import "CustomClass.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark enumerateObjectsUsingBlock:
/*
 CustomClass.m
 -(NSMutableString *)appendSomeString
{
    [customClassValue appendString:@"!"];
    return customClassValue;
    
}
*/
-(void)method001
{
    CustomClass *customClass1 = [[CustomClass alloc] init];
    NSMutableString *muStr1 = [[NSMutableString alloc] initWithCapacity:0];
    [muStr1 appendString:@"aaa"];
    [customClass1 setCustomClassValue:muStr1];
    CustomClass *customClass2 = [[CustomClass alloc] init];
    NSMutableString *muStr2 = [[NSMutableString alloc] initWithCapacity:0];
    [muStr2 appendString:@"bbb"];
    [customClass2 setCustomClassValue:muStr2];
    CustomClass *customClass3 = [[CustomClass alloc] init];
    NSMutableString *muStr3 = [[NSMutableString alloc] initWithCapacity:0];
    [muStr3 appendString:@"ccc"];
    [customClass3 setCustomClassValue:muStr3];

    NSMutableSet *muSet = [NSMutableSet setWithObjects:customClass1,
                           customClass2,
                           customClass3,
                           nil];
    
    NSLog(@"%s %@",__FUNCTION__, [muSet description]);
    [muSet enumerateObjectsUsingBlock:^(id obj,BOOL *stop) {
        //appendSomeStringは末尾に ! を付けるだけのメソッド
        [obj appendSomeString];
            //if ([obj isEqualToString:@"bbb"]) {
                //*stop = YES;   
            //}
            }];
    
    NSLog(@"%s %@",__FUNCTION__, [muSet description]);
    //=>-[OOOAppDelegate method001] {(bbb,ccc,aaa)}
    //=>-[OOOAppDelegate method001] {(bbb!,ccc!,aaa!)}
    
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
