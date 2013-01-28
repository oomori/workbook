//
//  MyObject2.m
//  NSObject
//
//  Created by 大森 智史 on 2012/09/02.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "MyObject2.h"

@implementation MyObject2
-(void)messageWith
{
    NSLog(@"%s message from MyObject2 !",__FUNCTION__);
    
}

- (void)doesNotRecognizeSelector:(SEL)aSelector
{
    NSLog(@"%s ",__FUNCTION__);
}
@end
