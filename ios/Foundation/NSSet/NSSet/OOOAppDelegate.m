//
//  OOOAppDelegate.m
//  NSSet
//
//  Created by 大森 智史 on 12/05/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"
#import "CustomClass.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark enumerateObjectsUsingBlock:
/*
 CustomClass.m
 -(NSMutableString *)appendSomeString
{
    [customClassValue appendString:@"!"];
    return customClassValue;
    
}
*/
-(void)method001
{
    CustomClass *customClass1 = [[CustomClass alloc] init];
    NSMutableString *muStr1 = [[NSMutableString alloc] initWithCapacity:0];
    [muStr1 appendString:@"aaa"];
    [customClass1 setCustomClassValue:muStr1];
    CustomClass *customClass2 = [[CustomClass alloc] init];
    NSMutableString *muStr2 = [[NSMutableString alloc] initWithCapacity:0];
    [muStr2 appendString:@"bbb"];
    [customClass2 setCustomClassValue:muStr2];
    CustomClass *customClass3 = [[CustomClass alloc] init];
    NSMutableString *muStr3 = [[NSMutableString alloc] initWithCapacity:0];
    [muStr3 appendString:@"ccc"];
    [customClass3 setCustomClassValue:muStr3];

    NSMutableSet *muSet = [NSMutableSet setWithObjects:customClass1,
                           customClass2,
                           customClass3,
                           nil];
    
    NSLog(@"%s %@",__FUNCTION__, [muSet description]);
    [muSet enumerateObjectsUsingBlock:^(id obj,BOOL *stop) {
        //appendSomeStringは末尾に ! を付けるだけのメソッド
        [obj appendSomeString];
            //if ([obj isEqualToString:@"bbb"]) {
                //*stop = YES;   
            //}
            }];
    
    NSLog(@"%s %@",__FUNCTION__, [muSet description]);
    //=>-[OOOAppDelegate method001] {(bbb,ccc,aaa)}
    //=>-[OOOAppDelegate method001] {(bbb!,ccc!,aaa!)}
    
}
#pragma mark NSSet set
-(void)method002
{
    NSSet *aSet = [NSSet set];
    NSLog(@"%s %p",__FUNCTION__,aSet);  //=>0x6c1f680
    NSLog(@"%@",[aSet description]);
    NSLog(@"%s %p",__FUNCTION__,aSet);  //=>0x6c1f680
}

#pragma mark NSSet setWithArray
-(void)method003
{
    NSString *a1String = @"a";
    NSString *bString = @"b";
    NSString *cString = @"c";
    NSString *a2String = [NSString stringWithFormat:@"%@",@"a"];
    NSString *a3String = @"a";
    
    NSLog(@"%s %p",__FUNCTION__,a1String);  //=>0x6a10
    NSLog(@"%s %p",__FUNCTION__,bString);   //=>0x6a20
    NSLog(@"%s %p",__FUNCTION__,cString);   //=>0x6a30
    NSLog(@"%s %p",__FUNCTION__,a2String);  //=>0x6d6b1e0
    NSLog(@"%s %p",__FUNCTION__,a3String);   //=>0x6a30
    
    
    NSArray *anArray = @[a1String,bString,cString,a2String,a1String,a3String];
    
    NSSet *aSet = [NSSet setWithArray:anArray];
    NSLog(@"%@",[aSet description]);
    //=>
    [aSet enumerateObjectsUsingBlock:^(id obj,BOOL *stop) {
        NSLog(@"%s %p",__FUNCTION__,obj);
    }];
    //=>0x6a20
    //=>0x6a30
    //=>0x6a10
    
}

#pragma mark NSSet setWithArray:count:
-(void)method004
{
    NSString *strings[5];
    strings[0]=@"Jan";
    strings[1]=@"Feb";
    strings[2]=@"Mar";
    strings[3]=@"Apr";
    strings[4]=@"May";
        
    NSSet *aSet = [NSSet setWithObjects:strings count:3];
    NSLog(@"%@",[aSet description]);
    //=>{(Jan,Feb,Mar)}
    [aSet enumerateObjectsUsingBlock:^(id obj,BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__,obj,[obj description]);
    }];
    //=>0x6a70 Jan
    //=>0x6a80 Feb
    //=>0x6a90 Mar
}

#pragma mark NSSet setWithArray
-(void)method005
{
    NSString *aString = @"a";
    NSString *bString = @"b";
    NSString *cString = @"c";
    
    NSArray *anArray = @[aString,bString,cString];
    NSSet *aSet = [NSSet setWithArray:anArray];
    NSLog(@"%@",[aSet description]);
    //=>{(a,b,c)}
    
    NSSet *newSet = [aSet setByAddingObject:@"d"];
    NSLog(@"%@",[aSet description]);
    //=>{(a,b,c)}
    
    NSLog(@"%@",[newSet description]);
    //=>{(d,b,c,a)}
    
}

#pragma mark NSSet setWithArray
-(void)method006
{
    NSString *aString = @"a";
    NSString *bString = @"b";
    NSString *cString = @"c";
    
    NSArray *anArray = @[aString,bString,cString];
    NSSet *aSet = [NSSet setWithArray:anArray];
    NSLog(@"%d",[aSet count]);
    //=>3
    
}

#pragma mark NSSet allObjects
-(void)method007
{
    NSString *aString = @"a";
    NSString *bString = @"b";
    NSString *cString = @"c";
    
    NSArray *anArray = @[aString,bString,cString];
    NSSet *aSet = [NSSet setWithArray:anArray];
    NSLog(@"%@",[[aSet allObjects] description]);
    //=>(a,b,c)
    
}

#pragma mark NSSet anyObject
-(void)method008
{
    NSString *aString = @"a";
    NSString *bString = @"b";
    NSString *cString = @"c";
    
    NSArray *anArray = @[aString,bString,cString];
    NSSet *aSet = [NSSet setWithArray:anArray];
    NSLog(@"%@",[[aSet anyObject] description]);
    //=>a //毎回変わる
    
}

#pragma mark NSSet anyObject
-(void)method009
{
    NSString *aString = @"a";
    NSString *bString = @"b";
    NSString *cString = @"c";
    
    NSArray *anArray = @[aString,bString,cString];
    NSSet *aSet = [NSSet setWithArray:anArray];
    NSLog(@"%@",([aSet containsObject:@"b"])?@"YES":@"NO");
    //=>a //毎回変わる
    
}

#pragma mark NSSet filteredSetUsingPredicate:
-(void)method010
{
    NSArray *anArray = @[@"aaa",@"bbb", @"ccc", @"aaa",@"abc",@"これが"];
    NSSet *aSet = [NSSet setWithArray:anArray];
    
    NSPredicate *aPredicate1 = [NSPredicate predicateWithFormat:@"SELF IN %@",@[@"aaa", @"bbb"]];
    NSPredicate *aPredicate2 = [NSPredicate predicateWithFormat:@"SELF LIKE %@",@"aaa"];
    NSPredicate *aPredicate3 = [NSPredicate predicateWithFormat:@"SELF LIKE %@",@"s"];
	NSPredicate *aPredicate4 = [NSPredicate predicateWithFormat:@"SELF LIKE %@",@"a*"];
    
	NSPredicate *aPredicate5 = [NSPredicate predicateWithFormat:@"SELF LIKE %@",@"*が*"];
    
    NSLog(@"%s %@",__FUNCTION__,[[aSet filteredSetUsingPredicate: aPredicate1 ] description]);
    //=>{(aaa, bbb)}
    NSLog(@"%s %@",__FUNCTION__,[[aSet filteredSetUsingPredicate: aPredicate2 ] description]);
    //=>{(aaa)}
    NSLog(@"%s %@",__FUNCTION__,[[aSet filteredSetUsingPredicate: aPredicate3 ] description]);
    //=>{()}
    NSLog(@"%s %@",__FUNCTION__,[[aSet filteredSetUsingPredicate: aPredicate4 ] description]);
    //=>{(aaa,abc)}
    NSLog(@"%s %@",__FUNCTION__,[[aSet filteredSetUsingPredicate: aPredicate5 ] description]);
    //=>{("\U3053\U308c\U304c")}
    
}

#pragma mark makeObjectsPerformSelector:
//各オブジェクトにメッセージを送信
-(void)method011
{
    CustomClass *customClass1 = [[CustomClass alloc] init];
    NSMutableString *muStr1 = [[NSMutableString alloc] initWithCapacity:0];
    [muStr1 appendString:@"aaa"];
    [customClass1 setCustomClassValue:muStr1];
    CustomClass *customClass2 = [[CustomClass alloc] init];
    NSMutableString *muStr2 = [[NSMutableString alloc] initWithCapacity:0];
    [muStr2 appendString:@"bbb"];
    [customClass2 setCustomClassValue:muStr2];
    CustomClass *customClass3 = [[CustomClass alloc] init];
    NSMutableString *muStr3 = [[NSMutableString alloc] initWithCapacity:0];
    [muStr3 appendString:@"ccc"];
    [customClass3 setCustomClassValue:muStr3];
    
    NSArray *anArray =@[customClass1,
                   customClass2,
                   customClass3];
    NSSet *aSet = [NSSet setWithArray:anArray];
    
    [aSet enumerateObjectsUsingBlock:^(id obj,BOOL *stop) {
        //appendSomeStringは末尾に ! を付けるだけのメソッド
        NSLog(@"%s %@",__FUNCTION__,obj);
        //if ([obj isEqualToString:@"bbb"]) {
        //*stop = YES;
        //}
    }];
    //=>-[OOOAppDelegate method034] aaa,bbb,ccc
    
    [aSet makeObjectsPerformSelector: @selector(appendSomeString)];
    //appendSomeStringは末尾に ! を付けるだけのメソッド
    
    
    [aSet enumerateObjectsUsingBlock:^(id obj,BOOL *stop) {
        //appendSomeStringは末尾に ! を付けるだけのメソッド
        NSLog(@"%s %@",__FUNCTION__,obj);
        //if ([obj isEqualToString:@"bbb"]) {
        //*stop = YES;
        //}
    }];
    
    
}

#pragma mark NSSet anyObject
-(void)method012
{
    NSString *aString = [NSString stringWithFormat:@"a"];
    NSString *bString = [NSString stringWithFormat:@"b"];
    NSString *cString = [NSString stringWithFormat:@"c"];
    
    NSArray *anArray = @[aString,bString,cString];
    NSSet *aSet = [NSSet setWithArray:anArray];
    NSLog(@"%@",[aSet member:@"a"]);
    
    
}

#pragma mark NSSet anyObject
-(void)method013
{
    NSString *aString = [NSString stringWithFormat:@"a"];
    NSString *bString = [NSString stringWithFormat:@"b"];
    NSString *cString = [NSString stringWithFormat:@"c"];
    
    NSArray *anArray = @[aString,bString,cString];
    NSSet *aSet = [NSSet setWithArray:anArray];
    
    NSEnumerator *aEnumerator = [aSet objectEnumerator];
    aEnumerator = [anArray objectEnumerator];
    id obj;
    while ((obj = [aEnumerator nextObject]) != nil) {
		NSLog(@"%s %@",__FUNCTION__,(NSString *)obj);
	}
    
}

#pragma mark enumerateObjectsUsingBlock:
-(void)method014
{
    NSArray *anArray =
    @[@"aaa",@"bbb",@"ccc",
     @"ddd",@"eee",@"fff",
     @"ggg",@"hhh",@"iii"];
    
    NSSet *aSet = [NSSet setWithArray:anArray];
    [aSet enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        NSLog(@"%s %@",__FUNCTION__ ,[obj description]);
        
        //if ([obj isEqualToString:@"ggg"]) {
        //    *stop = YES;
        //}
    }];
    
}

#pragma mark enumerateObjectsWithOptions:usingBlock:
-(void)method015
{
    NSArray *anArray =
    @[@"aaa",@"bbb",@"ccc",
     @"ddd",@"eee",@"fff",
     @"ggg",@"hhh",@"iii"];
    
    NSSet *aSet = [NSSet setWithArray:anArray];
    [aSet enumerateObjectsWithOptions:(NSEnumerationConcurrent | NSEnumerationReverse)
                           usingBlock:^(id obj, BOOL *stop) {
        NSLog(@"%s %@",__FUNCTION__ ,[obj description]);
        
        //if ([obj isEqualToString:@"ggg"]) {
        //    *stop = YES;
        //}
    }];
    
}

#pragma mark objectsPassingTest:
-(void)method016
{
    NSArray *anArray =
    @[@"aaa",@"bbb",@"ccc",
     @"aaa",@"bbb",@"ccc",
     @"aaa",@"bbb",@"ccc"];
    
    NSSet *aSet = [NSSet setWithArray:anArray];
    NSSet *newSet = [aSet objectsPassingTest:
                      ^ BOOL (id obj, BOOL *stop)
                      {
                          
                          if ([obj isEqualToString:@"bbb"]) {
                              return YES;
                          }else {
                              return NO;
                          }
                          
                      }];
    NSLog(@"%s %@",__FUNCTION__ ,[newSet description]);
    
}

#pragma mark objectsPassingTest:
-(void)method017
{
    NSArray *anArray =
    @[@"aaa",@"bbb",@"ccc",
     @"aaa",@"bbb",@"ccc",
     @"aaa",@"bbb",@"ccc"];
    
    NSSet *aSet = [NSSet setWithArray:anArray];
    NSSet *newSet = [aSet objectsWithOptions:NSEnumerationConcurrent
                                 passingTest:^ BOOL (id obj, BOOL *stop)
                     {
                         
                         if ([obj isEqualToString:@"bbb"]) {
                             return YES;
                         }else {
                             return NO;
                         }
                         
                     }];
    NSLog(@"%s %@",__FUNCTION__ ,[newSet description]);
    
}

#pragma mark NSSet
-(void)method018
{
    NSString *aString = [NSString stringWithFormat:@"a"];
    NSString *bString = [NSString stringWithFormat:@"b"];
    NSString *cString = [NSString stringWithFormat:@"c"];
    NSString *dString = [NSString stringWithFormat:@"d"];
    NSArray *aArray = @[aString,bString,cString,dString];
    
    NSArray *bArray = @[@"a",@"b",@"c"];

    NSSet *aSet = [NSSet setWithArray:aArray];
    NSSet *bSet = [NSSet setWithArray:bArray];
    NSLog([aSet isSubsetOfSet:bSet]?@"YES":@"NO");
    NSLog([bSet isSubsetOfSet:aSet]?@"YES":@"NO");
    
    
}

#pragma mark NSSet
-(void)method019
{
    NSString *aString = [NSString stringWithFormat:@"a"];
    NSString *bString = [NSString stringWithFormat:@"b"];
    NSString *cString = [NSString stringWithFormat:@"c"];
    NSString *dString = [NSString stringWithFormat:@"d"];
    NSArray *aArray = @[aString,bString,cString,dString];
    
    NSArray *bArray = @[@"d",@"e",@"f"];
    NSArray *cArray = @[@"e",@"f",@"g"];
    
    NSSet *aSet = [NSSet setWithArray:aArray];
    NSSet *bSet = [NSSet setWithArray:bArray];
    NSSet *cSet = [NSSet setWithArray:cArray];
    NSLog(@"%s %@",__FUNCTION__,[aSet intersectsSet:bSet]?@"YES":@"NO");
    NSLog(@"%s %@",__FUNCTION__,[aSet intersectsSet:cSet]?@"YES":@"NO");
    
    
}

#pragma mark NSSet
-(void)method020
{
    NSString *aString = [NSString stringWithFormat:@"a"];
    NSString *bString = [NSString stringWithFormat:@"b"];
    NSString *cString = [NSString stringWithFormat:@"c"];
    NSString *dString = [NSString stringWithFormat:@"d"];
    NSArray *aArray = @[aString,bString,cString,dString];
    
    NSArray *bArray = @[@"a",@"b",@"c",@"d"];
    NSArray *cArray = @[@"a",@"b",@"c"];
    
    NSSet *aSet = [NSSet setWithArray:aArray];
    NSSet *bSet = [NSSet setWithArray:bArray];
    NSSet *cSet = [NSSet setWithArray:cArray];
    NSLog(@"%s %@",__FUNCTION__,[aSet isEqualToSet:bSet]?@"YES":@"NO");
    NSLog(@"%s %@",__FUNCTION__,[aSet isEqualToSet:cSet]?@"YES":@"NO");
    
    
}

#pragma mark NSSet
-(void)method021
{
    NSDictionary *aDic = @{@"key1": @"aaa"};
    NSDictionary *bDic = @{@"key2": @"bbb"};
    NSDictionary *cDic = @{@"key3": @"ccc"};
    NSArray *aArray = @[aDic,bDic,cDic];
    NSSet *aSet = [NSSet setWithArray:aArray];
    NSLog(@"%s %@",__FUNCTION__,[[aSet valueForKey:@"key3"] description]);
}

#pragma mark NSSet
-(void)method022
{
    NSMutableDictionary *aDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"aaa",@"key1", nil];
    NSMutableDictionary *bDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"bbb",@"key2", nil];
    NSMutableDictionary *cDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"ccc",@"key3", nil];
    NSArray *aArray = @[aDic,bDic,cDic];
    NSSet *aSet = [NSSet setWithArray:aArray];
    NSLog(@"%s %@",__FUNCTION__,[[aSet valueForKey:@"key3"] description]);
    [aSet setValue:@"xxx" forKey:@"key1"];
    NSLog(@"%s %@",__FUNCTION__,[[aSet valueForKey:@"key1"] description]);
}

#pragma mark :
//NSArrayをソートする
-(void)method023
{
    
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
    [arr addObject: @"aaa4" ];
    [arr addObject: @"aaa2" ];
    [arr addObject: @"aaa3" ];
    [arr addObject: @"aaa1" ];
    
    NSSortDescriptor *descriptor=[[NSSortDescriptor alloc] initWithKey:nil
                                                             ascending:YES];
    NSSet *aSet = [NSSet setWithArray:arr];
    
    NSArray *sortedArray = [aSet sortedArrayUsingDescriptors:@[descriptor]] ;
    
    NSLog(@"%s %@",__FUNCTION__,[arr description]);
    //=>-[OOOAppDelegate method003] (aaa4,aaa2,aaa3,aaa1)
    
    NSLog(@"%s %@",__FUNCTION__,[sortedArray description]);
    
    //=>-[OOOAppDelegate method003] (aaa1,aaa2,aaa3,aaa4)
    
}
//監視対象のオブジェクト通知
-(void )observeValueForKeyPath:(NSString *)keyPath ofObject:( id )object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    NSLog( @"%s key = %@,object = %@,change = %@" ,__FUNCTION__,keyPath,[object description],[change description]);
} 
#pragma mark addObserver:toObjectsAtIndexes:forKeyPath:options:context:
-(void)method024
{
    NSMutableString *aString = [NSMutableString stringWithCapacity:1];
    [aString appendString:@"aString"];
    NSMutableArray *anArray = [NSMutableArray arrayWithObjects:@"aaa",@2.0f,@"bbb",@"ccc",@"ddd",@"eee",@"fff",@"ggg",@"hhh",nil];
    
    [anArray addObject:aString];
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    [indexSet addIndex:3];

    
    //
    
    [indexSet addObserver:self
               forKeyPath:@"aString"
                  options:NSKeyValueObservingOptionInitial
                  context:nil];

    [aString appendString:@"+aString"];

    //NSLog(@"013 = %@",[anArray description]);
    
    //=>
}
#pragma mark NSSet NSNumberなどを含むことができるか
-(void)method025
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSNumber *ddd = @10;
    NSDate *eee = [NSDate date];
    NSValue *fff = [NSValue valueWithCGPoint:CGPointMake(10.0, 10.0)];
    NSSet *ggg = [NSSet setWithObjects:aaa,bbb,ccc,nil];
    NSData *hhh = [NSData data];
    
    NSSet *aSet = [NSSet setWithObjects:aaa,bbb,ccc,ddd,eee,fff,ggg,hhh,nil];
    
    [aSet enumerateObjectsUsingBlock:^(id obj,  BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        

    }];
    
    
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
    [self method014];
    [self method015];
    [self method016];
    [self method017];
    [self method018];
    [self method019];
    [self method020];
    [self method021];
    
    [self method022];
    [self method023];
    
    [self method024];
    
    [self method025];
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
