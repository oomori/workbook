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
#import <arpa/inet.h>

//#define kGameIdentifier		@"witap"

@implementation OOOAppDelegate
//********************************************************************
//メッセージ送信
- (void) send:(const uint8_t)message
{
    
	NSString * str = @"GET /docs/sw/http-header.html HTTP/1.1\n\n";//[messageField stringValue];
	const uint8_t * rawstring =  (const uint8_t *)[str UTF8String];
	
	const uint8_t * header[256] ;
	header[0] = (uint8_t *)strlen((const char *)rawstring);//バイト数
	header[1] = (uint8_t *)5;
	
	//ヘッダ送信
	if (_outStream && [_outStream hasSpaceAvailable]){
		if([_outStream write:header maxLength:256] == -1){}
	}
	
	
	
	//ボディ送信
	if (_outStream && [_outStream hasSpaceAvailable])
		if([_outStream write:rawstring maxLength:strlen((const char *)rawstring)] == -1){
            
			//[self _showAlert:@"Failed sending data to peer"];
        }
}

-(void)method001
{
    //ネットサービスをつくる
    NSNetService *nService = [[NSNetService alloc] initWithDomain:@"local"
                                                             type:@"_http._tcp"
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
    //[nServiceBrowser searchForServicesOfType:@"_http._tcp." inDomain:@"192.168.0.181."];
    [nServiceBrowser searchForServicesOfType:@"_http._tcp." inDomain:@"_local."];
    
    [nServiceBrowser searchForRegistrationDomains];
    //デリゲートを返す
    NSLog(@"delegate= %@",[[nServiceBrowser delegate] class]);
    //停止
    //[nServiceBrowser stop];
    
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
    //[nService removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    //アドレスの決定を試みる
    [nService resolveWithTimeout:5.0];
    
    [nService2  resolveWithTimeout:5.0];
    //実行を停止
    [nService stop];
    [nService2 stop];
    //タイプを返す
    NSLog(@"type= %@",[nService type]);
    NSLog(@"type= %@",[nService2 type]);
    
    //実行ループから削除
    [nServiceBrowser removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
}
-(void)method002
{

    
    
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
-(void)method003
{
    services = [NSMutableArray arrayWithCapacity:5];
    NSString *domain = @"local";
    NSString *protocol = @"_http._tcp";
    NSString *name = @"";
    int portNumber = 12345;
    
    NSNetService *nService = [[NSNetService alloc] initWithDomain:domain type:protocol name:name port: portNumber];
    [nService scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    [nService publish];
    [nService setDelegate:self];
    
    [services addObject:nService];
    
}

-(void)openStreams {
	_inStream.delegate = self;
	[_inStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	[_inStream open];
	_outStream.delegate = self;
	[_outStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	[_outStream open];
}



- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)streamEvent {
    //NSLog(@"handleEvent: %d",streamEvent);
    NSInputStream * istream;
    switch(streamEvent) {
        case NSStreamEventHasBytesAvailable:;
            NSLog(@"NSStreamEventHasBytesAvailable");
            uint8_t oneByte;
            int actuallyRead = 0;
            istream = (NSInputStream *)stream;
            if (!dataBuffer) {
                dataBuffer = [[NSMutableData alloc] initWithCapacity:2048];
            }
            actuallyRead = [istream read:&oneByte maxLength:1];
            if (actuallyRead == 1) {
                [dataBuffer appendBytes:&oneByte length:1];
            }
            if (oneByte == '\n') {
                // We've got the carriage return at the end of the echo. Let's set the string.
                NSString * string = [[NSString alloc] initWithData:dataBuffer encoding:NSUTF8StringEncoding];
                NSLog(@"%@",string);
                dataBuffer = nil;
            }
            
            break;
        case NSStreamEventEndEncountered:
            NSLog(@"NSStreamEventEndEncountered");
            //[self closeStreams];
            break;
        case NSStreamEventHasSpaceAvailable:
            NSLog(@"NSStreamEventHasSpaceAvailable");
            break;
        case NSStreamEventErrorOccurred:
            NSLog(@"NSStreamEventErrorOccurred");
            break;
        case NSStreamEventOpenCompleted:
            NSLog(@"NSStreamEventOpenCompleted");
            break;
        case NSStreamEventNone:
            NSLog(@"NSStreamEventNone");
        default:
            break;
    }
}
//- (void)netServiceDidResolveAddress:(NSNetService *)sender
//{
//    
//    NSLog(@"netServiceDidResolveAddress: %@", [sender description]);
//    self.netService = sender;
//    NSLog(@"HostName: %@", [sender addresses]);
//}
- (void)netServiceWillPublish:(NSNetService *)netService
{
    NSLog(@"netServiceWillPublish");
    
}
- (void)netServiceWillResolve:(NSNetService *)sender {
    NSLog(@"OOO netServiceWillResolve %@",[sender description]);
    self.netService = sender;
    //[services addObject:sender];

}

- (void)netServiceDidResolveAddress:(NSNetService *)netService {
    NSLog(@"netServiceDidResolveAddress");
    NSString *name = nil;
    NSData *address = nil;
    struct sockaddr_in *socketAddress = nil;
    NSString *ipString = nil;
    int port;
    name = [self.netService name];
    address = [[self.netService addresses] objectAtIndex: 0];
    socketAddress = (struct sockaddr_in *) [address bytes];
    ipString = [NSString stringWithFormat: @"%s",inet_ntoa(socketAddress->sin_addr)];
    port = socketAddress->sin_port;
    // This will print the IP and port for you to connect to.
    NSLog(@"%@", [NSString stringWithFormat:@"Resolved:%@-->%@:%u\n", [self.netService hostName], ipString, port]);
    
    [self openStreams];
    
    NSLog(@"services %@",[services description]);
}
- (void)netService:(NSNetService *)sender didNotResolve:(NSDictionary *)errorDict
{
    NSLog(@"didNotResolve: %@", [sender description]);
}


- (void)netServiceDidPublish:(NSNetService *)sender {
    NSLog(@"netServiceDidPublish");
}

- (void)netService:(NSNetService *)sender didNotPublish:(NSDictionary *)errorDict {
    NSLog(@"didNotPublish");
}


- (void)netServiceBrowserWillSearch:(NSNetServiceBrowser *)netServiceBrowser {
    NSLog(@"netServiceBrowserWillSearch");
}
//NSNetServiceが見つかったら呼び出される
- (void)netServiceBrowser:(NSNetServiceBrowser*)netServiceBrowser didFindService:(NSNetService*)service moreComing:(BOOL)moreComing {
	
    
    [service setDelegate:self];
    [service scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];

    [service resolveWithTimeout:5.0];
    [services addObject:service];
    
    NSLog(@"didFindService: %@  lenght:%d %@",self.netService.name,[self.netService.name length],[[self.netService addresses] description]);
    
    //指定の名前であればストリームを開く
    if ([@"Canon MG3100 series" isEqualToString:self.netService.name]) {
        NSLog(@"didFindService: %@",self.netService.addresses);
        NSInputStream		*inStream;
        NSOutputStream		*outStream;
        if (![self.netService getInputStream:&inStream outputStream:&outStream]) {
            NSLog(@"Failed connecting to server");
            return;
        }
        _inStream=inStream;
        _outStream=outStream;
    }

    
	if (!moreComing) {
		//見つかったのがこれで全部なのでUIの書き換えとかやる
        NSLog(@"end %@",[self.netService description]);
        NSLog(@"HostName: %@", [self.netService hostName]);
	}
}

- (void)netServiceBrowser:(NSNetServiceBrowser*)netServiceBrowser didRemoveService:(NSNetService*)service moreComing:(BOOL)moreComing {
    //解決中のNSNetServiceかどうかチェック
    NSLog(@"netServiceBrowser:didRemoveService: %@", [service hostName]);
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
    //[self method001];
    [self method003];

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
