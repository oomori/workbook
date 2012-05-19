//
//  OOOAppDelegate.m
//  NSSortDescriptor
//
//  Created by 大森 智史 on 12/05/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

#import "CustomClass.h"

@implementation OOOAppDelegate

@synthesize window = _window;


#pragma mark initWithKey:
//NSDictionaryをソートする
-(void)method001
{

    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    
    NSMutableDictionary *dic1 = 
            [NSMutableDictionary dictionaryWithObjectsAndKeys:
                @"aaa4",@"key1",@"bbb1",@"key2",@"ccc1",@"key3",nil];
    NSMutableDictionary *dic2 = 
            [NSMutableDictionary dictionaryWithObjectsAndKeys:
                @"aaa2",@"key1",@"bbb2",@"key2",@"ccc2",@"key3",nil];
    NSMutableDictionary *dic3 = 
            [NSMutableDictionary dictionaryWithObjectsAndKeys:
                @"aaa1",@"key1",@"bbb3",@"key2",@"ccc3",@"key3",nil];
    NSMutableDictionary *dic4 = 
            [NSMutableDictionary dictionaryWithObjectsAndKeys:
                @"aaa3",@"key1",@"bbb4",@"key2",@"ccc4",@"key3",nil];
    
    [arr addObject: dic1 ];
    [arr addObject: dic2 ];
    [arr addObject: dic3 ];
    [arr addObject: dic4 ];
    
    NSSortDescriptor *descriptor=[[NSSortDescriptor alloc] initWithKey:@"key1" 
                                                              ascending:YES];
    
    NSArray *sortedArray = [arr sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]] ;

    NSLog(@"%s %@,%@,%@,%@",__FUNCTION__,[[arr objectAtIndex:0] objectForKey:@"key1"],
                                [[arr objectAtIndex:1] objectForKey:@"key1"],
                                [[arr objectAtIndex:2] objectForKey:@"key1"],
                                [[arr objectAtIndex:3] objectForKey:@"key1"]);
    //=>-[OOOAppDelegate method001] aaa4,aaa2,aaa1,aaa3
    
    NSLog(@"%s %@,%@,%@,%@",__FUNCTION__,[[sortedArray objectAtIndex:0] objectForKey:@"key1"],
                                [[sortedArray objectAtIndex:1] objectForKey:@"key1"],
                                [[sortedArray objectAtIndex:2] objectForKey:@"key1"],
                                [[sortedArray objectAtIndex:3] objectForKey:@"key1"]);
    
    //=>-[OOOAppDelegate method001] aaa1,aaa2,aaa3,aaa4

}

#pragma mark initWithKey:
//クラスをソートする
/* 
//CustomClass.h
#import <UIKit/UIKit.h>
 @interface CustomClass : NSObject
{
NSString *customClassValue;
}

@property (retain) NSString *customClassValue;

@end
 //CustomClass.m
 #import "CustomClass.h"
 
 @implementation CustomClass
 
 @synthesize customClassValue;
 
 -(NSString *)description
 {
 return customClassValue;
 
 }
 @end

 */
-(void)method002
{
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    
    CustomClass *obj1 = [[CustomClass alloc] init];
    [obj1 setCustomClassValue:@"aaa4"];
    CustomClass *obj2 = [[CustomClass alloc] init];
    [obj2 setCustomClassValue:@"aaa2"];
    CustomClass *obj3 = [[CustomClass alloc] init];
    [obj3 setCustomClassValue:@"aaa1"];
    CustomClass *obj4 = [[CustomClass alloc] init];
    [obj4 setCustomClassValue:@"aaa3"];

    [arr addObject: obj1 ];
    [arr addObject: obj2 ];
    [arr addObject: obj3 ];
    [arr addObject: obj4 ];
    
    NSSortDescriptor *descriptor=[[NSSortDescriptor alloc] initWithKey:@"customClassValue" 
                                                             ascending:YES];
    
    NSArray *sortedArray = [arr sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]] ;
    NSLog(@"%s %@",__FUNCTION__,[arr description]);
    //=>-[OOOAppDelegate method002] (aaa4,aaa2,aaa1,aaa3)
    NSLog(@"%s %@",__FUNCTION__,[sortedArray description]);
    //=>-[OOOAppDelegate method002] (aaa1,aaa2,aaa3,aaa4)
    
}
#pragma mark initWithKey:
//NSArrayをソートする
-(void)method003
{
    
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    
    
    [arr addObject: @"aaa4" ];
    [arr addObject: @"aaa2" ];
    [arr addObject: @"aaa3" ];
    [arr addObject: @"aaa1" ];
    
    NSSortDescriptor *descriptor=[[NSSortDescriptor alloc] initWithKey:nil
                                                             ascending:YES];
    
    NSArray *sortedArray = [arr sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]] ;
    
    NSLog(@"%s %@",__FUNCTION__,[arr description]);
    //=>-[OOOAppDelegate method003] (aaa4,aaa2,aaa3,aaa1)
    
    NSLog(@"%s %@",__FUNCTION__,[sortedArray description]);
    
    //=>-[OOOAppDelegate method003] (aaa1,aaa2,aaa3,aaa4)
    
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
