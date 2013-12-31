//
//  OOOModel.m
//  NSBlockOperation
//
//  Created by 大森 智史 on 2013/12/31.
//
//

#import "OOOModel.h"

@implementation OOOModel

#pragma mark NSBlockOperation addOperation:
-(BOOL)method001{
    NSMutableString *muStr = [NSMutableString stringWithCapacity:0];
    [muStr appendString:@"string"];
    
    //一つ目の処理
    NSBlockOperation* operation = [NSBlockOperation blockOperationWithBlock: ^{
        for (NSInteger i=0; i < 10; i++) {
            [muStr performSelectorInBackground:@selector(appendString:)
                                    withObject:@"+"];
            NSLog(@"muStr %@ ", muStr);
            [NSThread sleepForTimeInterval:1.0];
        }
    }];
    
    //2つめの処理を追加
    [operation addExecutionBlock:^{
        NSLog(@"NSThread: %p", [NSThread currentThread]);
        for (NSInteger i=0; i < 5; i++) {
            NSLog(@"muStr %d", i);
            [NSThread sleepForTimeInterval:1.5];
        }
    }];
    
    // 終了時処理
    [operation setCompletionBlock:^{
        NSLog(@"end");
    }];
    
    
    NSLog(@"%@",[operation executionBlocks]);
    
    //実行
    [operation start];

    return YES;
}
@end
