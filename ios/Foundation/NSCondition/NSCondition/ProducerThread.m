//
//  ProducerThread.m
//  NSCondition
//
//  Created by 大森 智史 on 2012/10/20.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "ProducerThread.h"

@interface ProducerThread(PrivateMethods)
-(void)run;
@end

@implementation ProducerThread

-(id) initWithCommonData:(NSMutableArray*)commonData_
              lockObject:(NSCondition*)lockObject_{
    self = [super init];
    if(self){
        lockObject = lockObject_;
        commonData = commonData_;
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
    @try{
        while(true){
            float sleepTime = (arc4random() % 100) / 1000.0f;
            [NSThread sleepForTimeInterval:sleepTime];
            
            [lockObject lock];
            [commonData addObject:[NSString stringWithFormat:@"%i", index]]; // 追加
            NSLog(@"%d", [commonData count]);
            if([commonData count] == 1){ // 100以上になったらマイナス
                [lockObject signal];
                NSLog(@"追加したので起こす");
            }
            [lockObject unlock];
          
            index++;
        }
    }@catch(NSException* exception){
        
    }@finally {
        
    }
}

@end
