//
//  OOOProxy.m
//  NSObject
//
//  Created by 大森 智史 on 2012/09/02.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOProxy.h"

@implementation OOOProxy
@synthesize targetObject;
- (NSString *)description
{
    return [targetObject description];
}
- (id)forwardingTargetForSelector:(SEL)aSelector
{
    return [targetObject forwardingTargetForSelector:aSelector];
}
- (void)forwardInvocation:(NSInvocation *)invocation
{
    NSLog(@"methodSignatureForSelector");
    if ( targetObject )
    {
        [invocation setTarget:targetObject];
        [invocation invoke];
    }
}
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSLog(@"methodSignatureForSelector");
    NSMethodSignature *result;
    if ( targetObject )
    {
        result = [targetObject methodSignatureForSelector:sel];
    }
    else
    {
        result = [super methodSignatureForSelector:sel];
    }
    
    return result;
}
@end
