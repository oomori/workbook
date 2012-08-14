//
//  OOOAppDelegate.m
//  NSMutableIndexSet
//
//  Created by 大森 智史 on 2012/08/05.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate


#pragma mark NSIndexSet addIndexes
-(void)method001
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(30,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(50,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(70,10)]];
    
    
    NSIndexSet *passSet = [aSet indexesPassingTest:^ BOOL (NSUInteger idx, BOOL *stop){
        if (idx > 55) {
            return YES;
        }else{
            return NO;
        }
    }];
    
    [passSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        NSLog(@"%s %d",__FUNCTION__, idx);
    }];
}

#pragma mark NSIndexSet addIndexes
-(void)method002
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndex:1];
    [aSet addIndex:3];
    [aSet addIndex:5];
    [aSet addIndex:7];
    [aSet addIndex:9];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(8,10)]];
    [aSet addIndexesInRange:NSMakeRange(20, 3)];
    NSLog(@"%s %@",__FUNCTION__, [aSet description]);
    //=><NSMutableIndexSet: 0x6869580>[number of indexes: 17 (in 5 ranges), indexes: (1 3 5 7-17 20-22)]
}

#pragma mark NSIndexSet addIndexesInRange
-(void)method003
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndex:1];
    [aSet addIndex:3];
    [aSet addIndex:5];
    [aSet addIndex:7];
    [aSet addIndex:9];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(8,10)]];
    [aSet addIndexesInRange:NSMakeRange(20, 3)];
    NSLog(@"%s %@",__FUNCTION__, [aSet description]);
    //=><NSMutableIndexSet: 0x6869580>[number of indexes: 17 (in 5 ranges), indexes: (1 3 5 7-17 20-22)]
}

#pragma mark NSIndexSet removeIndex
-(void)method004
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1,50)]];
    [aSet removeIndex:5];
    NSLog(@"%s %@",__FUNCTION__, [aSet description]);
    //=><NSMutableIndexSet: 0x6e74420>[number of indexes: 49 (in 2 ranges), indexes: (1-4 6-50)]
}

#pragma mark NSIndexSet removeIndexes
-(void)method005
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1,50)]];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10,10)];
    [aSet removeIndexes:indexSet];
    NSLog(@"%s %@",__FUNCTION__, [aSet description]);
    //=><NSMutableIndexSet: 0x6852f80>[number of indexes: 40 (in 2 ranges), indexes: (1-9 20-50)]
}

#pragma mark NSIndexSet removeIndexes
-(void)method006
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    [aSet addIndex:1];
    [aSet addIndex:3];
    [aSet addIndex:5];
    [aSet addIndex:7];
    [aSet addIndex:9];
    
    NSLog(@"%s %@",__FUNCTION__, [aSet description]);
    //=><NSMutableIndexSet: 0x6880a00>[number of indexes: 5 (in 5 ranges), indexes: (1 3 5 7 9)]

    [aSet shiftIndexesStartingAtIndex:5 by:10];
    NSLog(@"%s %@",__FUNCTION__, [aSet description]);
    //=><NSMutableIndexSet: 0x6852f80>[number of indexes: 40 (in 2 ranges), indexes: (1-9 20-50)]
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
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
