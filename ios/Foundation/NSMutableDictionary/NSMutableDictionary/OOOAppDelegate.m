//
//  OOOAppDelegate.m
//  NSMutableDictionary
//
//  Created by 大森 智史 on 12/07/02.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;


#pragma mark NSMutableDictionary valueForKey
-(void)method001
{
    NSMutableDictionary *aDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:1] ,@"key1",[NSNumber numberWithInt:2] ,@"key2",[NSNumber numberWithInt:3] ,@"key3", nil];
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary objectForKey:@"@count"]);
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary valueForKey:@"@count"]);
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary objectForKey:@"@allKeys"]);
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary valueForKey:@"@allKeys"]);
    
    [aDictionary setValue:@"ddd" forKey:@"key4"];
    
    [aDictionary setObject:[NSNumber numberWithInt:1] forKey:@"eee"];

    
    
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary valueForKey:@"@allKeys"]);
    
    
}

#pragma mark NSMutableDictionary dictionaryWithCapacity
-(void)method002
{
    NSMutableDictionary *aDictionary = [NSMutableDictionary dictionaryWithCapacity:10];

    [aDictionary setValue:@"ddd" forKey:@"key4"];
    
    [aDictionary setObject:[NSNumber numberWithInt:1] forKey:@"eee"];
    
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary valueForKey:@"@allKeys"]);
    //=>-[OOOAppDelegate method002] 0x6c15440 (key4,eee)
    
}

#pragma mark NSMutableDictionary NSValue
-(void)method003
{
    NSMutableDictionary *aDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    
    [aDictionary setValue:@"ddd" forKey:@"key4"];
    
    NSRange aRange = NSMakeRange(0, 10);
    [aDictionary setObject:[NSValue valueWithRange:aRange] forKey:@"eee"];
    
    
    [aDictionary setObject:[NSValue value:&aRange withObjCType:@encode(NSRange)] forKey:@"fff"];
    
    NSLog(@"%s %p %@",__FUNCTION__,aDictionary,[aDictionary valueForKey:@"@allValues"]);
    //=>-[OOOAppDelegate method003] 0x6a2ac10 (ddd,"NSRange: {0, 10}","NSRange: {0, 10}")
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self method001];
    [self method002];
    
    [self method003];
    
    
    
    
    
    
    
    
    // Override point for customization after application launch.
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
