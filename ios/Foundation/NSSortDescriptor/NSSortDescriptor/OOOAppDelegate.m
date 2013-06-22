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
    
    NSArray *sortedArray = [arr sortedArrayUsingDescriptors:@[descriptor]] ;

    NSLog(@"%s %@,%@,%@,%@",__FUNCTION__,arr[0][@"key1"],
                                arr[1][@"key1"],
                                arr[2][@"key1"],
                                arr[3][@"key1"]);
    //=>-[OOOAppDelegate method001] aaa4,aaa2,aaa1,aaa3
    
    NSLog(@"%s %@,%@,%@,%@",__FUNCTION__,sortedArray[0][@"key1"],
                                sortedArray[1][@"key1"],
                                sortedArray[2][@"key1"],
                                sortedArray[3][@"key1"]);
    
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
    
    NSArray *sortedArray = [arr sortedArrayUsingDescriptors:@[descriptor]] ;
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
    
    NSArray *sortedArray = [arr sortedArrayUsingDescriptors:@[descriptor]] ;
    
    NSLog(@"%s %@",__FUNCTION__,[arr description]);
    //=>-[OOOAppDelegate method003] (aaa4,aaa2,aaa3,aaa1)
    
    NSLog(@"%s %@",__FUNCTION__,[sortedArray description]);
    
    //=>-[OOOAppDelegate method003] (aaa1,aaa2,aaa3,aaa4)
    
}


#pragma mark NSSortDescriptor sortDescriptorWithKey
-(void)method004
{
    
    NSArray *anArray = @[@"aaaaa",@"aaa",@"a",@"aa",@"aaaa"];
    
    NSArray *descs = @[[NSSortDescriptor sortDescriptorWithKey:@"length" ascending:YES]];
    NSLog( @"%s %@",__FUNCTION__,[anArray sortedArrayUsingDescriptors:descs] );
    
    //=>(a,aa,aaa,aaaa,aaaaa)
}

#pragma mark NSSortDescriptor sortDescriptorWithKey:ascending:
-(void)method005
{
    
    NSArray *anArray = @[@"aaaaa",@"aaa",@"a",@"aa",@"aaaa"];
    
    NSArray *descs = @[[NSSortDescriptor sortDescriptorWithKey:@"length" ascending:YES]];
    NSLog( @"%s %@",__FUNCTION__,[anArray sortedArrayUsingDescriptors:descs] );
    
    //=>(a,aa,aaa,aaaa,aaaaa)
}

#pragma mark NSSortDescriptor sortDescriptorWithKey:ascending:
-(void)method006
{
    
    NSArray *anArray = @[@"aaa",@"cccc",@"bbb",@"a"];
    
    NSArray *descs = @[[NSSortDescriptor sortDescriptorWithKey:@"length" ascending:YES selector:@selector(compare:)]];
    NSLog( @"%s %@",__FUNCTION__,[anArray sortedArrayUsingDescriptors:descs] );
    
    //=>(a,aaa,bbb,cccc)

    //NSString+Extractとしてカテゴリを作っている。comparePlus:というメソッドを作成済み。
    //これは単に文字の長さが長いかを比べるメソッド
    NSArray *descs2 = @[[NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES selector:@selector(compareLength:)]];
    NSLog( @"%s %@",__FUNCTION__,[anArray sortedArrayUsingDescriptors:descs2] );
    //=>(cccc,aaa,bbb,a)
}

#pragma mark NSSortDescriptor sortDescriptorWithKey:ascending:
-(void)method007
{
    
    NSArray *anArray = @[@"aaa",@"cccc",@"bbb",@"a"];
    
    NSArray *descs = @[[NSSortDescriptor sortDescriptorWithKey:@"length" ascending:YES selector:@selector(compare:)]];
    NSLog( @"%s %@",__FUNCTION__,[anArray sortedArrayUsingDescriptors:descs] );
    
    //=>(a,aaa,bbb,cccc)
    
    NSArray *descs2 = @[[NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES comparator:^(id obj1, id obj2) {
        return (NSComparisonResult)[obj1 compare:obj2];
        }]];
    
    
    NSLog( @"%s %@",__FUNCTION__,[anArray sortedArrayUsingDescriptors:descs2] );
    //=>(a,aaa,bbb,cccc)
}

#pragma mark NSSortDescriptor sortDescriptorWithKey
-(void)method008
{
    
    NSArray *anArray = @[@"aaaaa",@"aaa",@"a",@"aa",@"aaaa"];
    
    NSSortDescriptor *desc = [NSSortDescriptor sortDescriptorWithKey:@"length" ascending:YES];
    NSArray *descs = @[desc];
    NSArray *sortedArray = [anArray sortedArrayUsingDescriptors:descs] ;
    NSLog( @"%s %@ %@",__FUNCTION__,([desc ascending])?@"YES":@"NO",sortedArray );
    
    //=>(a,aa,aaa,aaaa,aaaaa)
}

#pragma mark NSSortDescriptor sortDescriptorWithKey
-(void)method009
{
    
    NSArray *anArray = @[@"aaaaa",@"aaa",@"a",@"aa",@"aaaa"];
    
    NSSortDescriptor *desc = [NSSortDescriptor sortDescriptorWithKey:@"length" ascending:YES];
    NSArray *descs = @[desc];
    NSArray *sortedArray = [anArray sortedArrayUsingDescriptors:descs] ;
    NSLog( @"%s %@ %@",__FUNCTION__,[desc key],sortedArray );
    
}

#pragma mark NSSortDescriptor selector
-(void)method010
{
    
    NSArray *anArray = @[@"aaaaa",@"aaa",@"a",@"aa",@"aaaa"];
    
    NSSortDescriptor *desc = [NSSortDescriptor sortDescriptorWithKey:@"length" ascending:YES];
    NSArray *descs = @[desc];
    NSArray *sortedArray = [anArray sortedArrayUsingDescriptors:descs] ;
    NSLog( @"%s %@ %@",__FUNCTION__,NSStringFromSelector([desc selector]),sortedArray );
  
}

#pragma mark NSSortDescriptor selector
-(void)method011
{
    
    NSArray *anArray = @[@"aaaaa",@"aaa",@"a",@"aa",@"aaaa"];
    
    NSSortDescriptor *desc = [NSSortDescriptor sortDescriptorWithKey:@"length" ascending:YES];
    NSArray *descs = @[desc];
    NSArray *sortedArray = [anArray sortedArrayUsingDescriptors:descs] ;
    NSLog( @"%s %@ %@",__FUNCTION__,NSStringFromSelector([desc selector]),sortedArray );
    
    switch ([desc compareObject:@"aaa" toObject:@"a"]) {
        case NSOrderedAscending:
            NSLog(@"NSOrderedAscending");
            break;
        case NSOrderedSame:
            NSLog(@"NSOrderedSame");
            break;
        case NSOrderedDescending:
            NSLog(@"NSOrderedDescending");
            break;
            
        default:
            break;
    }
    //=>NSOrderedDescending
}

#pragma mark NSSortDescriptor selector
-(void)method012
{
    
    NSArray *anArray = @[@"aaaaa",@"aaa",@"a",@"aa",@"aaaa"];
    
    NSSortDescriptor *baseDesc = [NSSortDescriptor sortDescriptorWithKey:@"length" ascending:YES];
    NSSortDescriptor *desc = [baseDesc reversedSortDescriptor];
    
    NSArray *descs = @[desc];
    NSArray *sortedArray = [anArray sortedArrayUsingDescriptors:descs] ;
    NSLog( @"%s %@ %@",__FUNCTION__,NSStringFromSelector([desc selector]),sortedArray );
    
    switch ([desc compareObject:@"aaa" toObject:@"a"]) {
        case NSOrderedAscending:
            NSLog(@"NSOrderedAscending");
            break;
        case NSOrderedSame:
            NSLog(@"NSOrderedSame");
            break;
        case NSOrderedDescending:
            NSLog(@"NSOrderedDescending");
            break;
            
        default:
            break;
    }
    //=>NSOrderedDescending
}

#pragma mark NSSortDescriptor sortDescriptorWithKey:ascending:
-(void)method013
{
    
    NSArray *anArray = @[@"aaa",@"cccc",@"bbb",@"a"];
    
    NSArray *descs = @[[NSSortDescriptor sortDescriptorWithKey:@"length" ascending:YES selector:@selector(compare:)]];
    NSLog( @"%s %@",__FUNCTION__,[anArray sortedArrayUsingDescriptors:descs] );
    
    //=>(a,aaa,bbb,cccc)
    NSSortDescriptor *desc = [NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES comparator:^(id obj1, id obj2) {
        return (NSComparisonResult)[obj1 compare:obj2];}];
    NSArray *descs2 = @[desc];
    
    
    NSLog( @"%s %@",__FUNCTION__,[anArray sortedArrayUsingDescriptors:descs2] );
    
    NSLog( @"%s %@ %@",__FUNCTION__,[desc comparator],descs2 );
    //=>(a,aaa,bbb,cccc)
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
    [self method007];
    
    [self method008];
    [self method009];
    [self method010];
    [self method011];
    
    [self method012];
    
    [self method013];
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
