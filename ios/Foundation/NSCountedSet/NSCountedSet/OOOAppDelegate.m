//
//  OOOAppDelegate.m
//  NSCountedSet
//
//  Created by 大森 智史 on 2012/08/05.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"
@implementation OOOAppDelegate
#pragma mark NSSet intersectSet:

-(void)method001
{
    NSArray *aArray = @[@"a",@"b",@"c",@"d"];
    NSCountedSet *aSet = [NSCountedSet setWithCapacity:10];
    [aSet addObjectsFromArray:aArray];
    NSLog(@"%s a %@",__FUNCTION__,[aSet description]);
    //=>a {(c,d,a,b)}
    
    NSArray *bArray = @[@"d",@"e",@"f"];
    NSCountedSet *bSet = [NSCountedSet setWithCapacity:10];
    [bSet addObjectsFromArray:bArray];
    NSLog(@"%s b %@",__FUNCTION__,[bSet description]);
    //=>b {(d,e,f)}
    
    [aSet intersectSet:bSet];
    
    NSLog(@"%s a %@",__FUNCTION__,[aSet description]);
    //=>a {(d)}
    NSLog(@"%s b %@",__FUNCTION__,[bSet description]);
    //=>b {(d,e,f)}
    
}
#pragma mark NSSet setSet:
-(void)method002
{
    NSArray *aArray = @[@"a",@"b",@"c",@"d"];
    NSCountedSet *aSet = [NSCountedSet setWithCapacity:10];
    [aSet addObjectsFromArray:aArray];
    NSLog(@"%s a %@",__FUNCTION__,[aSet description]);
    //=>a {(c,d,a,b)}
    
    NSArray *bArray = @[@"d",@"e",@"f"];
    NSCountedSet *bSet = [NSCountedSet setWithCapacity:10];
    [bSet addObjectsFromArray:bArray];
    NSLog(@"%s b %@",__FUNCTION__,[bSet description]);
    //=>b {(d,e,f)}
    
    [aSet setSet:bSet];
    
    NSLog(@"%s a %@",__FUNCTION__,[aSet description]);
    //=>a {(d,e,f)}
    NSLog(@"%s b %@",__FUNCTION__,[bSet description]);
    //=>b {(d,e,f)}
    
}
#pragma mark NSSet removeAllObjects
-(void)method003
{
    NSString *a1String = @"a";
    NSString *bString = @"b";
    NSString *cString = @"c";
    NSString *a2String = [NSString stringWithFormat:@"%@",@"a"];
    NSString *a3String = @"a";
    NSArray *anArray = @[a1String,bString,cString,a2String,a1String,a3String];
    
    NSCountedSet *aSet = [NSCountedSet setWithCapacity:10];
    [aSet addObjectsFromArray:anArray];
    
    NSLog(@"%@",[aSet description]);
    //=>{(c,a,b)}
    [aSet enumerateObjectsUsingBlock:^(id obj,BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__,obj,obj);
    }];
    //=>0x572c c
    //=>0x570c a
    //=>0x571c b
    
    [aSet removeAllObjects];
    NSLog(@"%@",[aSet description]);
    //=>{()}
    
}

#pragma mark NSSet filterUsingPredicate:
-(void)method004
{
    
    NSArray *anArray = @[@"aaa",@"bbb", @"ccc", @"aaa",@"abc",@"これが"];
    NSCountedSet *aSet1 = [NSCountedSet setWithCapacity:10];
    NSCountedSet *aSet2 = [NSCountedSet setWithCapacity:10];
    NSCountedSet *aSet3 = [NSCountedSet setWithCapacity:10];
    NSCountedSet *aSet4 = [NSCountedSet setWithCapacity:10];
    NSCountedSet *aSet5 = [NSCountedSet setWithCapacity:10];
    [aSet1 addObjectsFromArray:anArray];
    [aSet2 addObjectsFromArray:anArray];
    [aSet3 addObjectsFromArray:anArray];
    [aSet4 addObjectsFromArray:anArray];
    [aSet5 addObjectsFromArray:anArray];
    
    NSPredicate *aPredicate1 = [NSPredicate predicateWithFormat:@"SELF IN %@",@[@"aaa", @"bbb"]];
    NSPredicate *aPredicate2 = [NSPredicate predicateWithFormat:@"SELF LIKE %@",@"aaa"];
    NSPredicate *aPredicate3 = [NSPredicate predicateWithFormat:@"SELF LIKE %@",@"s"];
	NSPredicate *aPredicate4 = [NSPredicate predicateWithFormat:@"SELF LIKE %@",@"a*"];
    
	NSPredicate *aPredicate5 = [NSPredicate predicateWithFormat:@"SELF LIKE %@",@"*が*"];
    [aSet1 filterUsingPredicate: aPredicate1 ];
    [aSet2 filterUsingPredicate: aPredicate2 ];
    [aSet3 filterUsingPredicate: aPredicate3 ];
    [aSet4 filterUsingPredicate: aPredicate4 ];
    [aSet5 filterUsingPredicate: aPredicate5 ];
    
    NSLog(@"%s 1 %@",__FUNCTION__,[aSet1 description]);
    //=>1 {(aaa,bbb)}
    NSLog(@"%s 2 %@",__FUNCTION__,[aSet2 description]);
    //=>2 {(aaa)}
    NSLog(@"%s 3 %@",__FUNCTION__,[aSet3 description]);
    //=>3 {()}
    NSLog(@"%s 4 %@",__FUNCTION__,[aSet4 description]);
    //=>4 {(aaa,abc)}
    NSLog(@"%s 5 %@",__FUNCTION__,[aSet5 description]);
    //=>5 {("\U3053\U308c\U304c")}
}

#pragma mark NSSet unionSet:
-(void)method005
{
    NSArray *aArray = @[@"a",@"b",@"c",@"d"];
    NSCountedSet *aSet = [[NSCountedSet alloc] initWithArray:aArray];
    NSLog(@"%s a %@",__FUNCTION__,[aSet description]);
    //=>a {(c,d,a,b)}
    
    NSArray *bArray = @[@"d",@"e",@"f"];
    NSCountedSet *bSet = [[NSCountedSet alloc] initWithArray:bArray];

    NSLog(@"%s b %@",__FUNCTION__,[bSet description]);
    //=>b {(d,e,f)}
    
    [aSet unionSet:bSet];
    
    NSLog(@"%s a %@",__FUNCTION__,[aSet description]);
    //=>a {(c,d,e,a,f,b)}
    NSLog(@"%s b %@",__FUNCTION__,[bSet description]);
    //=>b {(d,e,f)}
    
}



#pragma mark NSSet minusSet:
-(void)method006
{
    NSArray *aArray = @[@"a",@"b",@"c",@"d"];
    NSCountedSet *aSet = [[NSCountedSet alloc] initWithCapacity:10];
    [aSet addObjectsFromArray:aArray];
    NSLog(@"%s a %@",__FUNCTION__,[aSet description]);
    //=>a {(c,d,a,b)}
    
    NSArray *bArray = @[@"d",@"e",@"f"];
    NSCountedSet *bSet = [NSCountedSet setWithCapacity:10];
    [bSet addObjectsFromArray:bArray];
    NSLog(@"%s b %@",__FUNCTION__,[bSet description]);
    //=>b {(d,e,f)}
    
    [aSet minusSet:bSet];
    
    NSLog(@"%s a %@",__FUNCTION__,[aSet description]);
    //=>a {(c,a,b)}
    NSLog(@"%s b %@",__FUNCTION__,[bSet description]);
    //=>b {(d,e,f)}
    
}

#pragma mark NSCountedSet minusSet:
-(void)method007
{
    NSArray *aArray = @[@"a",@"b",@"c",@"d"];
    NSCountedSet *aSet = [[NSCountedSet alloc] initWithCapacity:10];
    [aSet addObjectsFromArray:aArray];
    NSLog(@"%s a %@",__FUNCTION__,[aSet description]);
    //=>a {(c,d,a,b)}
    
    NSArray *bArray = @[@"d",@"e",@"f"];
    NSCountedSet *bSet = [NSCountedSet setWithCapacity:10];
    [bSet addObjectsFromArray:bArray];
    NSLog(@"%s b %@",__FUNCTION__,[bSet description]);
    //=>b {(d,e,f)}
    
    [aSet unionSet:bSet];
    
    [aSet enumerateObjectsUsingBlock:^(id obj,BOOL *stop) {
        NSLog(@"%s %p %@ %d",__FUNCTION__,obj,obj,[aSet countForObject:obj]);
    }];
    //=> d 2
    //=> b 1
    //...
    NSArray *cArray = @[@"d"];
    NSCountedSet *cSet = [NSCountedSet setWithCapacity:10];
    [cSet addObjectsFromArray:cArray];
    [aSet minusSet:cSet];
    
    [aSet enumerateObjectsUsingBlock:^(id obj,BOOL *stop) {
        NSLog(@"%s %p %@ %d",__FUNCTION__,obj,obj,[aSet countForObject:obj]);
    }];
    //=> d 1
    //=> b 1
    //...
    
}
#pragma mark NSCountedSet minusSet:
-(void)method008
{
    NSArray *aArray = @[@"a",@"b",@"c",@"d"];
    NSCountedSet *aSet = [[NSCountedSet alloc] initWithCapacity:10];
    [aSet addObjectsFromArray:aArray];
    NSLog(@"%s a %@",__FUNCTION__,[aSet description]);
    //=>a {(c,d,a,b)}
    
    [aSet addObject:@"e"];
    [aSet addObject:@"a"];
    
    [aSet enumerateObjectsUsingBlock:^(id obj,BOOL *stop) {
        NSLog(@"%s %p %@ %d",__FUNCTION__,obj,obj,[aSet countForObject:obj]);
    }];
    
    [aSet removeObject:@"b"];
    [aSet removeObject:@"a"];
    
    [aSet enumerateObjectsUsingBlock:^(id obj,BOOL *stop) {
        NSLog(@"%s %p %@ %d",__FUNCTION__,obj,obj,[aSet countForObject:obj]);
    }];


}

#pragma mark NSCountedSet minusSet:
-(void)method009
{
    NSArray *aArray = @[@"a",@"b",@"c",@"d"];
    NSCountedSet *aSet = [[NSCountedSet alloc] initWithCapacity:10];
    [aSet addObjectsFromArray:aArray];
    NSLog(@"%s a %@",__FUNCTION__,[aSet description]);

	id obj;
	NSEnumerator *aEnumerator;
    aEnumerator = [aSet objectEnumerator];
    while ((obj = [aEnumerator nextObject]) != nil) {
		NSLog(@"%s %p %@ %d",__FUNCTION__,obj,obj,[aSet countForObject:obj]);
	}
    
    
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
