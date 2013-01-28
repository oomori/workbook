//
//  ConsumerThread.h
//  NSCondition
//
//  Created by 大森 智史 on 2012/10/20.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConsumerThread : NSObject{
    NSMutableArray* commonData;
    NSThread* thread;
    NSCondition* lockObject;
}

-(id) initWithCommonData:(NSMutableArray*)commonData_
              lockObject:(NSCondition*)lockObject_;
-(void) start;

@end