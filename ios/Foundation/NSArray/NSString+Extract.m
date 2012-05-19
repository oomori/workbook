//
//  NSString+Extract.m
//  NSArray
//
//  Created by 大森 智史 on 12/05/04.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSString+Extract.h"

@implementation NSString (Extract)

//文字列の長さか長いかどうかの比較
//method021　sortedArrayUsingSelector:のために作成

- (NSComparisonResult)compareLength:(NSString *)otherString
{
    
    
     if ([self length] > [otherString length]) {
     return NSOrderedAscending;
     } else if ([self length] < [otherString length]) {
     return NSOrderedDescending;
     }
     

    return NSOrderedSame;
}
@end
