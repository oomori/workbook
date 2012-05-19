//
//  OOOAppDelegate.m
//  NSBlockOperation
//
//  Created by 大森 智史 on 12/05/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark NSBlockOperation addOperation:

-(void)method001
{
    NSMutableString *muStr = [NSMutableString stringWithCapacity:0];
    [muStr appendString:@"string"];
    
    //一つ目の処理
    NSBlockOperation* operation = [NSBlockOperation blockOperationWithBlock: ^{
        for (NSInteger i=0; i < 10; i++) {
            [muStr performSelectorInBackground:@selector(appendString:)
                                    withObject:@"+"];
            NSLog(@"muStr %@ ", muStr);
            [NSThread sleepForTimeInterval:1.0];
        }
    }];
    
    //2つめの処理を追加
    [operation addExecutionBlock:^{
        NSLog(@"NSThread: %p", [NSThread currentThread]);
        for (NSInteger i=0; i < 5; i++) {
            NSLog(@"muStr %d", i);
            [NSThread sleepForTimeInterval:1.5];
        }
    }];
    
    // 終了時処理
    [operation setCompletionBlock:^{
        NSLog(@"end");
    }];
    
    //実行
    [operation start];
    
    

    
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
