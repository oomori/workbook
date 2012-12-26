//
//  ConsumerThread.m
//  NSCondition
//
//  Created by 大森 智史 on 2012/10/20.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//
#import "ConsumerThread.h"

@interface ConsumerThread(PrivateMethods)
-(void) run;
@end

@implementation ConsumerThread

-(id)initWithCommonData:(NSMutableArray *)commonData_
             lockObject:(NSCondition *)lockObject_{
    self = [super init];
    if(self){
        commonData = commonData_;
        lockObject = lockObject_;
        thread = [[NSThread alloc] initWithTarget:self
                                         selector:@selector(run)
                                           object:nil];
    }
    
    return self;
}

-(void)start{
    [thread start];
}

-(void)run{
    //NSString* use;
    @try{
        while(true){
            float sleepTime = (arc4random() % 100) / 1000.0f;
            [NSThread sleepForTimeInterval:sleepTime];
            
            [lockObject lock];
           
            int index = [commonData count] - 1;
            //use = [commonData objectAtIndex:index];
            [commonData removeObjectAtIndex:index];
            NSLog(@"%d", index);
            while([commonData count] == 0){
                NSLog(@"なくなったので待機");
                [lockObject wait];
            }
            [lockObject unlock];
            
        }
    }@catch(NSException* exception){
        
    }@finally {
        
    }
}

@end
