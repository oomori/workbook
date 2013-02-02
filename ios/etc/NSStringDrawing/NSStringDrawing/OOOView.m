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

#import <CoreText/CoreText.h>

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
    UIFont *font = [UIFont fontWithName:@"HiraMinProN-W6" size:40.0];

    //NSDictionary *fontAttributes = @{@"NSFont": font};

//影
    NSShadow *shadowDic=[[NSShadow alloc] init];
    [shadowDic setShadowBlurRadius:5.0];
    [shadowDic setShadowColor:[UIColor grayColor]];
    [shadowDic setShadowOffset:CGSizeMake(0, 3)];
    
    NSDictionary *fontAttributes = @{@"NSFont": font,
                                        NSShadowAttributeName:shadowDic,
                                        //@"NSVerticalGlyphFormAttributeName":@YES
                                        @"CTVerticalForms": @YES
                                        };
    

    
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc] initWithString:@"文字ですよー"  attributes:fontAttributes];

    
//属性付き文字の詳細
//    NSLog(@"%s %@",__FUNCTION__,[aString description]);
    
    
//1属性追加
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];//0番目から2文字を赤にする
    [aString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(4, 1)];//4番目から1文字をブルーにする
    
    //描画    
    [aString drawInRect:CGRectMake(10, 10, 200, 100)];

    
    
    
    
    
    
    
    
//    NSStringDrawingContext * context = [NSStringDrawingContext alloc];
//    context.minimumTrackingAdjustment = -0.5;
//    [aString drawWithRect:CGRectMake(10, 10, 200, 100)
//                  options:NSStringDrawingUsesLineFragmentOrigin context:context ];
    
    
//アトリビュート描画
//    [aString enumerateAttribute:NSForegroundColorAttributeName inRange:NSMakeRange(0, 5)
//     
//                        options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired
//                     usingBlock:^(id value, NSRange range, BOOL *stop)
//     {
//         UIColor *fontColor = value;
//         NSLog(@"%@",[fontColor description]);
//     }
//     ];
    
    
    
    
    
    
    
    
    /*テスト中
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
    */
}


@end
