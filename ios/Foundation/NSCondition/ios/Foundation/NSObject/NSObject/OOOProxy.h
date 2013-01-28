//
//  OOOProxy.h
//  NSObject
//
//  Created by 大森 智史 on 2012/09/02.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OOOProxy : NSProxy
{
    NSObject *targetObject;
}
@property (strong, nonatomic) NSObject *targetObject;
@end
