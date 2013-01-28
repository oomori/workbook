//
//  OOOView.m
//  NSStringDrawing
//
//  Created by 大森 智史 on 2013/01/23.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

//QuartzCore.frameforkが必要
#import <QuartzCore/QuartzCore.h>
#import "OOOLayer.h"
#import "OOOView.h"

@implementation OOOView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
//- (void)drawLayer:(CALayer*)layer inContext:(CGContextRef)context

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
    
    OOOLayer* subLayer = [OOOLayer layer];
    subLayer.frame = self.frame;
    [self.layer addSublayer:subLayer];
    subLayer.masksToBounds = YES;
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:
                          CGRectMake(-10.0, -10.0, subLayer.bounds.size.width+10.0, 10.0)];
    subLayer.shadowOffset = CGSizeMake(2.5, 2.5);
    subLayer.shadowColor = [[UIColor blackColor] CGColor];
    subLayer.shadowOpacity = 0.5;
    subLayer.shadowPath = [path CGPath];
    
    CATransform3D baseTransform = CATransform3DMakeTranslation(-100.0, -50.0, 0.0);
    CATransform3D transform = CATransform3DRotate(baseTransform, 1.0/2 * M_PI, 0.0, 0.0, 1.0);
    //CATransform3DMakeRotation(1.0/3 * M_PI, 0.0, 0.0, 1.0
    CATransform3D t = CATransform3DIdentity;
    t.m34 = - 1.0 / 200;
    subLayer.transform = transform;
    
    //self.layer.position = CGPointMake(100, 100);
    //self.layer.sublayerTransform = t;
    
}


@end
