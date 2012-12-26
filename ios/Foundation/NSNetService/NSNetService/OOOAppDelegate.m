//
//  OOOAppDelegate.m
//  NSNetService
//
//  Created by 大森 智史 on 2012/09/10.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"
#import "MyNetServiceBrowser.h"

#import "sys/socket.h"


#define kGameIdentifier		@"witap"

@implementation OOOAppDelegate

-(void)method001
{
    //ネットサービスをつくる
    NSNetService *nService = [[NSNetService alloc] initWithDomain:@"local."
                                                             type:@"_printer._tcp"
                                                             name:@"nService"
                              ];
    //ネットサービスをつくる2
    NSNetService *nService2 = [[NSNetService alloc] initWithDomain:@"local."
                                                              type:@"_tcp.local."//@"_ftp._tcp.local."
                                                              name:@"nService2"
                                                              port:80
                               ];
    
    //ネットサービスブラウザをつくる
    MyNetServiceBrowser *nServiceBrowser = [[MyNetServiceBrowser alloc] init];
    //デリゲートをセット
    [nServiceBrowser setDelegate:self];
    //実行ループに追加
    [nServiceBrowser scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    //ドメインの検索
    //[nServiceBrowser searchForAllDomains];
    //登録ドメインの検索
    [nServiceBrowser searchForRegistrationDomains];
    //指定ドメイン、サービスの検索
    //[nServiceBrowser searchForServicesOfType:@"_http._tcp." inDomain:@"www.oomori.com."];
    [nServiceBrowser searchForServicesOfType:@"_http._tcp." inDomain:@"192.168.0.181."];
    
    [nServiceBrowser searchForRegistrationDomains];
    //デリゲートを返す
    NSLog(@"delegate= %@",[[nServiceBrowser delegate] class]);
    //停止
    [nServiceBrowser stop];
    
    //デリゲートをセット
    [nService setDelegate:self];
    [nService2 setDelegate:self];
    //実行ループに追加
    [nService scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [nService2 scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    //名前を返す
    NSLog(@"name= %@",[nService name]);
    NSLog(@"name= %@",[nService2 name]);
    //アドレスを返す
    NSLog(@"addresses= %@",[[nService addresses] description]);
    NSLog(@"addresses= %@",[[nService2 addresses] description]);
    //デリゲートを返す
    NSLog(@"delegate= %@",[[nService delegate] class]);
    NSLog(@"delegate= %@",[[nService2 delegate] class]);
    //ドメインを返す
    NSLog(@"domain= %@",[nService domain]);
    NSLog(@"domain= %@",[nService2 domain]);
    //サービスを通知
    
    //[nService publish];
    [nService2 publish];
    
    //実行ループから削除
    [nService removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    /*
    //アドレスの決定を試みる
    [nService resolveWithTimeout:30];
    
    [nService2  resolveWithTimeout:30];
    //実行を停止
    [nService stop];
    [nService2 stop];
    //タイプを返す
    NSLog(@"type= %@",[nService type]);
    NSLog(@"type= %@",[nService2 type]);
    
    //実行ループから削除
    [nServiceBrowser removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    */
}
-(void)method002
{
    NSString *domain = @"local.";
    NSString *protocol = @"_http._tcp.";
    NSString *name = @"myserviceName";
    int portNumber = 80;
    
    self.netService = [[NSNetService alloc] initWithDomain:domain type:protocol name:name port: portNumber];
    [self.netService scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    [self.netService publish];
    [self.netService setDelegate:self];
    
    NSLog(@"%@",[self.netService description]);
    
    //ネットサービスブラウザをつくる
    NSNetServiceBrowser *myNetServiceBrowser = [[NSNetServiceBrowser alloc] init];
    //デリゲートをセット
    [myNetServiceBrowser setDelegate:self];
    //実行ループに追加
    [myNetServiceBrowser scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    myNetServiceBrowser.delegate = self;
    self.netServiceBrowser = myNetServiceBrowser;
    
    
    [self.netServiceBrowser searchForServicesOfType:@"_http._tcp." inDomain:@"local"];
    
}
- (void)netServiceDidResolveAddress:(NSNetService *)sender
{
    NSLog(@"netServiceDidResolveAddress: %@", [sender description]);
}
- (void)netService:(NSNetService *)sender didNotResolve:(NSDictionary *)errorDict
{
    NSLog(@"didNotResolve: %@", [sender description]);
}

//NSNetServiceが見つかった
- (void)netServiceBrowser:(NSNetServiceBrowser*)netServiceBrowser didFindService:(NSNetService*)service moreComing:(BOOL)moreComing {
	//[self.services addObject:service];
    NSLog(@"HostName: %@", [service hostName]);
    [service setDelegate:self];
    [service scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];

    [service resolveWithTimeout:0.0];
    
	if (!moreComing) {
		//見つかったのがこれで全部なのでUIの書き換えとかやる
        NSLog(@"end %@",[self.netService description]);
	}
}
- (void)netServiceBrowser:(NSNetServiceBrowser*)netServiceBrowser didRemoveService:(NSNetService*)service moreComing:(BOOL)moreComing {
    //解決中のNSNetServiceかどうかチェック
    /*
    if (self.currentService && [service isEqual:self.currentService]) {
		[self.currentService stop];
		self.currentService = nil;
	}
	
	//いなくなったNSNetServiceを消す
	[self.services removeObject:service];
	*/
	if (!moreComing) {
		//UIの書き換えとかやる
	}
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
    //[self method002];
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
