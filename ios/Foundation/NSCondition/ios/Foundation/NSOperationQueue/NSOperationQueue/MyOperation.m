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

- (void)main
{
    NSLog(@"MyOperation %@ main",string);
    @try {
        @autoreleasepool {
            NSLog(@"%s %@", __FUNCTION__,self.string);
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
