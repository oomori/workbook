//
//  MyString.m
//  NSKeyedArchiver
//
//  Created by 大森 智史 on 2012/09/09.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "MyString.h"

@implementation MyString
- (id)initWithCoder:(NSCoder *)decoder
{
    NSLog(@"%s initWithCoder",__FUNCTION__);
    self = [super init];
    if(self)
    {
        string = [decoder decodeObjectForKey:@"string"];
        //[decoder decodeObjectForKey:@"conditionalObjectKey"];
        
    }
    return  self;
}

//エンコードする
- (void)encodeWithCoder:(NSCoder *)encoder
{
    NSLog(@"%s encodeWithCoder",__FUNCTION__);
    
    [encoder encodeConditionalObject:string forKey:@"string"];
    //[encoder encodeObject:string forKey:@"stringKey"];
    [(NSKeyedArchiver *)encoder finishEncoding];
    
    
}

@end

