//
//  OOOAppDelegate.m
//  NSCache
//
//  Created by 大森 智史 on 12/05/06.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

//キャッシュオブジェクトが破棄される時に呼び出される
- (void)cache:(NSCache *)cache willEvictObject:(id)obj
{
    NSLog(@"%s :%@: remove %@ ", __FUNCTION__,[cache name],[obj description]);

    
    
}
#pragma mark setCountLimit:
-(void)method001
{
    
    NSCache *aCache = [[NSCache alloc] init]; 
    [aCache setCountLimit:3];
    [aCache setName:@"method001"];
    
    [aCache setObject:@"Obj1" forKey:@"key1"]; 
    NSLog(@"%s : %@,%@,%@,%@,%@", __FUNCTION__,[aCache objectForKey:@"key1"],[aCache objectForKey:@"key2"],[aCache objectForKey:@"key3"],[aCache objectForKey:@"key4"],[aCache objectForKey:@"key5"]);
    
    [aCache setObject:@"Obj2" forKey:@"key2"]; 
    NSLog(@"%s : %@,%@,%@,%@,%@", __FUNCTION__,[aCache objectForKey:@"key1"],[aCache objectForKey:@"key2"],[aCache objectForKey:@"key3"],[aCache objectForKey:@"key4"],[aCache objectForKey:@"key5"]);
    [aCache setObject:@"Obj3" forKey:@"key3"]; 
    NSLog(@"%s : %@,%@,%@,%@,%@", __FUNCTION__,[aCache objectForKey:@"key1"],[aCache objectForKey:@"key2"],[aCache objectForKey:@"key3"],[aCache objectForKey:@"key4"],[aCache objectForKey:@"key5"]);
    [aCache setObject:@"Obj4" forKey:@"key4"]; 
    NSLog(@"%s : %@,%@,%@,%@,%@", __FUNCTION__,[aCache objectForKey:@"key1"],[aCache objectForKey:@"key2"],[aCache objectForKey:@"key3"],[aCache objectForKey:@"key4"],[aCache objectForKey:@"key5"]);
    [aCache setObject:@"Obj5" forKey:@"key5"]; 
    NSLog(@"%s : %@,%@,%@,%@,%@", __FUNCTION__,[aCache objectForKey:@"key1"],[aCache objectForKey:@"key2"],[aCache objectForKey:@"key3"],[aCache objectForKey:@"key4"],[aCache objectForKey:@"key5"]);
    
    // countLimitが3の場合、最初の2つは保持されるが、最後のオブジェクトは新しいオブジェクトをセットしようとすると破棄される。
    //=>-[OOOAppDelegate method001] : Obj1,(null),(null),(null),(null)
    //=>-[OOOAppDelegate method001] : Obj1,Obj2,(null),(null),(null)
    //=>-[OOOAppDelegate method001] : Obj1,Obj2,Obj3,(null),(null)
    //=>-[OOOAppDelegate method001] : Obj1,Obj2,(null),Obj4,(null)
    //=>-[OOOAppDelegate method001] : Obj1,Obj2,(null),(null),Obj5
    
}

#pragma mark setTotalCostLimit:
-(void)method002
{
    //コスト
    //どのオブジェクトが削除されるかは分からないが、コストが大きいものが削除されるわけではないみたい。どちらかというと新しいものから除去されるみたい
    
    NSCache *aCache = [[NSCache alloc] init]; 
    [aCache setDelegate:self];
    [aCache setTotalCostLimit:3];
    [aCache setName:@"method002"];
    
    [aCache setObject:@"Obj1" forKey:@"key1" cost:1]; 
    NSLog(@"%s : %@,%@,%@,%@,%@", __FUNCTION__,[aCache objectForKey:@"key1"],[aCache objectForKey:@"key2"],[aCache objectForKey:@"key3"],[aCache objectForKey:@"key4"],[aCache objectForKey:@"key5"]);
    [aCache setObject:@"Obj2" forKey:@"key2" cost:1]; 
    NSLog(@"%s : %@,%@,%@,%@,%@", __FUNCTION__,[aCache objectForKey:@"key1"],[aCache objectForKey:@"key2"],[aCache objectForKey:@"key3"],[aCache objectForKey:@"key4"],[aCache objectForKey:@"key5"]);
    [aCache setObject:@"Obj3" forKey:@"key3" cost:10]; 
    NSLog(@"%s : %@,%@,%@,%@,%@", __FUNCTION__,[aCache objectForKey:@"key1"],[aCache objectForKey:@"key2"],[aCache objectForKey:@"key3"],[aCache objectForKey:@"key4"],[aCache objectForKey:@"key5"]);
    [aCache setObject:@"Obj4" forKey:@"key4" cost:1]; 
    NSLog(@"%s : %@,%@,%@,%@,%@", __FUNCTION__,[aCache objectForKey:@"key1"],[aCache objectForKey:@"key2"],[aCache objectForKey:@"key3"],[aCache objectForKey:@"key4"],[aCache objectForKey:@"key5"]);
    [aCache setObject:@"Obj5" forKey:@"key5" cost:1]; 
    NSLog(@"%s : %@,%@,%@,%@,%@", __FUNCTION__,[aCache objectForKey:@"key1"],[aCache objectForKey:@"key2"],[aCache objectForKey:@"key3"],[aCache objectForKey:@"key4"],[aCache objectForKey:@"key5"]);
    
    NSLog(@"end");
    
    // countLimitが3の場合、最初の2つは保持されるが、最後のオブジェクトは新しいオブジェクトをセットしようとすると破棄される。
    //=>-[OOOAppDelegate method001] : Obj1,(null),(null),(null),(null)
    //=>-[OOOAppDelegate method001] : Obj1,Obj2,(null),(null),(null)
    //TotalCostLimitが3なのでobj1=1,obj2=1,obj3=10でリミットを超えるので破棄される
    //=>-[OOOAppDelegate cache:willEvictObject:] : remove Obj2
    //=>-[OOOAppDelegate cache:willEvictObject:] : remove Obj1
    //=>-[OOOAppDelegate cache:willEvictObject:] : remove Obj3
    //=>-[OOOAppDelegate method001] : (null),(null),(null),(null),(null)
    //またキャッシュされる
    //=>-[OOOAppDelegate method001] : (null),(null),(null),Obj4,(null)
    //=>-[OOOAppDelegate method001] : (null),(null),(null),Obj4,Obj5
    //メソッド終了で破棄される
    //=>-[OOOAppDelegate cache:willEvictObject:] : remove Obj4
    //=>-[OOOAppDelegate cache:willEvictObject:] : remove Obj5
    
}
@synthesize window = _window;

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
