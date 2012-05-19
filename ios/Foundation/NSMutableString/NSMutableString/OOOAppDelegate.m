//
//  OOOAppDelegate.m
//  NSMutableString
//
//  Created by 大森 智史 on 12/05/06.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark -replaceOccurrencesOfString:withString:options:range:
-(void)method001
{
    NSMutableString *muString = [[NSMutableString alloc] initWithCapacity:0];
    [muString appendString:@"If into in onto of often on and ON"];
    [muString replaceOccurrencesOfString:@"\\b(i|o)(f|n)\\b" //\\bはスペース(i|o)はiまたはo
                                                     withString:@"$2$1" //2番目の要素が前にきて、1番目の要素があとに来る
                                                        options:NSRegularExpressionSearch 
                                                          range:NSMakeRange(0,[muString length])
                      ];
    NSLog(@"%s : %@",__FUNCTION__ ,muString);
    //=-[OOOAppDelegate method001] : If into ni onto fo often no and ON

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
