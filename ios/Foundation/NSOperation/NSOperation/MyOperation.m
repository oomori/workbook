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
    NSLog(@"start");
	if ([self isCancelled]) {
		self.finished = YES;
		return;
	}
	[NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
	self.executing = YES;

}

- (void)main
{
    NSLog(@"main");
    @try {
        @autoreleasepool {
            NSLog(@"%@", self.string);
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
    @finally {
        NSLog(@"@finally");
    }
       
}



@end
