//
//  OOOLayer.m
//  NSStringDrawing
//
//  Created by 大森 智史 on 2013/01/26.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import "OOOLayer.h"

@implementation OOOLayer
//- (void)drawRect:(CGRect)rect
- (void)drawLayer:(CALayer*)layer inContext:(CGContextRef)context
{
    
    //属性付き文字列作成
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc] initWithString:@"string"];
    
    NSLog(@"%s %@",__FUNCTION__,[aString description]);
    
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(3, 1)];
    
    [aString enumerateAttribute:NSForegroundColorAttributeName inRange:NSMakeRange(0, 5)
     
                        options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired
                     usingBlock:^(id value, NSRange range, BOOL *stop)
     {
         UIColor *fontColor = value;
         NSLog(@"%@",[fontColor description]);
     }
     ];
    //描画
    [aString drawInRect:CGRectMake(10, 10, 100, 100)];
}
@end
