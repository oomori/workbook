//
//  OOOAppDelegate.m
//  NSDecimalNumber
//
//  Created by 大森 智史 on 12/05/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"


@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark +decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:
-(void)method001
{
    NSDecimalNumber *dNum1 = [[NSDecimalNumber alloc]  initWithString:@"3.1415926535897932384626433832795028841971693993751058209749445923078164"];
    NSDecimalNumber *dNum = [NSDecimalNumber alloc] ;
    
    NSDecimalNumberHandler* roundingBehavior =
            [NSDecimalNumberHandler
                        decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:4
                                raiseOnExactness:NO
                                raiseOnOverflow:NO
                                raiseOnUnderflow:NO
                                raiseOnDivideByZero:NO];
    

    dNum = [dNum1 decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
    
    NSLog(@"%s %f",__FUNCTION__,[dNum doubleValue]);
    //-[OOOAppDelegate method001] 3.141600
}

#pragma mark NSDecimalNumber decimalNumberWithDecimal:
-(void)method002
{
    NSNumber *integerNumber = [NSNumber numberWithInteger:123456];//32bit
    NSDecimal decimalValue = [integerNumber decimalValue];
    
    NSDecimalNumber *dNum1 = [NSDecimalNumber decimalNumberWithDecimal:decimalValue];
    NSLog(@"%s %@",__FUNCTION__,[dNum1 description]);
    //-[OOOAppDelegate method002] 123456
}

#pragma mark NSDecimalNumber decimalNumberWithMantissa:exponent:isNegative:
-(void)method003
{
    NSDecimalNumber *dNum1 =
        [NSDecimalNumber decimalNumberWithMantissa:12345
                                          exponent:5
                                        isNegative:NO];
    NSLog(@"%s %@",__FUNCTION__,[dNum1 description]);
    //-[OOOAppDelegate method002] 1234500000
}

#pragma mark NSDecimalNumber decimalNumberWithString:
-(void)method004
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"12345.12"];
    NSLog(@"%s %@",__FUNCTION__,[dNum1 description]);
    //-[OOOAppDelegate method002] 12345
}
#pragma mark NSDecimalNumber decimalNumberWithDecimal:
-(void)method005
{
    NSLocale *frLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"];
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"12345,12" locale:frLocale];
    NSLog(@"%s %@",__FUNCTION__,[dNum1 description]);
    //-[OOOAppDelegate method002] 12345
}

#pragma mark NSDecimalNumber decimalNumberWithDecimal:
-(void)method006
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber one];
    NSLog(@"%s %@",__FUNCTION__,[dNum1 description]);
    //-[OOOAppDelegate method006] 1
}

#pragma mark NSDecimalNumber decimalNumberWithDecimal:
-(void)method006
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber one];
    NSLog(@"%s %@",__FUNCTION__,[dNum1 description]);
    //-[OOOAppDelegate method006] 1
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
