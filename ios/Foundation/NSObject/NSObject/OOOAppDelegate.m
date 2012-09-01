//
//  OOOAppDelegate.m
//  NSObject
//
//  Created by 大森 智史 on 2012/09/01.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"
#import <objc/runtime.h>
#import "MyObject.h"

@implementation OOOAppDelegate

#pragma mark alloc/init
-(void)method001
{
    MyObject *obj = [[MyObject alloc] init];
    [obj testMethod];
}


#pragma mark copy
-(void)method002
{
    NSMutableString *aString = [NSMutableString stringWithCapacity:10];
    [aString appendFormat:@"%@",@"append string" ];
    NSLog(@"%s %p %@ %@",__FUNCTION__,aString,aString,[aString class]);
     NSString *obj = [aString copy];
     NSLog(@"%s %p %@ %@",__FUNCTION__,obj,obj,[obj class]);
}

#pragma mark copy
-(void)method003
{
    MyObject *obj = [[MyObject alloc] init];
    id copyObj = [obj copy];
    NSLog(@"%s %p %@ %@",__FUNCTION__,copyObj,copyObj,[copyObj class]);
}

#pragma mark copyWithZone
-(void)method004
{
    MyObject *obj = [[MyObject alloc] init];
    id copyObj = [obj copyWithZone:nil];
    NSLog(@"%s %p %@ %@",__FUNCTION__,copyObj,copyObj,[copyObj class]);
}


#pragma mark mutableCopy
-(void)method005
{
    NSArray *anArray = [[NSArray alloc] initWithObjects:@"aaa",@"bbb",@"ccc", nil];
    NSMutableArray *mArray = [anArray mutableCopy];
    NSLog(@"%s %p %@ %@",__FUNCTION__,mArray,mArray,[mArray description]);
    [mArray addObject:@"ddd"];
    NSLog(@"%s %p %@ %@",__FUNCTION__,mArray,mArray,[mArray description]);
}

#pragma mark new
-(void)method006
{
    MyObject *obj = [MyObject new];
    NSLog(@"%s %p %@ %@",__FUNCTION__,obj,obj,[obj class]);
}

#pragma mark class
-(void)method007
{
    MyObject *obj = [MyObject new];
    NSLog(@"%s %p %@ %@",__FUNCTION__,obj,obj,[MyObject class]);

}

#pragma mark superclass
-(void)method008
{
    MyObject *obj = [MyObject new];
    NSLog(@"%s %p %@ %@",__FUNCTION__,obj,obj,[MyObject superclass]);
    
}

#pragma mark isSubclassOfClass
-(void)method009
{
    MyObject *obj = [MyObject new];
    
    NSLog(@"%s %p %@ %@",__FUNCTION__,obj,obj,([MyObject isSubclassOfClass:[NSObject class]])?@"YES":@"NO");
}

#pragma mark instancesRespondToSelector
-(void)method010
{
    MyObject *obj = [MyObject new];
    
    NSLog(@"%s %p %@ %@",__FUNCTION__,obj,obj,([MyObject instancesRespondToSelector:NSSelectorFromString(@"testMethod")])?@"YES":@"NO");
    
    NSLog(@"%s %p %@ %@",__FUNCTION__,obj,obj,([MyObject instancesRespondToSelector:@selector(testMethod)])?@"YES":@"NO");



}

#pragma mark
-(void)method011
{
    MyObject *obj = [MyObject new];
    
    NSLog(@"%s %p %@ %@",__FUNCTION__,obj,obj,([MyObject conformsToProtocol:@protocol(NSCopying)])?@"YES":@"NO");
}

#pragma mark
//#import <objc/runtime.h>が必要
//テスト中
-(void)method012
{
    NSString*   object = @"";
    SEL         selectorA = @selector(messageA);
    SEL         selectorB = @selector(messageB);
    
    Method methodA = class_getInstanceMethod([MyObject class], selectorA);
    Method methodB = class_getInstanceMethod([MyObject class], selectorB);

    MyObject *obj = [MyObject new];
    
    //メソッドのIMPを取得
    IMP impA = [obj methodForSelector:@selector(messageA)];
    IMP impB = [obj methodForSelector:@selector(messageB)];
    
    //メソッドの実装IMPを直接呼んでみる
    impA(object,selectorA);
    impB(object,selectorB);
    
    NSLog(@"---------------------");
    
    //IMPを逆にしてみる
    IMP swap;
    swap = impA;
    impA = impB;
    impB = swap;
    //逆にしたIMPをセレクタにセット
    method_setImplementation(methodA, impA);
    method_setImplementation(methodB, impB);
    //メソッド呼び出し
    NSLog(@"%s",__FUNCTION__);
    [obj messageA];
    //=>-[MyObject messageB] messageB
    NSLog(@"%s",__FUNCTION__);
    [obj messageB];
    //=>-[MyObject messageA] messageA
    //?いいのか-[MyObject messageA] messageB にならないといけない？
}

#pragma mark
//#import <objc/runtime.h>が必要
//テスト中
-(void)method013
{
    
    NSLog(@"---------------------");
    
    NSString*   object = @"";
    SEL         selectorA = @selector(messageA);
    SEL         selectorB = @selector(messageB);
    
    Method methodA = class_getInstanceMethod([MyObject class], selectorA);
    Method methodB = class_getInstanceMethod([MyObject class], selectorB);
    
    MyObject *obj = [MyObject new];
    
    //メソッドのIMPを取得
    IMP impA = [MyObject instanceMethodForSelector:@selector(messageA)];
    IMP impB = [MyObject instanceMethodForSelector:@selector(messageB)];
    
    //メソッドの実装IMPを直接呼んでみる
    NSLog(@"%s",__FUNCTION__);
    impA(object,selectorA);
    impB(object,selectorB);
    
    
    //IMPを逆にしてみる
    IMP swap;
    swap = impA;
    impA = impB;
    impB = swap;
    //逆にしたIMPをセレクタにセット
    method_setImplementation(methodA, impA);
    method_setImplementation(methodB, impB);
    //メソッド呼び出し
    NSLog(@"%s",__FUNCTION__);
    [obj messageA];
    //=>-[MyObject messageB] messageB
    NSLog(@"%s",__FUNCTION__);
    [obj messageB];
    //=>-[MyObject messageA] messageA
    //?いいのか-[MyObject messageA] messageB にならないといけない？
}

#pragma mark instanceMethodSignatureForSelector

-(void)method014
{
    NSMethodSignature *mSigA = [MyObject instanceMethodSignatureForSelector:@selector(messageA)];
  
    //
    NSLog(@"%s %d",__FUNCTION__,[mSigA numberOfArguments]);

}

#pragma mark methodSignatureForSelector

-(void)method015
{
    MyObject *obj = [MyObject new];
    NSMethodSignature *mSigA = [obj methodSignatureForSelector:@selector(messageA)];
    
    //
    NSLog(@"%s %d",__FUNCTION__,[mSigA numberOfArguments]);
    
}

#pragma mark methodSignatureForSelector

-(void)method016
{
    NSLog(@"%s %@",__FUNCTION__,[MyObject description]);
    
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
