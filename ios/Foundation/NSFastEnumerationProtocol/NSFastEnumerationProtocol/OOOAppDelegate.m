//
//  OOOAppDelegate.m
//  NSFastEnumerationProtocol
//
//  Created by 大森 智史 on 12/05/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"
#import <mach/mach_time.h>

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark NSArray:高速列挙は高速か？
-(void)method001
{
    NSArray *anArray = [NSArray arrayWithObjects:@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",@"aaa",@"bbb",@"ccc",@"ddd",nil];
	
	//Enumeratorを使う場合	
	id obj;
	NSEnumerator *aEnumerator;
	
	
	//ナノ秒レベルの時間計測
    //<mach/mach_time.h>が必要
    //Saki さん Thanks!
    //http://blog.livedoor.jp/yousuke_saki/archives/51494672.html
    uint64_t start, elapsed;
    start = mach_absolute_time();
    //↓計測対象
    aEnumerator = [anArray objectEnumerator];
    while ((obj = [aEnumerator nextObject]) != nil) {
		//NSLog(@"%@",(NSString *)obj);
	}
	//↑計測対象
    elapsed = mach_absolute_time() - start;
    mach_timebase_info_data_t base;
    mach_timebase_info(&base);
    uint64_t nsec1 = elapsed * base.numer / base.denom;
    NSLog(@"%llu nano second",nsec1);
    //時間計測終了
    
	
    start = mach_absolute_time();
    //↓計測対象
    //高速列挙を使う
	id fastObj;
	for (fastObj in anArray) {
		//NSLog(@"%@",(NSString *)fastObj);
	}
    
    //↑計測対象
    elapsed = mach_absolute_time() - start;
    //mach_timebase_info_data_t base;
    mach_timebase_info(&base);
    uint64_t nsec2 = elapsed * base.numer / base.denom;
    NSLog(@"%llu nano second",nsec2);
    
    NSLog(@"%.2f %%",(((float)nsec2/(float)nsec1))*100);
    //時間計測終了
    
    
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
