//
//  CustomClass.m
//  NSSortDescriptor
//
//  Created by 大森 智史 on 12/05/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CustomClass.h"

@implementation CustomClass

@synthesize customClassValue;
@synthesize customNumber;
@synthesize custonData;


-(NSMutableString *)description
{
    return customClassValue;
    
}
-(NSMutableString *)appendSomeString
{
    [customClassValue appendString:@"!"];
    return customClassValue;
    
}
@end
