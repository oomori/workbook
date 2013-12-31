//
//  OOOModel.m
//  NSArray
//
//  Created by 大森 智史 on 2013/12/31.
//
//

#import "OOOModel.h"

@implementation OOOModel

#pragma mark initWithObjects:
-(NSArray *)method001
{
    NSArray *anArray =
    @[@"aaa",@"bbb",@"ccc"];
    
    //NSLog(@"%s %@",__FUNCTION__,[anArray description]);
    return anArray;
}

#pragma mark indexOfObjectPassingTest:
-(NSUInteger)method002
{
    NSArray *anArray =
    @[@"aaa",@"bbb",@"ccc",
      @"aaa",@"bbb",@"ccc",
      @"aaa",@"bbb",@"ccc"];
    
    
    NSUInteger idx = [anArray indexOfObjectPassingTest:
                      ^ BOOL (id obj, NSUInteger idx, BOOL *stop)
                      {
                          //NSLog(@"002 %u,%@",idx,[obj description]);
                          //4番目のオブジェクトで検索中止
                          if (idx > 4) {
                              *stop = YES;
                          }
                          
                          //検索文字列が見つかったらブロックを抜ける
                          if ([obj isEqualToString:@"bbb"]) {
                              return YES;
                          }else {
                              return NO;
                          }
                          
                      }];
    //
    return idx;
    
}
@end
