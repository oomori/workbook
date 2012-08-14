//
//  OOOAppDelegate.m
//  NSMutableArray
//
//  Created by 大森 智史 on 12/05/06.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark initWithCapacity:
-(void)method001
{
    NSMutableArray *anArray = [[NSMutableArray alloc] initWithCapacity:0];
    [anArray addObject:@"aaa"];
    [anArray addObject:[NSNumber numberWithFloat:2.0]];
    [anArray addObject:@"bbb"];
    [anArray addObject:@"ccc"];
    
    NSLog(@"%s : %@", __FUNCTION__,[anArray description]);    
    //=>[OOOAppDelegate method001] : (aaa,2,bbb,ccc)
    
    [anArray addObject:@"+++"];
    NSLog(@"%s : %@", __FUNCTION__,[anArray description]);
    //=>[OOOAppDelegate method001] : (aaa,2,bbb,ccc,"+++")
    
    [anArray removeObjectAtIndex:2];
    NSLog(@"%s : %@", __FUNCTION__,[anArray description]);
    //=>[OOOAppDelegate method001] : (aaa,2,ccc,"+++")
}

#pragma mark addObject:
-(void)method002
{
    NSMutableArray *anArray = [[NSMutableArray alloc] initWithCapacity:0];
    [anArray addObject:@"aaa"];
    [anArray addObject:[NSNumber numberWithFloat:2.0]];
    [anArray addObject:@"bbb"];
    [anArray addObject:@"ccc"];
    
    NSLog(@"%s : %@", __FUNCTION__,[anArray description]);    
    //=>[OOOAppDelegate method001] : (aaa,2,bbb,ccc)
    
    [anArray addObject:@"+++"];
    NSLog(@"%s : %@", __FUNCTION__,[anArray description]);
    //=>[OOOAppDelegate method001] : (aaa,2,bbb,ccc,"+++")
    
    [anArray removeObjectAtIndex:2];
    NSLog(@"%s : %@", __FUNCTION__,[anArray description]);
    //=>[OOOAppDelegate method001] : (aaa,2,ccc,"+++")
}

#pragma mark sortUsingSelector:
-(void)method003
{
    
    NSMutableArray *anArray = [[NSMutableArray alloc] initWithCapacity:0];
    [anArray addObject:@"aaa"];
    [anArray addObject:@"cccc"];
    [anArray addObject:@"bbb"];
    [anArray addObject:@"a"];
    
    //普通に
    [anArray sortUsingSelector:@selector(compare:)];
    NSLog(@"%s compare: %@",__FUNCTION__,[anArray description]);
    //=>[OOOAppDelegate method003] compare: (a,aaa,bbb,cccc)
    
    //NSString+Extractとしてカテゴリを作っている。comparePlus:というメソッドを作成済み。
    //これは単に文字の長さが長いかを比べるメソッド
    [anArray sortUsingSelector:@selector(compareLength:)];
    
    NSLog(@"%s compare: %@",__FUNCTION__,[anArray description]);
    //=>[OOOAppDelegate method003] compare: (cccc,aaa,bbb,a)
}

#pragma mark removeObjectIdenticalTo:
-(void)method004
{
    NSMutableArray *anArray = [[NSMutableArray alloc] initWithCapacity:10];
    NSString *aaa1 = [NSString stringWithFormat:@"a%@%@",@"a",@"a"];
    NSString *aaa2 = [NSString stringWithFormat:@"a%@%@",@"a",@"a"];
    NSString *aaa3 = [NSString stringWithFormat:@"%@a%@",@"a",@"a"];
    
    [anArray addObject:aaa1];
    [anArray addObject:aaa2];
    [anArray addObject:aaa3];
    
    //それぞれのアドレスを確認
    NSLog(@"aaa1=%p ",aaa1);
    NSLog(@"aaa2=%p ",aaa2);
    NSLog(@"aaa3=%p ",aaa3);
    
    NSLog(@"%s : %@", __FUNCTION__,[anArray description]);    
    //=>[OOOAppDelegate method004] : (aaa,aaa,aaa)
    
    //aaa2だけを除去
    [anArray removeObjectIdenticalTo:aaa2];
    if ([anArray indexOfObjectIdenticalTo:aaa2]== NSNotFound) {
        NSLog(@"NO");
    }
    
    NSLog(@"%s : %@", __FUNCTION__,[anArray description]);
    //=>[OOOAppDelegate method004] : (aaa,aaa,aaa)
    
    //@"aaa"の内容を持つオブジェクトを除去
    [anArray removeObject:@"aaa"];
    NSLog(@"%s : %@", __FUNCTION__,[anArray description]);
    //=>[OOOAppDelegate method004] : ()

}

#pragma mark NSMutableArray  filterUsingPredicate:
-(void)method005
{
    NSMutableArray *anArray = [NSMutableArray arrayWithObjects:@"aaa", @"bbb", @"ccc", @"ddd", nil];
    NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] 'b'"];
    
    
    NSLog(@"%s  %@",__FUNCTION__,[anArray description]);
    //=>[OOOAppDelegate method005] (aaa,bbb,ccc,ddd)
    
    [anArray filterUsingPredicate:bPredicate];
    NSLog(@"%s  %@",__FUNCTION__,[anArray description]);
    //=>[OOOAppDelegate method005] (bbb)
}


#pragma mark sortedArrayWithOptions:usingComparator:
-(void)method006
{
    NSMutableArray *anArray = 
    [[NSMutableArray alloc] initWithObjects:   @"bbb",@"ggg",@"jjj",
     @"eee",@"fff",@"iii",
     @"ddd",@"hhh",@"aaa",nil];
    
    NSLog(@"%s  %@",__FUNCTION__,[anArray description]);
    //=>-[OOOAppDelegate method006]  (bbb,ggg,jjj,eee,fff,iii,ddd,hhh,aaa)
    [anArray sortWithOptions:NSSortConcurrent//NSSortStable
                                           usingComparator:^(id obj1,id obj2){
                                               return [obj1 compare:obj2];
                                           }];
    //NSSortStableは元のソートが保持される
    //NSSortConcurrentは元のソートが保持されない代わりに高速
    NSLog(@"%s  %@",__FUNCTION__,[anArray description]);
    //=>-[OOOAppDelegate method006]  (aaa,bbb,ddd,eee,fff,ggg,hhh,iii,jjj)
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self method001];
    [self method002];
    
    [self method003];
    [self method004];
    
    [self method005];
    
    [self method006];
    
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
