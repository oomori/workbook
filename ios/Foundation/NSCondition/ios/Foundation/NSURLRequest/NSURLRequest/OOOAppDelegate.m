//
//  OOOAppDelegate.m
//  NSURLRequest
//
//  Created by 大森 智史 on 12/07/19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark NSURLRequest requestWithURL:

-(void)method001
{
    NSHTTPURLResponse *aResponse;
	NSError *anError;
	NSURL *url = [NSURL URLWithString:@"http://www.apple.com/"];
	NSURLRequest *req = [NSURLRequest requestWithURL:url];
	NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&aResponse error:&anError];
	if (!anError) {
		NSLog(@"%s data: %@",__FUNCTION__, [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"%s %@",__FUNCTION__,[anError description]);
		NSLog(@"%s status code: %d",__FUNCTION__, [aResponse statusCode]);
	} else {
		NSLog(@"%s error: %@",__FUNCTION__, anError);
	}
    NSLog(@"%s URL: %@",__FUNCTION__ ,[aResponse URL]);
    //NSLog(@"%s URL: %@",__FUNCTION__ ,[aResponse networkServiceType]);
    switch ([req networkServiceType]) {
        case NSURLNetworkServiceTypeDefault:
            NSLog(@"NSURLNetworkServiceTypeDefault");
            break;
        case NSURLNetworkServiceTypeVoIP:
            NSLog(@"NSURLNetworkServiceTypeVoIP");
            break;
        case NSURLNetworkServiceTypeVideo:
            NSLog(@"NSURLNetworkServiceTypeVideo");
            break;
        case NSURLNetworkServiceTypeBackground:
            NSLog(@"NSURLNetworkServiceTypeBackground");
            break;
        case NSURLNetworkServiceTypeVoice:
            NSLog(@"NSURLNetworkServiceTypeVoice");
            break;
            
        default:
            break;
    }
    
    switch ([req cachePolicy]) {
        case NSURLRequestUseProtocolCachePolicy:
            NSLog(@"NSURLRequestUseProtocolCachePolicy");
            break;
        case NSURLRequestReloadIgnoringLocalCacheData:
            NSLog(@"NSURLRequestReloadIgnoringLocalCacheData");
            break;
        case NSURLRequestReloadIgnoringLocalAndRemoteCacheData:
            NSLog(@"NSURLRequestReloadIgnoringLocalAndRemoteCacheData");
            break;
        case NSURLRequestReturnCacheDataElseLoad:
            NSLog(@"NSURLRequestReturnCacheDataElseLoad");
            break;
        case NSURLRequestReturnCacheDataDontLoad:
            NSLog(@"NSURLRequestReturnCacheDataDontLoad");
            break;
        case NSURLRequestReloadRevalidatingCacheData:
            NSLog(@"NSURLRequestReloadRevalidatingCacheData");
            break;
        default:
            break;
    }
    
    NSLog(@"%s timeoutInterval: %f",__FUNCTION__ ,[req timeoutInterval]);
    NSLog(@"%s mainDocumentURL: %@",__FUNCTION__ ,[req mainDocumentURL]);
    NSLog(@"%s HTTPShouldUsePipelining: %@",__FUNCTION__ ,([req HTTPShouldUsePipelining])?@"YES":@"NO");
    
    NSLog(@"%s allHTTPHeaderFields: %@",__FUNCTION__ ,[req allHTTPHeaderFields]);
    
    
}

#pragma mark NSURLRequest initWithURL:

-(void)method002
{
    NSHTTPURLResponse *aResponse;
	NSError *anError;
	NSURL *url = [NSURL URLWithString:@"http://www.apple.com/"];
	NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url];
	NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&aResponse error:&anError];
	if (!anError) {
		NSLog(@"data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"%s %@",__FUNCTION__,[anError description]);
		NSLog(@"status code: %d", [aResponse statusCode]);
	} else {
		NSLog(@"error: %@", anError);
	}
    
    
}

#pragma mark NSURLRequest requestWithURL:cachePolicy:timeoutInterval:

-(void)method003
{
    NSHTTPURLResponse *aResponse;
	NSError *anError;
	NSURL *url = [NSURL URLWithString:@"http://www.apple.com/"];
	NSURLRequest *req = [NSURLRequest requestWithURL:url
                                         cachePolicy:NSURLRequestUseProtocolCachePolicy
                                     timeoutInterval:3];
                         
	NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&aResponse error:&anError];
	if (!anError) {
		NSLog(@"data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"%s %@",__FUNCTION__,[anError description]);
		NSLog(@"status code: %d", [aResponse statusCode]);
        
        NSLog(@"%s timeoutInterval: %f",__FUNCTION__ ,[req timeoutInterval]);
        NSLog(@"%s mainDocumentURL: %@",__FUNCTION__ ,[req mainDocumentURL]);
        NSLog(@"%s HTTPShouldUsePipelining: %@",__FUNCTION__ ,([req HTTPShouldUsePipelining])?@"YES":@"NO");
        
        NSLog(@"%s allHTTPHeaderFields: %@",__FUNCTION__ ,[req allHTTPHeaderFields]);
        
        NSLog(@"http HTTPBodyStream = %@", [req HTTPBodyStream]);
        
	} else {
		NSLog(@"error: %@", anError);
	}
}

#pragma mark NSURLRequest initWithURL:cachePolicy:timeoutInterval:

-(void)method004
{
    NSHTTPURLResponse *aResponse;
	NSError *anError;
	NSURL *url = [NSURL URLWithString:@"http://www.apple.com/"];
	NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:3];

	NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&aResponse error:&anError];
	if (!anError) {
		NSLog(@"data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"%s %@",__FUNCTION__,[anError description]);
		NSLog(@"status code: %d", [aResponse statusCode]);
	} else {
		NSLog(@"error: %@", anError);
	}
}

#pragma mark NSURLRequest initWithURL:cachePolicy:timeoutInterval:

-(void)method005
{
    //NSHTTPURLResponse *aResponse;
	//NSError *anError;
	NSURL *url = [NSURL URLWithString:@"http://www.apple.com/"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
                         
    NSMutableURLRequest *req = (NSMutableURLRequest *)request;
    //NSString *versionString = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    NSLog(@"http headers = %@", [request allHTTPHeaderFields]);
    NSLog(@"http allHTTPHeaderFields = %lld", [[req allHTTPHeaderFields] fileSize]);
  
    NSLog(@"http HTTPBodyStream = %@", [request HTTPBodyStream]);
    
    //NSLog(@"user agent = %@", [request valueForHTTPHeaderField: @"User-Agent"]);

//	NSURLRequest *req = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                          timeoutInterval:3];
//    
//	NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&aResponse error:&anError];
//	if (!anError) {
//		NSLog(@"data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
//        NSLog(@"%s %@",__FUNCTION__,[anError description]);
//		NSLog(@"status code: %d", [aResponse statusCode]);
//	} else {
//		NSLog(@"error: %@", anError);
//	}
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"didReceiveData");
    NSString * receiveData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@", receiveData);
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"didReceiveResponse");
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    NSLog(@"%@", [httpResponse allHeaderFields] );
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //[self method001];
    //[self method002];
    [self method003];
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

@end
