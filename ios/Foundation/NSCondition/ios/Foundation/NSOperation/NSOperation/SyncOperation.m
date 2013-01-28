//
//  SyncOperation.m
//  NSOperation
//
//  Created by 大森 智史 on 2012/09/09.
//
//

#import "SyncOperation.h"

@implementation SyncOperation

@synthesize string;
@synthesize executing;
@synthesize finished;

#pragma mark
#pragma mark KVO
//KVO プロパティ値が変更されたら呼ばれる

//非並列（同期）なので以下のメソッドの実装が必要
//+ (BOOL)automaticallyNotifiesObserversForKey:(NSString*)key
//-(BOOL)isConcurrent
//-(BOOL)isFinished
//-(BOOL)isExecuting

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString*)key {
    if ([key isEqualToString:@"isExecuting"] ||
        [key isEqualToString:@"isFinished"]) {
        return YES;
    }
    return [super automaticallyNotifiesObserversForKey:key];
}
/*
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString*)key
{
    NSLog(@"automaticallyNotifiesObserversForKey %@",key);
    
    if ([key isEqualToString:@"isChanged"])
    {
        return YES;
    }
    
    return [super automaticallyNotifiesObserversForKey:key];
}
 */
 
//並列処理するか　このクラスは同期型なのでNO
-(BOOL)isConcurrent{
    return NO;
}
-(BOOL)isFinished{
    return finished;
}
-(BOOL)isExecuting{
    return executing;
}

#pragma mark 
- (void) start {
    
	[super start];
    if ([self isCancelled]) {
		self.finished = YES;
		return;
	}
	//[NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
	//self.executing = YES;
    NSLog(@"MyOperation %@ main",string);
    @try {
        @autoreleasepool {
            NSLog(@"%s %@", __FUNCTION__,self.string);
            for (int i = 0; i <100; i++) {
                
                NSLog(@"%s %@ %d", __FUNCTION__,self.string,i);
            }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%s %@", __FUNCTION__, exception);
    }
    @finally {
        NSLog(@"MyOperation %@ finally",string);
    }

    //NSLog(@"start");
}
/*
- (void)main
{
    NSLog(@"MyOperation %@ main",string);
    @try {
        @autoreleasepool {
            NSLog(@"%s %@", __FUNCTION__,self.string);
            for (int i = 0; i <100; i++) {

                NSLog(@"%s %@ %d", __FUNCTION__,self.string,i);
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
*/


@end
