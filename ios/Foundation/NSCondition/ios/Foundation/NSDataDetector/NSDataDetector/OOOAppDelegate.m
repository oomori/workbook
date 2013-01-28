//
//  OOOAppDelegate.m
//  NSDataDetector
//
//  Created by 大森 智史 on 2012/08/15.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

#pragma mark NSDataDetector  regularExpressionWithPattern:
-(void)method001
{
    
	NSString *str = @"My phone number is 01234567890.";
    NSError *error = nil;
    
    NSDataDetector *regExp = [NSDataDetector dataDetectorWithTypes:
                              (NSTextCheckingTypeLink | NSTextCheckingTypePhoneNumber)
                                                             error:&error];

     NSUInteger result = [regExp numberOfMatchesInString:str
                                                options:0
                                                  range:NSMakeRange(0, [str length])];
    NSLog(@"%s %u",__FUNCTION__,result);
    //=>-[OOOAppDelegate method001] 1
    
     
    
}

#pragma mark NSDataDetector　dataDetectorWithTypes　URL
-(void)method002
{
    NSString *aString = @"My site's URL is http://d.hatena.ne.jp/jjj777/.";
    NSDataDetector *aDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    NSArray *matches = [aDetector matchesInString:aString
                                          options:0
                                            range:NSMakeRange(0, [aString length])
                                                    ];
    
    for (NSTextCheckingResult *match in matches) {
        
        if ([match resultType] == NSTextCheckingTypeLink) {
            NSString *matchingString = [match description];
            NSLog(@"found URL: %@", matchingString);
        }
    }
    
}
#pragma mark NSDataDetector　matchesInString　URL
-(void)method003
{
    NSString *aString = @"My site's URL is http://d.hatena.ne.jp/jjj777/.";
    NSDataDetector *aDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    NSArray *resultArray = [aDetector matchesInString:aString
                                           options:0
                                             range:NSMakeRange(0, [aString length])];
    
    [resultArray enumerateObjectsWithOptions:NSEnumerationConcurrent //並列
                                  usingBlock:^(id obj,NSUInteger idx,BOOL *stop){
                                      NSTextCheckingResult *tcResult = (NSTextCheckingResult *)obj;
                                      NSLog(@"%s %@ %u-%u",__FUNCTION__,[obj URL],tcResult.range.location,tcResult.range.length );
                                      return;
                                      
                                  }];
    
}
#pragma mark NSDataDetector　date
-(void)method004
{
    NSString *aString = @"Today is 2012/8/15";
    NSError *error = nil;
    NSDataDetector *aDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeDate error:&error];
    NSArray *resultArray = [aDetector matchesInString:aString
                                              options:0
                                                range:NSMakeRange(0, [aString length])];

    [resultArray enumerateObjectsWithOptions:NSEnumerationConcurrent //並列
                                  usingBlock:^(id obj,NSUInteger idx,BOOL *stop){
                                      
                                      if (obj) {
                                          NSTextCheckingResult *tcResult = (NSTextCheckingResult *)obj;
                                          NSLog(@"%s %@ %u-%u",__FUNCTION__,[obj date],tcResult.range.location,tcResult.range.length );
                                      }
                                      
                                      return;
                                      
                                  }];
    
}
#pragma mark NSDataDetector　date
-(void)method005
{
    NSString *aString = @"Today is 2012年8月15日";
    NSError *error = nil;
    NSDataDetector *aDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeDate error:&error];
    NSArray *resultArray = [aDetector matchesInString:aString
                                              options:0
                                                range:NSMakeRange(0, [aString length])];
    
    [resultArray enumerateObjectsWithOptions:NSEnumerationConcurrent //並列
                                  usingBlock:^(id obj,NSUInteger idx,BOOL *stop){
                                      
                                      if (obj) {
                                          NSTextCheckingResult *tcResult = (NSTextCheckingResult *)obj;
                                          NSLog(@"%s %@ %u-%u",__FUNCTION__,[obj date],tcResult.range.location,tcResult.range.length );
                                      }
                                      
                                      return;
                                      
                                  }];
    //=>2012-08-15 03:00:00 +0000 9-10
}
#pragma mark NSDataDetector　phone
-(void)method006
{
    NSString *aString = @"My phone number is 01234567890";
    NSError *error = nil;
    NSDataDetector *aDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypePhoneNumber error:&error];
    NSArray *resultArray = [aDetector matchesInString:aString
                                              options:0
                                                range:NSMakeRange(0, [aString length])];
        [resultArray enumerateObjectsWithOptions:NSEnumerationConcurrent //並列
                                  usingBlock:^(id obj,NSUInteger idx,BOOL *stop){
                                      
                                      if (obj) {
                                          NSTextCheckingResult *tcResult = (NSTextCheckingResult *)obj;
                                          NSLog(@"%s %@ %u-%u",__FUNCTION__,[obj phoneNumber],tcResult.range.location,tcResult.range.length );
                                      }
                                      
                                      return;
                                      
                                  }];
    
}

#pragma mark NSOrthography orthographyWithDominantScript:
-(void)method007
{
    NSString *aString = @"My phone number is 01234567890";
    NSError *error = nil;
    NSDataDetector *aDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeTransitInformation error:&error];

    NSArray *resultArray = [aDetector matchesInString:aString
                                              options:0
                                                range:NSMakeRange(0, [aString length])];
    [resultArray enumerateObjectsWithOptions:NSEnumerationConcurrent //並列
                                  usingBlock:^(id obj,NSUInteger idx,BOOL *stop){
                                      
                                      if (obj) {
                                          NSTextCheckingResult *tcResult = (NSTextCheckingResult *)obj;
                                          NSLog(@"%s %@ %u-%u",__FUNCTION__,[obj phoneNumber],tcResult.range.location,tcResult.range.length );
                                      }
                                      
                                      return;
                                      
                                  }];

    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
    [self method002];
    [self method003];
    
    [self method004];
    [self method005];
    [self method006];
    [self method007];
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
