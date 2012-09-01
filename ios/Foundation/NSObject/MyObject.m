//
//  MyObject.m
//  NSObject
//
//  Created by 大森 智史 on 2012/09/01.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "MyObject.h"

@implementation MyObject
- (id)copyWithZone:(NSZone *)zone
{
    MyObject* result = [[[self class] allocWithZone:zone] init];
    
    if (result)
    {
        
        //result->stringValue = [stringValue copyWithZone:zone];
        //result->arrayValues = [[NSArray allocWithZone:zone] initWithArray:arrayValues copyItems:YES];
    }
    
    return result;
}

-(void)messageA
{
    NSLog(@"%s messageA",__FUNCTION__);
    
}
-(void)messageB
{
    NSLog(@"%s messageB",__FUNCTION__);
    
}

-(void)testMethod
{
    NSLog(@"%s testMethod",__FUNCTION__);    
    
}
+(void)initialize
{    
    NSLog(@"%s initialize",__FUNCTION__);
  
}

+(void)load
{
    NSLog(@"%s load",__FUNCTION__);
}
@end
