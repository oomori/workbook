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
    NSNumber *boolNumber = @YES;//8bit
    NSNumber *charNumber = @127;//8bit
    NSNumber *unsignedCharNumber = [NSNumber numberWithUnsignedChar:255];//8bit
    NSNumber *doubleNumber = @9223372036854775807.0;//64bit
    NSNumber *floatNumber = @2147483647.0f;//32bit
    NSNumber *intNumber = @2147483647;//32bit
    NSNumber *unsignedIntNumber = @4294967296U;//32bit
    NSNumber *integerNumber = @2147483647;//32bit
    NSNumber *unsignedIntegerNumber = @4294967296U;//32bit
    NSNumber *longNumber = @2147483647L;//32bit
    NSNumber *unsignedLongNumber = @4294967296UL;//32bit
    NSNumber *longLongNumber = @9223372036854775807LL;//64bit
    NSNumber *unsignedLongLongNumber = @9223372036854775807ULL;//64bit
    NSNumber *shortNumber = [NSNumber numberWithShort:32767];//16bit
    NSNumber *unsignedShortNumber = [NSNumber numberWithUnsignedShort:65535];//16bit
    
    NSArray *anArray = @[boolNumber,charNumber,
                        unsignedCharNumber,doubleNumber,
                        floatNumber,intNumber,integerNumber,longNumber,longLongNumber,
                        shortNumber,unsignedIntNumber,
                        unsignedIntegerNumber,unsignedLongNumber,
                        unsignedLongLongNumber,unsignedShortNumber];
    
    NSLog(@"size %ld byte",sizeof(unsigned char));
    
    //
    NSDecimalNumber *doubleDecimal = [[NSDecimalNumber decimalNumberWithString:@"2"] decimalNumberByRaisingToPower:(sizeof(unsigned char)*8) withBehavior:[NSDecimalNumber defaultBehavior]];
    NSLog(@" %ld byte,%@",sizeof(float),[doubleDecimal description]);
    //
    
    NSLog(@"%@",[anArray description]);
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self method001];
}

@end
