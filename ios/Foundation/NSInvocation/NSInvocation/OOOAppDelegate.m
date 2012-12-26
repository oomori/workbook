//
//  OOOAppDelegate.m
//  NSInvocation
//
//  Created by 大森 智史 on 12/05/06.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark :
NSTimer *timer=nil;
NSInvocation * invocation ;//起動オブジェクト

-(NSInteger) testSelector1:(NSString *)string
{
    NSLog(@"...call %s",__FUNCTION__);
    
	//やっぱり testSelector2:メソッドを呼び出すことにする
	[invocation setSelector:@selector( testSelector2: )];
	
    
    //タイマーで1秒後にinvocationオブジェクを起動
	timer = [NSTimer scheduledTimerWithTimeInterval:1
                                         invocation:	invocation
                                            repeats:NO];
	return 1;
}
-(NSInteger) testSelector2:(NSString *)string
{
    NSLog(@"...call %s",__FUNCTION__);
	
	//やっぱり testSelector1:メソッドを呼び出すことにする
	[invocation setSelector:@selector( testSelector1: )];
	
	//タイマーで1秒後にinvocationオブジェクを起動
	timer = [NSTimer scheduledTimerWithTimeInterval:1
                                         invocation:	invocation
                                            repeats:NO];
	return 2;
}

-(void)method001
{
    //呼び出すメソッドをコロコロ変えるサンプル
    NSMethodSignature * aSignature ;//メソッドシグネチャ    
    SEL aSelector  = @selector( testSelector1: );//セレクタをセット	
    aSignature = [ self methodSignatureForSelector:aSelector ];//セレクタのシグネチャをセット
	
    invocation = [ NSInvocation invocationWithMethodSignature:aSignature ];//起動オブジェクトをセット
	//引数の保持
    NSLog(@"argumentsRetained %@",([invocation argumentsRetained])?@"YES":@"NO");
    [invocation retainArguments];
	NSLog(@"argumentsRetained %@",([invocation argumentsRetained])?@"YES":@"NO");
    
	NSLog(@"%@",[aSignature description]);
	
	//起動オブジェクトにターゲットと引数をセットする
    [ invocation setTarget: self ];//ターゲットはself
    [ invocation setSelector: aSelector ];//セレクタをセット
    [ invocation invoke ];//起動する
  
}
#pragma mark NSInvocation invoke:
-(void) testSelector002:(NSString *)string
{
    NSLog(@"...call %s %@",__FUNCTION__,string);
    
}
-(void)method002
{
    SEL aSelector  = @selector( testSelector002: );//セレクタをセット
    NSMethodSignature *aSignature = [ self methodSignatureForSelector:aSelector ];//セレクタのシグネチャをセット
	
    NSInvocation *aInvocation = [ NSInvocation invocationWithMethodSignature:aSignature ];//起動オブジェクトをセット
	
	//起動オブジェクトにターゲットと引数をセットする
    [ aInvocation setTarget: self ];//ターゲットはself
    [ aInvocation setSelector: aSelector ];//セレクタをセット

    
    NSArray *anArray = 
    [[NSArray alloc] initWithObjects:   @"aaa",@"bbb",@"ccc",
     @"ddd",@"eee",@"fff",
     @"ggg",@"hhh",@"iii",nil];
    
    [anArray enumerateObjectsWithOptions:NSEnumerationConcurrent //並列 
                                        //NSEnumerationReverse  //逆向き
                              usingBlock:^(id s,NSUInteger idx,BOOL *stop){

                                  //起動
                                  //配列の要素を引数としてメソッドを起動する
                                  [ aInvocation setArgument:&s atIndex:2];
                                        //-(void) testSelector002:(NSString *)stringの引数
                                        //0 self  通常隠されている
                                        //1 _cmd  通常隠されている
                                        //2 (NSString *)string
                                  [ aInvocation invoke ];//起動する

                                  
                              }]; 
    //=>...call -[OOOAppDelegate testSelector002:] aaa
    //=>...call -[OOOAppDelegate testSelector002:] bbb
    //=>...call -[OOOAppDelegate testSelector002:] ccc
    //=>...call -[OOOAppDelegate testSelector002:] ddd
    //=>...call -[OOOAppDelegate testSelector002:] eee
    //=>...call -[OOOAppDelegate testSelector002:] fff
    //=>...call -[OOOAppDelegate testSelector002:] ggg
    //=>...call -[OOOAppDelegate testSelector002:] hhh
    //=>...call -[OOOAppDelegate testSelector002:] iii

}
#pragma mark NSInvocation getArgumentTypeAtIndex:
-(void) testSelector003:(NSString *)string
{
    NSLog(@"...call %s %@",__FUNCTION__,string);
    
}
-(void)method003
{
    SEL aSelector  = @selector( testSelector003: );//セレクタをセット
    NSMethodSignature *aSignature = [ self methodSignatureForSelector:aSelector ];//セレクタのシグネチャをセット
	
    NSInvocation *anInvocation = [ NSInvocation invocationWithMethodSignature:aSignature ];//起動オブジェクトをセット
	
	//起動オブジェクトにターゲットと引数をセットする
    [ anInvocation setTarget: self ];//ターゲットはself
    [ anInvocation setSelector: aSelector ];//セレクタをセット
    
    NSMethodSignature *methodSignature = [anInvocation methodSignature];
    NSInteger counter = [methodSignature numberOfArguments];
    
    for (NSInteger i=0; i<counter; i++) {
        const char *argInfo = [methodSignature getArgumentTypeAtIndex:i];
        NSString *str = [NSString stringWithCString:argInfo encoding:NSASCIIStringEncoding];        
        NSLog(@"%s %@",__FUNCTION__,str);
        
    }
    //-(void) testSelector003:(NSString *)stringについての情報
    //=>-[OOOAppDelegate method001] @ //引数0  self　@オブジェクト
    //=>-[OOOAppDelegate method001] : //引数1  _cmd       :セレクタ
    //=>-[OOOAppDelegate method001] @ //引数2  (NSString *) @オブジェクト
    //@encode(@)などでタイプが表せる
    //NSString *  @
    //NSString ** ^@
    //BOOL        c
    //int         i
    //float       f
    //SEL         :
    //NSInteger   i
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
