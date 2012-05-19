//
//  OOOAppDelegate.m
//  NSRegularExpression
//
//  Created by 大森 智史 on 12/05/06.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark -enumerateMatchesInString:options:range:usingBlock:
-(void)method001
{
    NSError *aError = nil;
	NSString *str = [NSString stringWithString:@"http://www.oomori.com?name=oomori&age=44" ];
    NSRegularExpression *regExp = [NSRegularExpression regularExpressionWithPattern:@"([\\w]+)=([\\w]+)" 
                                                                            options:NSRegularExpressionCaseInsensitive
                                                                              error:&aError];
     __block NSMutableDictionary *muDic =  [NSMutableDictionary dictionaryWithCapacity:0];
    [regExp enumerateMatchesInString:str 
                             options:NSMatchingReportProgress 
                               range:NSMakeRange(0,[str length]) 
                          usingBlock:
     ^(NSTextCheckingResult *result ,NSMatchingFlags flags,BOOL *stop )
     {
         if (!(flags & NSMatchingProgress)) {
             NSString *aKey = [str substringWithRange:[result rangeAtIndex:1]];
             NSString *aValue = [str substringWithRange:[result rangeAtIndex:2]];
             [muDic setObject:aValue forKey:aKey];
         }
     }
     
     ];
    NSLog(@"%s%@",__FUNCTION__,[muDic description]);
    //=>-[OOOAppDelegate method001]{age = 44;name = oomori;}
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
