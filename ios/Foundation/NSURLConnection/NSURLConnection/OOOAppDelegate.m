//
//  OOOAppDelegate.m
//  NSURLConnection
//
//  Created by 大森 智史 on 12/07/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;
@synthesize receivedData;

#pragma mark NSURLConnection initWithRequest:
-(void)method001
{
    // ここから追加
    NSURL *theURL = [NSURL URLWithString:@"http://www.apple.com/"];
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:theURL];
    NSURLConnection *theConnection=[[NSURLConnection alloc] 
                                    initWithRequest:theRequest delegate:self];
    if (theConnection) {
        NSLog(@"start loading");
        receivedData = [NSMutableData data] ;
    }

}

#pragma mark NSArray indexOfObjectPassingTest:
- (void)connection:(NSURLConnection *)connection 
didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"didReceiveResponse");
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection 
    didReceiveData:(NSData *)data
{
    NSLog(@"didReceiveData");
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection 
  didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"connectionDidFinishLoading Received %d bytes of data",[receivedData length]);
    NSLog(@"%@", [[NSString alloc]initWithData:receivedData
                                      encoding:NSUTF8StringEncoding]);
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
