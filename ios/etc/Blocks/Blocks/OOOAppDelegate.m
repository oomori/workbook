//
//  OOOAppDelegate.m
//  Blocks
//
//  Created by 大森 智史 on 12/06/10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark Blocks 
-(void)method001
{
    
    int m = 10;
    //blockオブジェクトblockObjの定義
    void (^blockObj)(int) = ^(int i){NSLog(@"%s , %d ",__FUNCTION__,i); };
    
    //blockObjは関数のように呼び出し可能
    blockObj(5);
    blockObj(m * 2);
    
}

#pragma mark Blocks
void function002(int (^block)(int))
{
    int aValue = block(10);
    NSLog(@"%s , %d ",__FUNCTION__,aValue);
    //=>function002 , 20 
}
-(void)method002
{
    //blockオブジェクトblockObjの定義
    //単に倍にして返す
    int (^blockObj)(int) = ^(int x){ return x * 2 ;};
    
    
    //4を渡す
    NSLog(@"%s , %d ",__FUNCTION__,blockObj(4));
    //=>-[OOOAppDelegate method002] , 8 
    
    //引数にBlockオブジェクトを渡す
    //2倍にするblockオブジェクトを渡す
    function002(blockObj);
    
    
    //10から1まで順番に足していくblockオブジェクトを渡す
    //function002ではblockオブジェクトに10が渡されるので、aには10が入る。
    //aは10なので、iの初期値は10。それから9,8,7...となり、最後は1。
    //totalはiを順番に足していくので10+9+8+...+2+1で結果は55
    function002(^(int a){
        int i, total = 0;
        for (i = a; i > 0; i--){
                total += i;
            //printf("%d\n",k);
            };
            return total;
        
        });
     
}

#pragma mark Blocks 
//typedefで定義してみる
typedef int (^myBlockType)(int);
void function003(myBlockType aBlock)
{
    int aValue = aBlock(10);
    NSLog(@"%s , %d ",__FUNCTION__,aValue);
    //=>function002 , 20 
}
-(void)method003
{
    //blockオブジェクトblockObjの定義
    //単に倍にして返す
    int (^blockObj)(int) = ^(int x){ return x * 2 ;};
    
    
    //4を渡す
    NSLog(@"%s , %d ",__FUNCTION__,blockObj(4));
    //=>-[OOOAppDelegate method002] , 8 
    
    //引数にBlockオブジェクトを渡す
    //2倍にするblockオブジェクトを渡す
    function003(blockObj);
    
    
    //10から1まで順番に足していくblockオブジェクトを渡す
    //function002ではblockオブジェクトに10が渡されるので、aには10が入る。
    //aは10なので、iの初期値は10。それから9,8,7...となり、最後は1。
    //totalはiを順番に足していくので10+9+8+...+2+1で結果は55
    function003(^(int a){
        int i, total = 0;
        for (i = a; i > 0; i--){
            total += i;
            //printf("%d\n",k);
        };
        return total;
        
    });
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
    [self method002];
    [self method003];
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
