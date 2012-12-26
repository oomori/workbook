//
//  OOOAppDelegate.m
//  NSJSONSerialization
//
//  Created by 大森 智史 on 2012/09/03.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize inputStream;
@synthesize outputStream;
@synthesize recieveData;

#pragma mark JSONObjectWithData

- (void)displayText:(NSString *)text {

    NSLog(@"table %@",text);
    
}

-(void)method001
{
	TWRequest *postRequest = [[TWRequest alloc] initWithURL:[NSURL URLWithString:@"http://api.twitter.com/1/statuses/public_timeline.json"] parameters:nil requestMethod:TWRequestMethodGET];
	
	[postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
		NSString *output;
		
		if ([urlResponse statusCode] == 200) {
			NSError *jsonParsingError = nil;
            
			NSDictionary *publicTimeline = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonParsingError];
			output = [NSString stringWithFormat:@"HTTP response status: %i\nPublic timeline:\n%@", [urlResponse statusCode], publicTimeline];
		}
		else {
			output = [NSString stringWithFormat:@"HTTP response status: %i\n", [urlResponse statusCode]];
		}
		
		[self performSelectorOnMainThread:@selector(displayText:) withObject:output waitUntilDone:NO];
	}];
    
    
}

#pragma mark 
-(void)method002
{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"value1",@"key1",@"value2",@"key2", nil];
    
    NSError *error = nil;
    NSData *data = nil;
    BOOL isValid = [NSJSONSerialization isValidJSONObject:dic];
    NSLog((isValid)?@"YES":@"NO");
    if(isValid){
        data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
        NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }
    
}

#pragma mark
-(void)method003
{
    NSUInteger portNo = 80;
    CFStringRef hostName = CFSTR("api.twitter.com");
    
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
    
    
     [inputStream open];
    [outputStream open];
    
    const char *request = "GET /1/statuses/public_timeline.json HTTP/1.0\r\nHost: api.twitter.com\r\n\r\n";
    
    [outputStream write:(const uint8_t*)request maxLength:strlen(request)];
    /*
    NSError *jsonParsingError = nil;
    
    NSDictionary *publicTimeline = [NSJSONSerialization JSONObjectWithStream:inputStream options:0 error:&jsonParsingError];
    
    
    NSLog(@"%@",[publicTimeline description]);
    */ 
}
#pragma mark JSONObjectWithStream
-(void)method004
{
 
    NSData *tweets = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.search.twitter.com/search.json?q=from:oogon"]];
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
    

}

#pragma mark writeJSONObject
//書き出し
-(void)method005
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
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //[self method001];
    //[self method002];
    //[self method003];
    //[self method004];
    [self method005];
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
            NSLog(@"NSStreamEventOpenCompleted");
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
