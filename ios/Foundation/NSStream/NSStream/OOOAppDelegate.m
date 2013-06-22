//
//  OOOAppDelegate.m
//  NSStream
//
//  Created by 大森 智史 on 2012/09/02.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"
#import <Security/Security.h>

@implementation OOOAppDelegate

@synthesize inputStream;
@synthesize outputStream;
@synthesize recieveData;


#pragma mark writeJSONObject
-(void)method001
{
    NSUInteger portNo = 80;
    CFStringRef hostName = CFSTR("www.apple.com");
    
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    
    CFStreamCreatePairWithSocketToHost(NULL, hostName, portNo, &readStream, &writeStream);
    
    assert(CFGetRetainCount(readStream) == 1L);
    assert(CFGetRetainCount(writeStream) == 1L);
    
    self.inputStream = (__bridge_transfer NSInputStream*) readStream;
    self.outputStream = (__bridge_transfer NSOutputStream*) writeStream;
    
    [inputStream setDelegate:self];
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream setDelegate:self];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [inputStream propertyForKey:NSStreamSocketSecurityLevelSSLv3];
    
    [inputStream open];
    [outputStream open];
    
    const char *request = "GET / HTTP/1.0\r\nHost: www.apple.com\r\n\r\n";
    
    [outputStream write:(const uint8_t*)request maxLength:strlen(request)];
}
#pragma mark JSONObjectWithStream
-(void)method002
{
    
    NSData *tweets = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.search.twitter.com/search.json?q=from:oogon"]];
    if (tweets) {
    NSInputStream *twitterStream = [[NSInputStream alloc] initWithData:tweets];
    [twitterStream open];
    
    if (twitterStream) {
        NSError *parseError = nil;
        id jsonObject = [NSJSONSerialization JSONObjectWithStream:twitterStream options:NSJSONReadingAllowFragments error:&parseError];
        if ([jsonObject respondsToSelector:@selector(objectForKey:)]) {
            for (NSDictionary *tweet in [jsonObject objectForKey:@"results"]) {
                NSLog(@"Tweet: %@", [tweet objectForKey:@"text"]);
            }
        }
    } else {
        NSLog(@"NG");
    }
        NSLog(@"NO DATA");
    }
    
}

#pragma mark writeJSONObject
//書き出し
-(void)method003
{
    NSData *tweetData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.search.twitter.com/search.json?q=oogon"]];
    NSError *parseError = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:tweetData options:NSJSONReadingAllowFragments error:&parseError];
    NSMutableArray *tweets = [[NSMutableArray alloc] init];
    if ([jsonObject respondsToSelector:@selector(objectForKey:)]) {
        //
        for (NSDictionary *tweet in [jsonObject objectForKey:@"results"]) {
            //
            NSDictionary *scrubbedTweet = [NSDictionary dictionaryWithObjectsAndKeys:
                                           [tweet objectForKey:@"id"], @"id",
                                           [tweet objectForKey:@"created_at"], @"created_at",
                                           [tweet objectForKey:@"text"], @"text",
                                           nil];
            
            [tweets addObject:scrubbedTweet];
        }
    }
    
    // 書き出し
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *path = [NSString stringWithFormat:@"%@/tweets.json", documents];
    NSOutputStream *oStream = [[NSOutputStream alloc] initToFileAtPath:path append:YES];
    [oStream open];
    
    // オブジェクト
    NSError *error = nil;
    NSInteger bytesWritten = [NSJSONSerialization writeJSONObject:tweets toStream:oStream options:NSJSONWritingPrettyPrinted error:&error];
    
    if (bytesWritten <= 0) {
        NSLog(@"NG");
    }
}

#pragma mark 
//
-(void)method004
{
    pop3Obj = [[OOOPOP3 alloc] init];
    [pop3Obj setUserName:@"oomori%iris.eonet.ne.jp"];
    [pop3Obj setPassWord:@""];

    
    [pop3Obj myAction];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //[self method001];
    [self method002];
    //[self method003];
    
    //[self method004];
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





- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode
{
    
    switch (eventCode) {
        case NSStreamEventHasBytesAvailable: {
            if(!recieveData) {
                recieveData = [NSMutableData data];
            }
            unsigned char buf[1024];
            unsigned int len = 0;
            if ([(NSInputStream *)aStream hasBytesAvailable])
            {
                
                len = [(NSInputStream *)aStream read:buf maxLength:1024];
                
                //NSString *str = [[NSString alloc] initWithBytes:buf length:1024 encoding:NSUTF8StringEncoding];
                //NSLog(@"%@", str);
                NSLog(@"%d", [recieveData length]);
                [recieveData appendBytes:(const void *)buf length:len];
                /*
                NSNotification *notifi = [[NSNotification notificationWithName:@"OOMORI_HTTP_RECIEVE" object:nil] retain];
                [[NSNotificationCenter defaultCenter] postNotification:notifi];
                */
                
                
            }

            
            //NSUInteger len = [(NSInputStream*)aStream read:buf maxLength:1024];
            
        }
            break;
        case NSStreamEventNone:
			NSLog(@"iNSStreamEventNone");
            break;
            
		case NSStreamEventHasSpaceAvailable:
			NSLog(@"NSStreamEventHasSpaceAvailable");
            break;
			
            //ÉXÉgÉäÅ[ÉÄÇÃèIÇÌÇË
		case NSStreamEventEndEncountered:
        {
			NSLog(@"iNSStreamEventEndEncountered");

			NSNotification *notifi = [NSNotification notificationWithName:@"OOMORI_HTTP_DONE" object:self];
			[[NSNotificationCenter defaultCenter] postNotification:notifi];
            //recieveData = nil;
            break;
        }
        case NSStreamEventOpenCompleted:
        {
            NSLog(@"iNSStreamEventEndEncountered");
            NSNotification *openNotifi = [NSNotification notificationWithName:@"OOMORI_HTTP_OPEN" object:nil];
            [[NSNotificationCenter defaultCenter] postNotification:openNotifi];
            break;
        }
        case NSStreamEventErrorOccurred:
        {
            NSLog(@"iNSStreamEventErrorOccurred");
			NSLog(@"i streamError %@",[[aStream streamError] description]);
            break;
        }
        default:
            break;
    }
}

@end
