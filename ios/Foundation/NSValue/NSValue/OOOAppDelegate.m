//
//  OOOAppDelegate.m
//  NSValue
//
//  Created by 大森 智史 on 12/07/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark NSValue @encode(NSRange)
-(void)method001
{
    NSMutableDictionary *aDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    
    [aDictionary setValue:@"ddd" forKey:@"key4"];
    
    NSRange aRange = NSMakeRange(0, 10);
    [aDictionary setObject:[NSValue valueWithRange:aRange] forKey:@"eee"];
    
    
    [aDictionary setObject:[NSValue value:&aRange withObjCType:@encode(NSRange)] forKey:@"fff"];
    
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary valueForKey:@"@allValues"]);
    //=>-[OOOAppDelegate method001] 0x6a2ac10 (ddd,"NSRange: {0, 10}","NSRange: {0, 10}")
    
}


#pragma mark NSValue @encode(myStruct)
typedef struct {	
    NSUInteger point;
    NSUInteger length;
} MYStruct;
-(void)method002
{
    NSMutableDictionary *aDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    
    [aDictionary setValue:@"ddd" forKey:@"key4"];
    
    NSRange aRange = NSMakeRange(0, 10);
    [aDictionary setObject:[NSValue valueWithRange:aRange] forKey:@"eee"];
    
    MYStruct myStruct;
    myStruct.point = 0;
    myStruct.length = 10;
    
    
    [aDictionary setObject:[NSValue value:&myStruct withObjCType:@encode(MYStruct)] forKey:@"fff"];
    
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary valueForKey:@"@allValues"]);
    
    NSValue *structValue = [aDictionary objectForKey:@"fff"];
    MYStruct myStruct2;
	
    [structValue getValue:&myStruct2];
    
    NSLog(@"%s %p %d",__FUNCTION__,aDictionary,myStruct2.length);
    //=>
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
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
