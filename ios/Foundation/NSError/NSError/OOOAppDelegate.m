//
//  OOOAppDelegate.m
//  NSError
//
//  Created by 大森 智史 on 12/07/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark NSError errorWithDomain:code:userInfo:

-(void)method001
{
    for (int i=1; i<105; i++) {
        
    
    NSError *anError = [NSError errorWithDomain:NSPOSIXErrorDomain
                                           code:i
                                       userInfo:nil
                        ];

    NSLog(@"%s %@",__FUNCTION__,[anError description]);
    }
}

#pragma mark NSError errorWithDomain:code:userInfo:

-(void)method002
{
    NSHTTPURLResponse *aResponse;
	NSError *anError;
	NSURL *url = [NSURL URLWithString:@"http://www.apple.com/"];
	NSURLRequest *req = [NSURLRequest requestWithURL:url];
	NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&aResponse error:&anError];
	if (!anError) {
		NSLog(@"data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"%s %@",__FUNCTION__,[anError description]);
		NSLog(@"status code: %d", [aResponse statusCode]);
	} else {
		NSLog(@"error: %@", anError);
	}
    
}

#pragma mark NSError errorWithDomain:code:userInfo:

-(void)method003
{
    //NSCocoaErrorDomain
    //userInfo
    //  NSFilePath
    //  NSUnderlyingError
    //  NSUserStringVariant
    //存在しないファイルを削除する
    NSError *anError = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *itemPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"] stringByAppendingPathComponent:@"test"];
    [fileManager removeItemAtPath: itemPath
                            error: &anError];
    
    NSLog(@"%s code = %d",__FUNCTION__,[anError code]);
    NSLog(@"%s domain = %@",__FUNCTION__,[anError domain]);
    NSLog(@"%s userInfo = %@",__FUNCTION__,[[anError userInfo] description]);
    NSLog(@"%s localizedDescription = %@",__FUNCTION__,[anError localizedDescription]);
    NSLog(@"%s localizedRecoveryOptions = %@",__FUNCTION__,[anError localizedRecoveryOptions]);
    NSLog(@"%s localizedRecoverySuggestion = %@",__FUNCTION__,[anError localizedRecoverySuggestion]);
    NSLog(@"%s localizedFailureReason = %@",__FUNCTION__,[anError localizedFailureReason]);

}

#pragma mark NSURL URLWithString:
-(void)method004
{
    NSHTTPURLResponse *aResponse;
	NSError *anError;
	NSURL *baseUrl = [NSURL URLWithString:@"http://www.apple.com/"];
    NSURL *url = [NSURL URLWithString:@" index.html" relativeToURL:baseUrl];
    
	NSURLRequest *req = [NSURLRequest requestWithURL:url];
	NSData *data = [NSURLConnection sendSynchronousRequest:req returningResponse:&aResponse error:&anError];
	if (!anError) {
		NSLog(@"data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"%s %@",__FUNCTION__,[anError description]);
		NSLog(@"status code: %d", [aResponse statusCode]);
	} else {
		
        NSLog(@"%s code = %d",__FUNCTION__,[anError code]);
        NSLog(@"%s domain = %@",__FUNCTION__,[anError domain]);
        NSLog(@"%s userInfo = %@",__FUNCTION__,[[anError userInfo] description]);
        NSLog(@"%s localizedDescription = %@",__FUNCTION__,[anError localizedDescription]);
        NSLog(@"%s localizedRecoveryOptions = %@",__FUNCTION__,[anError localizedRecoveryOptions]);
        NSLog(@"%s localizedRecoverySuggestion = %@",__FUNCTION__,[anError localizedRecoverySuggestion]);
        NSLog(@"%s localizedFailureReason = %@",__FUNCTION__,[anError localizedFailureReason]);
	}    
}

#pragma mark NSURL URLWithString:
-(void)method005
{
	NSError *anError;
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filename = @"testWritecharset2.bitmap";
    NSURL *absoluteURL = [NSURL fileURLWithPathComponents:[NSArray arrayWithObjects:documentsDirectory, filename, nil]];
    
    if ([absoluteURL checkResourceIsReachableAndReturnError:&anError]) {
        NSLog(@"%s %@",__FUNCTION__,[anError description]);
    }else {
        NSLog(@"%s %@",__FUNCTION__,[anError description]);
        NSLog(@"%s code = %d",__FUNCTION__,[anError code]);
        NSLog(@"%s domain = %@",__FUNCTION__,[anError domain]);
        NSLog(@"%s userInfo = %@",__FUNCTION__,[[anError userInfo] description]);
        NSLog(@"%s localizedDescription = %@",__FUNCTION__,[anError localizedDescription]);
        NSLog(@"%s localizedRecoveryOptions = %@",__FUNCTION__,[anError localizedRecoveryOptions]);
        NSLog(@"%s localizedRecoverySuggestion = %@",__FUNCTION__,[anError localizedRecoverySuggestion]);
        NSLog(@"%s localizedFailureReason = %@",__FUNCTION__,[anError localizedFailureReason]);
    }
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
    [self method002];
    [self method003];
    [self method004];
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
