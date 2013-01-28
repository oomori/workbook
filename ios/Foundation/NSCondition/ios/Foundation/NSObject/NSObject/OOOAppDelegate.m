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
#import "OOOProxy.h"

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

#pragma mark description

-(void)method016
{
    NSLog(@"%s %@",__FUNCTION__,[MyObject description]);
    
}

#pragma mark autoContentAccessingProxy
//NSDiscardableContentプロトコルが必要
-(void)method017
{
    MyObject *obj = [[MyObject alloc] init];
    NSProxy *proxy = [obj autoContentAccessingProxy];
    
    //beginContentAccessが呼ばれる
    NSLog(@"%s %@",__FUNCTION__,[proxy description]);

    [obj messageA];
    //endContentAccessが呼ばれる

}

#pragma mark description
//プロキシのテスト中
-(void)method018
{
    MyObject *obj = [[MyObject alloc] init];
    id proxy = [OOOProxy alloc];
    [proxy setTargetObject:obj];
    MyObject* proxiedDto = (MyObject*)proxy;
    [proxiedDto messageA];
}

#pragma mark performSelector:withObject:afterDelay:
-(void)method019
{
    MyObject *obj = [[MyObject alloc] init];
    [obj performSelector:@selector(messageA)
              withObject:nil
              afterDelay:2
     ];
    [obj performSelector:@selector(messageWith:)
              withObject:@"Happy new year!"
              afterDelay:3
     ];
}


#pragma mark performSelector:withObject:afterDelay:inModes:
-(void)method020
{
    MyObject *obj = [[MyObject alloc] init];
    [obj performSelector:@selector(messageWith:)
              withObject:@"method020 message!"
              afterDelay:3
                 inModes:[NSArray arrayWithObjects:NSDefaultRunLoopMode, nil]
     ];
}

#pragma mark performSelectorOnMainThread:withObject:waitUntilDone:
-(void)method021
{
    MyObject *obj = [[MyObject alloc] init];
    [obj performSelectorOnMainThread:@selector(messageWith:)
                          withObject:@"method021 message!"
                       waitUntilDone:YES
     ];
}

#pragma mark performSelectorOnMainThread:withObject:waitUntilDone:modes:
-(void)method022
{
    MyObject *obj = [[MyObject alloc] init];
    [obj performSelectorOnMainThread:@selector(messageWith:)
                          withObject:@"method022 message!"
                       waitUntilDone:YES
                             modes:[NSArray arrayWithObjects:@"kCFRunLoopCommonModes", nil]
     ];
}

#pragma mark performSelector:onThread:withObject:waitUntilDone:
-(void)method023
{
    MyObject *obj = [[MyObject alloc] init];
    NSThread *thread = [NSThread mainThread];
    [obj performSelector:@selector(messageWith:)
                onThread:thread
              withObject:@"method023 message!"
           waitUntilDone:YES
     ];
}

#pragma mark performSelector:onThread:withObject:waitUntilDone:modes:
-(void)method024
{
    MyObject *obj = [[MyObject alloc] init];
    NSThread *thread = [NSThread mainThread];
    [obj performSelector:@selector(messageWith:)
                onThread:thread
              withObject:@"method024 message!"
           waitUntilDone:YES
     modes:[NSArray arrayWithObjects:@"kCFRunLoopCommonModes", nil]
     ];
}

#pragma mark performSelectorInBackground:withObject:
-(void)method025
{
    MyObject *obj = [[MyObject alloc] init];
    [obj performSelectorInBackground:@selector(messageWith:)
              withObject:@"method025 message!"
               ];
}

#pragma mark cancelPreviousPerformRequestsWithTarget:
-(void)method026
{
    MyObject *obj = [[MyObject alloc] init];
    [obj performSelector:@selector(messageWith:)
              withObject:@"method026 message!"
              afterDelay:3
                 inModes:[NSArray arrayWithObjects:NSDefaultRunLoopMode, nil]
     ];
    [MyObject cancelPreviousPerformRequestsWithTarget:obj];
}

#pragma mark cancelPreviousPerformRequestsWithTarget:selector:object:
-(void)method027
{
    MyObject *obj = [[MyObject alloc] init];
    [obj performSelector:@selector(messageWith:)
              withObject:@"method027 message!"
              afterDelay:3
                 inModes:[NSArray arrayWithObjects:NSDefaultRunLoopMode, nil]
     ];
    [MyObject cancelPreviousPerformRequestsWithTarget:obj
                                             selector:@selector(messageWith:)
                                               object:@"method027 message!"];
}

#pragma mark cancelPreviousPerformRequestsWithTarget:selector:object:
-(void)method028
{
    MyObject *obj = [[MyObject alloc] init];
    //id target = [obj forwardingTargetForSelector:@selector(messageWith:)];
    [obj performSelector:@selector(messageWith)
              withObject:@"method028 message!"
              afterDelay:3
                 inModes:[NSArray arrayWithObjects:NSDefaultRunLoopMode, nil]
     ];
    //NSLog(@"%s %@",__FUNCTION__,[target description]);
    
    SEL aSelector  = @selector( messageWith: );//セレクタをセット
    NSMethodSignature *aSignature = [ obj methodSignatureForSelector:aSelector ];//セレクタのシグネチャをセット
	
    NSInvocation *anInvocation = [ NSInvocation invocationWithMethodSignature:aSignature ];//起動オブジェクトをセット
	
	//起動オブジェクトにターゲットと引数をセットする
    [ anInvocation setTarget: obj ];//ターゲットはself
    [ anInvocation setSelector: aSelector ];//セレクタをセット
    
    [anInvocation invoke];


}

#pragma mark

//動的にメソッドを作る
-(void)method029
{
    MyObject *obj = [[MyObject alloc] init];
    [obj performSelector:@selector(resolveThisMethodDynamically)
              withObject:nil
              afterDelay:3
     ];
}

#pragma mark - (id)awakeAfterUsingCoder:(NSCoder *)aDecoder;
//作成中
-(void)method030
{
    MyObject *obj = [[MyObject alloc] init];
    [obj setValue:@"!!!" forKey:@"string"];
    NSLog(@"%s obj = %@",__FUNCTION__,[obj description]);
    //アーカイブ
    NSData *dat = [NSKeyedArchiver archivedDataWithRootObject:obj ];
    
    NSLog(@"%s %@",__FUNCTION__,[dat description]);


    //アンアーカイブ
    MyObject *unArchivedObj = [NSKeyedUnarchiver unarchiveObjectWithData:dat];
    NSLog(@"%s unArchivedObj = %@",__FUNCTION__,[unArchivedObj description]);
    //NSLog(@"%s unArchivedObj = %@",__FUNCTION__,[unArchivedObj valueForKey:@"string"]);
    //NSCoder *aCoder = [[NSCoder alloc]init];
    //[aCoder encodeRootObject:obj];
    //id aObj = [obj awakeAfterUsingCoder:aCoder];

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
    //[self method018];
    [self method019];
    [self method020];
    
    [self method021];
    [self method022];
    [self method023];
    
    [self method024];
    [self method025];
    
    //[self method026];
    
    [self method027];
    
    [self method028];
    
    [self method029];
    [self method030];
    
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
