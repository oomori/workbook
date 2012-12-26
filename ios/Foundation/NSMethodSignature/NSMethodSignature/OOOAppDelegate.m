//
//  OOOAppDelegate.m
//  NSMethodSignature
//
//  Created by 大森 智史 on 12/05/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark NSMethodSignature methodSignatureForSelector
-(void) testSelector001:(NSString *)string
{
    NSLog(@"...call %s %@",__FUNCTION__,string);
    
}
-(void)method001
{
    SEL aSelector  = @selector( testSelector001: );//セレクタをセット
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
        NSLog(@"%s %d = %@",__FUNCTION__,i,str);

    }
    //-(void) testSelector001:(NSString *)stringについての情報
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


#pragma mark NSMethodSignature 
-(void) testSelector002:(NSString *)string
{
    NSLog(@"...call %s %@",__FUNCTION__,string);
    
}
-(void)method002
{
    NSString *types = [NSString stringWithFormat:@"%s%s%s%s",
                       @encode(id),     // 返り値
                       @encode(id),     // （隠れ）引数0 'self'
                       @encode(SEL),     //　（隠れ）引数1  _cmd
                       @encode(id)      //　引数2（見えてる引数の1番目）
                       ];
    NSLog(@"objcType: %s", @encode(NSRange));
/*
    NSLog(@"objcType: %s", @encode(NSNull));
    NSString *string = @"hoge";
    NSMethodSignature *sig = [string methodSignatureForSelector:@selector(compare:options:range:)];
    NSLog(@"%@", [sig debugDescription]);//プライベートメソッド
  */  
    NSMethodSignature* aSignature = [NSMethodSignature signatureWithObjCTypes:[types UTF8String]];

    NSInteger counter = [aSignature numberOfArguments];
    
    for (NSInteger i=0; i<counter; i++) {
        const char *argInfo = [aSignature getArgumentTypeAtIndex:i];
        NSString *str = [NSString stringWithCString:argInfo encoding:NSASCIIStringEncoding];
        NSLog(@"%s %d = %@",__FUNCTION__,i,str);
        
    }
    //=>-[OOOAppDelegate method002] 0 = @
    //=>-[OOOAppDelegate method002] 1 = :
    //=>-[OOOAppDelegate method002] 2 = @
    NSLog(@"%s returntype = %s,%d",__FUNCTION__,[aSignature methodReturnType],[aSignature methodReturnLength]);
    //=>-[OOOAppDelegate method002] returntype = @
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //[self method001];
    [self method002];
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
