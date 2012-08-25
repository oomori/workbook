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
-(void)method007
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber zero];
    NSLog(@"%s %@",__FUNCTION__,[dNum1 description]);
    //-[OOOAppDelegate method007] 0
}

#pragma mark NSDecimalNumber decimalNumberWithDecimal:
-(void)method008
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber notANumber];
    NSLog(@"%s %@",__FUNCTION__,[dNum1 description]);
    //-[OOOAppDelegate method008]
}
#pragma mark NSDecimalNumber decimalNumberByAdding:
-(void)method009
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"12345.12"];
    NSDecimalNumber *dNum2 =
    [NSDecimalNumber decimalNumberWithString:@"0.55"];
    
    NSDecimalNumber *dNum3 = [dNum1 decimalNumberByAdding:dNum2];
    NSLog(@"%s %@",__FUNCTION__,[dNum3 description]);
    //-[OOOAppDelegate method009] 12345,67
}

#pragma mark NSDecimalNumber decimalNumberBySubtracting:
-(void)method010
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"12345.12"];
    NSDecimalNumber *dNum2 =
    [NSDecimalNumber decimalNumberWithString:@"0.55"];
    
    NSDecimalNumber *dNum3 = [dNum1 decimalNumberBySubtracting:dNum2];
    NSLog(@"%s %@",__FUNCTION__,[dNum3 description]);
    //-[OOOAppDelegate method010] 12344.57
}

#pragma mark NSDecimalNumber decimalNumberBySubtracting:
-(void)method011
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"12345.12"];
    NSDecimalNumber *dNum2 =
    [NSDecimalNumber decimalNumberWithString:@"0.55"];
    
    NSDecimalNumber *dNum3 = [dNum1 decimalNumberBySubtracting:dNum2];
    NSLog(@"%s %@",__FUNCTION__,[dNum3 description]);
    //-[OOOAppDelegate method011] 12344.57
}

#pragma mark NSDecimalNumber decimalNumberByMultiplyingBy:
-(void)method012
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"11.1"];
    NSDecimalNumber *dNum2 =
    [NSDecimalNumber decimalNumberWithString:@"3"];
    
    NSDecimalNumber *dNum3 = [dNum1 decimalNumberByMultiplyingBy:dNum2];
    NSLog(@"%s %@",__FUNCTION__,[dNum3 description]);
    //-[OOOAppDelegate method012] 33.3
}
#pragma mark NSDecimalNumber decimalNumberByDividingBy:
-(void)method013
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"99.9"];
    NSDecimalNumber *dNum2 =
    [NSDecimalNumber decimalNumberWithString:@"3"];
    
    NSDecimalNumber *dNum3 = [dNum1 decimalNumberByDividingBy:dNum2];
    NSLog(@"%s %@",__FUNCTION__,[dNum3 description]);
    //-[OOOAppDelegate method013] 33.3
}

#pragma mark NSDecimalNumber decimalNumberByRaisingToPower:
-(void)method014
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"4"];
    
    NSDecimalNumber *dNum3 = [dNum1 decimalNumberByRaisingToPower:3];
    NSLog(@"%s %@",__FUNCTION__,[dNum3 description]);
    //-[OOOAppDelegate method014] 64
}

#pragma mark NSDecimalNumber decimalNumberByMultiplyingByPowerOf10:
-(void)method015
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"4"];
    
    NSDecimalNumber *dNum3 = [dNum1 decimalNumberByMultiplyingByPowerOf10:3];
    NSLog(@"%s %@",__FUNCTION__,[dNum3 description]);
    //-[OOOAppDelegate method015] 4000
}

#pragma mark NSDecimalNumber decimalNumberByAdding:
-(void)method016
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"12345.12"];
    NSDecimalNumber *dNum2 =
    [NSDecimalNumber decimalNumberWithString:@"0.55"];
    
    NSDecimalNumber *dNum3 = [dNum1 decimalNumberByAdding:dNum2 withBehavior:[NSDecimalNumber defaultBehavior]];
    NSLog(@"%s %@",__FUNCTION__,[dNum3 description]);
    //-[OOOAppDelegate method009] 12345,67
    
    
    switch ([[NSDecimalNumber defaultBehavior] roundingMode]) {
        case NSRoundPlain:
            NSLog(@"%s %@",__FUNCTION__,@"NSRoundPlain");
            break;
        case NSRoundDown:
            NSLog(@"%s %@",__FUNCTION__,@"NSRoundDown");
            break;
        case NSRoundUp:
            NSLog(@"%s %@",__FUNCTION__,@"NSRoundUp");
            break;
        case NSRoundBankers:
            NSLog(@"%s %@",__FUNCTION__,@"NSRoundBankers");
            break;
            
        default:
            break;
    }
}

#pragma mark NSDecimalNumber decimalNumberBySubtracting:
-(void)method017
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"12345.12"];
    NSDecimalNumber *dNum2 =
    [NSDecimalNumber decimalNumberWithString:@"0.55"];
    
    NSDecimalNumber *dNum3 = [dNum1 decimalNumberBySubtracting:dNum2 withBehavior:[NSDecimalNumber defaultBehavior]];
    NSLog(@"%s %@",__FUNCTION__,[dNum3 description]);
    //-[OOOAppDelegate method010] 12344.57
}

#pragma mark NSDecimalNumber decimalNumberBySubtracting:
-(void)method018
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"12345.12"];
    NSDecimalNumber *dNum2 =
    [NSDecimalNumber decimalNumberWithString:@"0.55"];
    
    NSDecimalNumber *dNum3 = [dNum1 decimalNumberBySubtracting:dNum2 withBehavior:[NSDecimalNumber defaultBehavior]];
    NSLog(@"%s %@",__FUNCTION__,[dNum3 description]);
    //-[OOOAppDelegate method018] 12344.57
}

#pragma mark NSDecimalNumber decimalNumberByMultiplyingBy:
-(void)method019
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"11.1"];
    NSDecimalNumber *dNum2 =
    [NSDecimalNumber decimalNumberWithString:@"3"];
    
    NSDecimalNumber *dNum3 = [dNum1 decimalNumberByMultiplyingBy:dNum2 withBehavior:[NSDecimalNumber defaultBehavior]];
    NSLog(@"%s %@",__FUNCTION__,[dNum3 description]);
    //-[OOOAppDelegate method019] 33.3
}
#pragma mark NSDecimalNumber decimalNumberByDividingBy:
-(void)method020
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"99.9"];
    NSDecimalNumber *dNum2 =
    [NSDecimalNumber decimalNumberWithString:@"3"];
    
    NSDecimalNumber *dNum3 = [dNum1 decimalNumberByDividingBy:dNum2 withBehavior:[NSDecimalNumber defaultBehavior]];
    NSLog(@"%s %@",__FUNCTION__,[dNum3 description]);
    //-[OOOAppDelegate method020] 33.3
}

#pragma mark NSDecimalNumber decimalNumberByRaisingToPower:
-(void)method021
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"4"];
    
    NSDecimalNumber *dNum3 = [dNum1 decimalNumberByRaisingToPower:3 withBehavior:[NSDecimalNumber defaultBehavior]];
    NSLog(@"%s %@",__FUNCTION__,[dNum3 description]);
    //-[OOOAppDelegate method021] 64
}

#pragma mark NSDecimalNumber decimalNumberByMultiplyingByPowerOf10:
-(void)method022
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"4"];
    
    NSDecimalNumber *dNum3 = [dNum1 decimalNumberByMultiplyingByPowerOf10:3 withBehavior:[NSDecimalNumber defaultBehavior]];
    NSLog(@"%s %@",__FUNCTION__,[dNum3 description]);
    //-[OOOAppDelegate method022] 4000
}

#pragma mark NSDecimalNumber decimalValue
-(void)method023
{
    NSNumber *integerNumber = [NSNumber numberWithInteger:123456];//32bit
    NSDecimal decimalValue = [integerNumber decimalValue];
    
    NSDecimalNumber *dNum1 = [NSDecimalNumber decimalNumberWithDecimal:decimalValue];
    NSLog(@"%s %@",__FUNCTION__,[dNum1 description]);
    //-[OOOAppDelegate method023] 123456
}

#pragma mark NSDecimalNumber doubleValue
-(void)method024
{
    NSNumber *integerNumber = [NSNumber numberWithInteger:123456];//32bit
    double doubleValue = [integerNumber doubleValue];

    NSLog(@"%s %f",__FUNCTION__,doubleValue);
    //-[OOOAppDelegate method024] 123456.000000
}

#pragma mark NSDecimalNumber initWithLocaleIdentifier:
-(void)method025
{
    NSNumber *integerNumber = [NSNumber numberWithInteger:123456];//32bit
    NSDecimal decimalValue = [integerNumber decimalValue];
    
    NSDecimalNumber *dNum1 = [NSDecimalNumber decimalNumberWithDecimal:decimalValue];
    NSLocale *jpLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    
    
    NSLog(@"%s %@",__FUNCTION__,[dNum1 descriptionWithLocale:jpLocale]);
    //-[OOOAppDelegate method025] 123456
}

#pragma mark NSDecimalNumber objCType
-(void)method026
{
    NSNumber *integerNumber = [NSNumber numberWithInteger:123456];
    NSDecimal decimalValue1 = [integerNumber decimalValue];
    NSDecimalNumber *dNum1 = [NSDecimalNumber decimalNumberWithDecimal:decimalValue1];
    NSLog(@"%s %s",__FUNCTION__,[dNum1 objCType]);
    //-[OOOAppDelegate method026] d
}

#pragma mark NSDecimalNumber compare:
-(void)method027
{
    NSNumber *integerNumber = [NSNumber numberWithInteger:123456];
    NSDecimal decimalValue1 = [integerNumber decimalValue];
    NSDecimalNumber *dNum1 = [NSDecimalNumber decimalNumberWithDecimal:decimalValue1];
    
    NSNumber *floatNumber = [NSNumber numberWithFloat:123456];
    NSDecimal decimalValue2 = [floatNumber decimalValue];
    NSDecimalNumber *dNum2 = [NSDecimalNumber decimalNumberWithDecimal:decimalValue2];
     
    switch ([dNum1 compare:dNum2]) {
        case NSOrderedAscending:
            NSLog(@"NSOrderedAscending");
            break;
        case NSOrderedSame:
            NSLog(@"NSOrderedSame");
            break;
        case NSOrderedDescending:
            NSLog(@"NSOrderedDescending");
            break;
            
        default:
            break;
    }
    //NSOrderedSame
}

#pragma mark NSDecimalNumber setDefaultBehavior:
-(void)method028
{
    NSDecimalNumber *dNum1 =
    [NSDecimalNumber decimalNumberWithString:@"100"];
    NSDecimalNumber *dNum2 =
    [NSDecimalNumber decimalNumberWithString:@"3"];
    
    NSDecimalNumber *dNum3 = [dNum1 decimalNumberByDividingBy:dNum2 withBehavior:[NSDecimalNumber defaultBehavior]];
    NSLog(@"%s %@",__FUNCTION__,[dNum3 description]);
    //-[OOOAppDelegate method028] 33.333333333333333333333333333333333333
    
    NSDecimalNumberHandler *handler = [[NSDecimalNumberHandler alloc]
                        initWithRoundingMode:NSRoundDown
                                       scale:3
                                       raiseOnExactness:NO
                                       raiseOnOverflow:NO
                                       raiseOnUnderflow:NO
                                       raiseOnDivideByZero:NO];
    [NSDecimalNumber setDefaultBehavior:handler];
    NSDecimalNumber *dNum4 = [dNum1 decimalNumberByDividingBy:dNum2 withBehavior:[NSDecimalNumber defaultBehavior]];
    NSLog(@"%s %@",__FUNCTION__,[dNum4 description]);
    //-[OOOAppDelegate method028] 33.333
}

#pragma mark NSDecimalNumber maximumDecimalNumber / minimumDecimalNumber
-(void)method029
{
    NSDecimalNumber *dNum1 = [NSDecimalNumber maximumDecimalNumber];
    NSDecimalNumber *dNum2 = [NSDecimalNumber minimumDecimalNumber];
 
    NSLog(@"%s %@",__FUNCTION__,[dNum1 description]);
    //=>3402823669209384634633746074317682114550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    NSLog(@"%s %@",__FUNCTION__,[dNum2 description]);
    //=>-3402823669209384634633746074317682114550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
    [self method008];
    [self method009];
    [self method010];
    [self method011];
    [self method012];
    [self method013];
    [self method014];
    [self method015];
    [self method016];
    [self method017];
    [self method018];
    [self method019];
    [self method020];
    [self method021];
    [self method022];
    [self method023];
    [self method024];
    [self method025];
    [self method026];
    [self method027];
    [self method028];
    [self method029];
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
