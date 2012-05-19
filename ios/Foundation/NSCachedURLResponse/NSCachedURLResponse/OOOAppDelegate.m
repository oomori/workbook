//
//  OOOAppDelegate.m
//  NSCachedURLResponse
//
//  Created by 大森 智史 on 12/05/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;
//レスポンスをキャッシュしようとしたときに呼び出されます。
-(NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse
{
    switch ([cachedResponse storagePolicy]){
        case NSURLCacheStorageAllowed:
			NSLog(@"NSURLCacheStorageAllowed");
			break;
        case NSURLCacheStorageAllowedInMemoryOnly:
			NSLog(@"NSURLCacheStorageAllowedInMemoryOnly");
			break;
        case NSURLCacheStorageNotAllowed:
			NSLog(@"NSURLCacheStorageNotAllowed");
			break;
            
	}
    return nil;
}


#pragma mark allObjects
-(void)method001
{
    connection = nil;
    NSURL *url = [NSURL URLWithString:@"http://www.oomori.com"];
    
    
    if (url) {
        
        NSURLRequest *ureq = [NSURLRequest requestWithURL:url];
        
        connection = [NSURLConnection connectionWithRequest:ureq delegate:self];
        
        NSLog(@"%@",[[ureq allHTTPHeaderFields] description]);  
        NSLog(@"%@",[[ureq HTTPBody] description]);  
        NSLog(@"HTTPMethod %@",[[ureq HTTPMethod] description]);  
        ([ureq HTTPShouldHandleCookies]) ? NSLog(@"HTTPShouldHandleCookies@YES") : NSLog(@"HTTPShouldHandleCookies@NO") ; 
        NSLog(@"%@",[[ureq mainDocumentURL] description]); 
        NSLog(@"%.1f",[ureq timeoutInterval]); 
        NSLog(@"%@",[[ureq URL] description]); 
        NSLog(@"%@",[[ureq valueForHTTPHeaderField:@"title"] description]);   
        
        //NSLog([connection description]); 
        //NSLog([[connection request] description]); 
        
        
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
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
