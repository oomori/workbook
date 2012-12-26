//
//  HTTPOperation.m
//  NSOperation
//
//  Created by 大森 智史 on 2012/09/09.
//
//

#import "HTTPOperation.h"

@implementation HTTPOperation

@synthesize string;
@synthesize executing;
@synthesize finished;

- (void) start {
    
	if ([self isCancelled]) {
		self.finished = YES;
		return;
	}
	[NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
	self.executing = YES;
    
    NSLog(@"start %@",string);
}

- (void)main
{
    NSLog(@"MyOperation main");
    @try {
        @autoreleasepool {
            NSLog(@"%s %@", __FUNCTION__,self.string);
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%s %@", __FUNCTION__, exception);
    }
    @finally {
        NSLog(@"MyOperation finally");
    }
    
}



@end
