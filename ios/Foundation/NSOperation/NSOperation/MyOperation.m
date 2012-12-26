//
//  MyOperation.m
//  NSOperation
//
//  Created by 大森 智史 on 12/05/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyOperation.h"

@implementation MyOperation

@synthesize string;
@synthesize executing;
@synthesize finished;

//並列
/*
- (void) start {
    
	[super start];
    if ([self isCancelled]) {
		self.finished = YES;
		return;
	}
	[NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
	self.executing = YES;
    
    //NSLog(@"start");
}
*/
//非並列

- (void)main
{
    NSLog(@"MyOperation %@ main",string);
    @try {
        @autoreleasepool {
            NSLog(@"%s %@", __FUNCTION__,self.string);
            
            for (int i = 0; i <100; i++) {
                NSLog(@"%s %@ %d", __FUNCTION__,self.string,i);
                //[NSThread sleepForTimeInterval:0.01];
            }
            
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%s %@", __FUNCTION__, exception);
    }
    @finally {
        NSLog(@"MyOperation %@ finally",string);
    }
       
}



@end
