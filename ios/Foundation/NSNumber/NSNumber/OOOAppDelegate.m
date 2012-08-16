//
//  OOOAppDelegate.m
//  NSNumber
//
//  Created by 大森 智史 on 2012/08/16.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate
#pragma mark NSNumber
-(void)method001
{
    NSNumber *boolNumber = [NSNumber numberWithBool:YES];//8bit
    NSNumber *charNumber = [NSNumber numberWithChar:127];//8bit
    NSNumber *unsignedCharNumber = [NSNumber numberWithUnsignedChar:255];//8bit
    NSNumber *doubleNumber = [NSNumber numberWithDouble:9223372036854775807];//64bit
    NSNumber *floatNumber = [NSNumber numberWithFloat:2147483647];//32bit
    NSNumber *intNumber = [NSNumber numberWithInt:2147483647];//32bit
    NSNumber *unsignedIntNumber = [NSNumber numberWithUnsignedInt:4294967296];//32bit
    NSNumber *integerNumber = [NSNumber numberWithInteger:2147483647];//32bit
    NSNumber *unsignedIntegerNumber = [NSNumber numberWithUnsignedInteger:4294967296];//32bit
    NSNumber *longNumber = [NSNumber numberWithLong:2147483647];//32bit
    NSNumber *unsignedLongNumber = [NSNumber numberWithUnsignedLong:4294967296];//32bit
    NSNumber *longLongNumber = [NSNumber numberWithLongLong:9223372036854775807];//64bit
    NSNumber *unsignedLongLongNumber = [NSNumber numberWithUnsignedLongLong:9223372036854775807];//64bit
    NSNumber *shortNumber = [NSNumber numberWithShort:32767];//16bit
    NSNumber *unsignedShortNumber = [NSNumber numberWithUnsignedShort:65535];//16bit
    
    NSArray *anArray = [NSArray arrayWithObjects:boolNumber,charNumber,
                        unsignedCharNumber,doubleNumber,
                        floatNumber,intNumber,integerNumber,longNumber,longLongNumber,
                        shortNumber,unsignedIntNumber,
                        unsignedIntegerNumber,unsignedLongNumber,
                        unsignedLongLongNumber,unsignedShortNumber,nil];
    
    NSLog(@"size %ld byte",sizeof(unsigned char));
 
    //
    NSDecimalNumber *doubleDecimal = [[NSDecimalNumber decimalNumberWithString:@"2"] decimalNumberByRaisingToPower:(sizeof(unsigned char)*8) withBehavior:[NSDecimalNumber defaultBehavior]];
    NSLog(@" %ld byte,%@",sizeof(float),[doubleDecimal description]);
    //
    
    NSLog(@"%@",[anArray description]);
}
#pragma mark NSNumber
-(void)method002
{
    NSNumber *boolNumber = [NSNumber numberWithBool:YES];//8bit    
    NSLog(@"%s %s ",__FUNCTION__,[boolNumber objCType]);
    BOOL boo = [boolNumber boolValue];
    NSLog(@"%s %@ ",__FUNCTION__,(boo)?@"YES":@"NO");

}

#pragma mark NSNumber
-(void)method003
{
    NSNumber *charNumber = [NSNumber numberWithChar:127];//8bit
    NSLog(@"%s %s ",__FUNCTION__,[charNumber objCType]);
    char cha = [charNumber charValue];
    NSLog(@"%s %hhd ",__FUNCTION__,cha);
    
}

#pragma mark NSNumber
-(void)method004
{
    NSNumber *unsignedCharNumber = [NSNumber numberWithUnsignedChar:255];//8bit
    NSLog(@"%s %s ",__FUNCTION__,[unsignedCharNumber objCType]);
    unsigned char cha = [unsignedCharNumber unsignedCharValue];
    NSLog(@"%s %u ",__FUNCTION__,cha);
    
}

#pragma mark NSNumber
-(void)method005
{
    NSNumber *doubleNumber = [NSNumber numberWithDouble:9223372036854775807];//64bit
    NSLog(@"%s %s ",__FUNCTION__,[doubleNumber objCType]);
    double dou = [doubleNumber doubleValue];
    NSLog(@"%s %f ",__FUNCTION__,dou);
    
}

#pragma mark NSNumber
-(void)method006
{
    NSNumber *floatNumber = [NSNumber numberWithFloat:2147483647];//32bit
    NSLog(@"%s %s ",__FUNCTION__,[floatNumber objCType]);
    float flt = [floatNumber doubleValue];
    NSLog(@"%s %f ",__FUNCTION__,flt);
    
}

#pragma mark NSNumber
-(void)method007
{
    NSNumber *floatNumber = [NSNumber numberWithFloat:2147483647];//32bit
    NSLog(@"%s %s ",__FUNCTION__,[floatNumber objCType]);
    float flt = [floatNumber floatValue];
    NSLog(@"%s %f ",__FUNCTION__,flt);
    
}

#pragma mark NSNumber
-(void)method008
{
    NSNumber *intNumber = [NSNumber numberWithInt:2147483647];//32bit
    NSLog(@"%s %s ",__FUNCTION__,[intNumber objCType]);
    int iValue = [intNumber intValue];
    NSLog(@"%s %d ",__FUNCTION__,iValue);
    
}

#pragma mark NSNumber
-(void)method009
{
    NSNumber *unsignedIntNumber = [NSNumber numberWithUnsignedInt:4294967295];//32bit
    NSLog(@"%s %s ",__FUNCTION__,[unsignedIntNumber objCType]);
    unsigned int uiValue = [unsignedIntNumber unsignedIntValue];
    NSLog(@"%s %u ",__FUNCTION__,uiValue);
    
}

#pragma mark NSNumber
-(void)method010
{
    NSNumber *integerNumber = [NSNumber numberWithInteger:2147483647];//32bit
    NSLog(@"%s %s ",__FUNCTION__,[integerNumber objCType]);
    NSInteger iValue = [integerNumber integerValue];
    NSLog(@"%s %d ",__FUNCTION__,iValue);
    
}

#pragma mark NSNumber
-(void)method011
{
    NSNumber *unsignedIntegerNumber = [NSNumber numberWithUnsignedInteger:4294967295];//32bit
    NSLog(@"%s %s ",__FUNCTION__,[unsignedIntegerNumber objCType]);
    NSUInteger uiValue = [unsignedIntegerNumber unsignedIntegerValue];
    NSLog(@"%s %u ",__FUNCTION__,uiValue);
    
}

#pragma mark NSNumber
-(void)method012
{
    NSNumber *longNumber = [NSNumber numberWithLong:2147483647];//32bit
    NSLog(@"%s %s ",__FUNCTION__,[longNumber objCType]);
    long longValue = [longNumber longValue];
    NSLog(@"%s %lu ",__FUNCTION__,longValue);
    
}

#pragma mark NSNumber
-(void)method013
{
    NSNumber *unsignedLongNumber = [NSNumber numberWithUnsignedLong:4294967296];//32bit
    NSLog(@"%s %s ",__FUNCTION__,[unsignedLongNumber objCType]);
    unsigned long unsignedlongValue = [unsignedLongNumber unsignedLongValue];
    NSLog(@"%s %lu ",__FUNCTION__,unsignedlongValue);
    
}

#pragma mark NSNumber
-(void)method014
{
    NSNumber *longLongNumber = [NSNumber numberWithLongLong:9223372036854775807];//64bit
    NSLog(@"%s %s ",__FUNCTION__,[longLongNumber objCType]);
    long long longLongValue = [longLongNumber longLongValue];
    NSLog(@"%s %llu ",__FUNCTION__,longLongValue);
    
}

#pragma mark NSNumber
-(void)method015
{
    NSNumber *unsignedLongLongNumber = [NSNumber numberWithUnsignedLongLong:9223372036854775807];//64bit
    NSLog(@"%s %s ",__FUNCTION__,[unsignedLongLongNumber objCType]);
    unsigned long long unsignedLongLongValue = [unsignedLongLongNumber unsignedLongLongValue];
    NSLog(@"%s %lld ",__FUNCTION__,unsignedLongLongValue);
    
}

#pragma mark NSNumber
-(void)method016
{
    NSNumber *shortNumber = [NSNumber numberWithShort:32767];//16bit
    NSLog(@"%s %s ",__FUNCTION__,[shortNumber objCType]);
    short shortValue = [shortNumber shortValue];
    NSLog(@"%s %hd ",__FUNCTION__,shortValue);
    
}

#pragma mark NSNumber
-(void)method017
{
    NSNumber *unsignedShortNumber = [NSNumber numberWithUnsignedShort:65535];//16bit
    NSLog(@"%s %s ",__FUNCTION__,[unsignedShortNumber objCType]);
    unsigned short unsignedShortValue = [unsignedShortNumber unsignedShortValue];
    NSLog(@"%s %d ",__FUNCTION__,unsignedShortValue);
    
}

#pragma mark NSNumber
-(void)method018
{
    NSNumber *integerNumber = [NSNumber numberWithInteger:123456];//32bit
    NSLog(@"%s %s ",__FUNCTION__,[integerNumber objCType]);
    NSDecimal decimalValue = [integerNumber decimalValue];

    NSLog(@"%s %u ",__FUNCTION__,decimalValue._length);
}

#pragma mark NSNumber
-(void)method019
{
    NSNumber *floatNumber = [NSNumber numberWithFloat:100.234];//32bit
    NSLog(@"%s %s ",__FUNCTION__,[floatNumber objCType]);
    
    NSLocale *jpLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja-JP"];
    
    NSLocale *frLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"];
    
    NSLog(@"%s %@ ",__FUNCTION__,[floatNumber descriptionWithLocale:jpLocale]);
    //=>-[OOOAppDelegate method019] 100.234 
    NSLog(@"%s %@ ",__FUNCTION__,[floatNumber descriptionWithLocale:frLocale]);
    //=>-[OOOAppDelegate method019] 100,234 
}

#pragma mark NSNumber
-(void)method020
{
    NSNumber *aNumber = [NSNumber numberWithFloat:100.234];//32bit
    NSNumber *bNumber = [NSNumber numberWithFloat:100.111];//32bit
    NSNumber *cNumber = [NSNumber numberWithFloat:100.111];//32bit
    switch ([aNumber compare:bNumber]) {
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
    NSLog(@"a vs b %@",([aNumber isEqualToNumber:bNumber])?@"YES":@"NO");
    NSLog(@"c vs b %@",([cNumber isEqualToNumber:bNumber])?@"YES":@"NO");

}
#pragma mark NSNumber
-(void)method021
{
    NSNumber *boolNumber = [NSNumber numberWithBool:YES];//8bit
    NSNumber *charNumber = @127;//8bit
    NSNumber *unsignedCharNumber = [NSNumber numberWithUnsignedChar:255];//8bit
    NSNumber *doubleNumber = [NSNumber numberWithDouble:9223372036854775807];//64bit
    NSNumber *floatNumber = @2147483647.0f;//32bit
    //NSNumber *floatNumber = [NSNumber numberWithFloat:2147483647];//32bit
    NSNumber *intNumber = [NSNumber numberWithInt:2147483647];//32bit
    NSNumber *unsignedIntNumber = [NSNumber numberWithUnsignedInt:4294967296];//32bit
    NSNumber *integerNumber = [NSNumber numberWithInteger:2147483647];//32bit
    NSNumber *unsignedIntegerNumber = [NSNumber numberWithUnsignedInteger:4294967296];//32bit
    NSNumber *longNumber = [NSNumber numberWithLong:2147483647];//32bit
    NSNumber *unsignedLongNumber = [NSNumber numberWithUnsignedLong:4294967296];//32bit
    NSNumber *longLongNumber = [NSNumber numberWithLongLong:9223372036854775807];//64bit
    NSNumber *unsignedLongLongNumber = [NSNumber numberWithUnsignedLongLong:9223372036854775807];//64bit
    NSNumber *shortNumber = [NSNumber numberWithShort:32767];//16bit
    NSNumber *unsignedShortNumber = [NSNumber numberWithUnsignedShort:65535];//16bit
    
    NSArray *anArray = [NSArray arrayWithObjects:boolNumber,charNumber,
                        unsignedCharNumber,doubleNumber,
                        floatNumber,intNumber,integerNumber,longNumber,longLongNumber,
                        shortNumber,unsignedIntNumber,
                        unsignedIntegerNumber,unsignedLongNumber,
                        unsignedLongLongNumber,unsignedShortNumber,nil];
    
    NSLog(@"size %ld byte",sizeof(unsigned char));
    
    //
    NSDecimalNumber *doubleDecimal = [[NSDecimalNumber decimalNumberWithString:@"2"] decimalNumberByRaisingToPower:(sizeof(unsigned char)*8) withBehavior:[NSDecimalNumber defaultBehavior]];
    NSLog(@" %ld byte,%@",sizeof(float),[doubleDecimal description]);
    //
    
    NSLog(@"%@",[anArray description]);
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
