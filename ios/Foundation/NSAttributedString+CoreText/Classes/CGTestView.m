//
//  CGTestView.m
//  CoreGraphics
//
//  Created by 大森 智史 on 12/7/5.
//  Copyright 2012 Satoshi Oomori. All rights reserved.
//

#import "CGTestView.h"

@implementation CGTestView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}


#pragma mark initWithString:
-(void)method001
{
    
    
    NSAttributedString *aString = [[NSAttributedString alloc] initWithString:@"string"];
    
    NSLog(@"%s %@",__FUNCTION__,[aString description]);
    
    
}
//#import <CoreText/CoreText.h>が必要

- (void)drawRect:(CGRect)rect {

	CGContextRef context = UIGraphicsGetCurrentContext();
	
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect bounds = CGRectMake((CGFloat)rect.origin.x-0,
                               (CGFloat)rect.origin.y+400.0,
                               (CGFloat)rect.size.width-0,
                               (CGFloat)rect.size.height-500);
    CGPathAddRect(path, NULL, bounds);
    
    //フォント
    CTFontRef aFont1 = CTFontCreateWithName(CFSTR("HiraKakuProN-W6"), 20, NULL);
    CTFontRef aFont2 = CTFontCreateWithName(CFSTR("HiraMinProN-W6"), 18, NULL);
    //カラー
    CGColorRef darkGrayColor = [[UIColor darkGrayColor] CGColor];
    CGColorRef redColor = [[UIColor redColor] CGColor];
    
    //段落スタイル
    float_t lineHeight = 20.0;
    id paragraphStyleAttr = ((^ {
        
        CTParagraphStyleSetting paragraphStyles[] = (CTParagraphStyleSetting[]){
            (CTParagraphStyleSetting)
                { kCTParagraphStyleSpecifierLineHeightMultiple, sizeof(float_t), (float_t[]){ 0.01f } },
            (CTParagraphStyleSetting)
                { kCTParagraphStyleSpecifierMinimumLineHeight, sizeof(float_t), (float_t[]){lineHeight } },
            (CTParagraphStyleSetting)
                { kCTParagraphStyleSpecifierMaximumLineHeight, sizeof(float_t), (float_t[]){lineHeight } },
            (CTParagraphStyleSetting)
                { kCTParagraphStyleSpecifierLineSpacing, sizeof(float_t), (float_t[]){ 0.0f } },
            (CTParagraphStyleSetting)
                { kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(float_t), (float_t[]){ 0.0f } },
            (CTParagraphStyleSetting)
                { kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(float_t), (float_t[]){ 0.0f } }
            
        };
        
        CTParagraphStyleRef paragraphStyleRef = CTParagraphStyleCreate(paragraphStyles, sizeof(paragraphStyles) / sizeof(CTParagraphStyleSetting));
        return (__bridge_transfer id)paragraphStyleRef;
        
    })());

        //属性辞書
    NSDictionary *fontAttributes1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                    (__bridge id)aFont1, @"NSFont",
                                    (__bridge id)darkGrayColor, @"CTForegroundColor",
                                     [NSNumber numberWithBool:YES], @"CTVerticalForms",
                                     [NSNumber numberWithBool:YES],kCTLigatureAttributeName,
                                     paragraphStyleAttr, kCTParagraphStyleAttributeName,
                                    nil];
    
    //属性辞書
    NSDictionary *fontAttributes2 = [NSDictionary dictionaryWithObjectsAndKeys:
                                    (__bridge id)aFont2, @"NSFont",
                                    (__bridge id)redColor, @"CTForegroundColor",
                                    [NSNumber numberWithBool:YES], @"CTVerticalForms",
                                     //[NSNumber numberWithInt:3],kCTUnderlineStyleAttributeName,
                                     paragraphStyleAttr, kCTParagraphStyleAttributeName,
                                    nil];
    CFRelease(aFont1);
    CFRelease(aFont2);
    CFRelease(darkGrayColor);
    CFRelease(redColor);
    
    NSAttributedString *grayString = [[NSAttributedString alloc] initWithString:@"みなさん、こんにちは。\nこれはNSAttributedStringとCoreTextを使って、縦書き表示をするサンプルです。\n割と簡単に表示できるでしょ？\nいろいろ試してみてください。"  attributes:fontAttributes1];
    NSAttributedString *redString = [[NSAttributedString alloc] initWithString:@"ここから属性を変えて追加した赤い文字です。"  attributes:fontAttributes2];
    
    NSMutableAttributedString *amText = [[NSMutableAttributedString alloc] initWithAttributedString:grayString];
    [amText appendAttributedString:redString];
    
    //----------------------------------------------------
    NSLog(@"%s %@",__FUNCTION__,[amText string]);
    
    NSRange bRange; 
    NSLog(@"%@",[[amText attributesAtIndex:93 effectiveRange:&bRange] description]);
    NSLog(@"%d,%d",bRange.location,bRange.length);
    
    NSLog(@"%@",[[amText attributesAtIndex:1 
                longestEffectiveRange:&bRange
                              inRange:NSMakeRange(0,100)
            ]
           description]);
    NSLog(@"%d,%d",bRange.location,bRange.length);
    //------------------------------------------------------
    NSLog(@"%@",[[amText attribute:@"NSFont" 
                      atIndex:1 
               effectiveRange:&bRange
            ]
           description]);
    NSLog(@"%d,%d",bRange.location,bRange.length);
    
    NSLog(([grayString isEqualToAttributedString:redString])?@"YES":@"NO");
    
    
    
    
    NSAttributedString *subString = [amText attributedSubstringFromRange:NSMakeRange(2,20)];
    NSLog(@"%@",[subString string]);

    
    [amText enumerateAttribute:(__bridge_transfer NSString *) kCTFontAttributeName
                                 inRange:NSMakeRange(0, [amText length])
                                 options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired
                              usingBlock:^(id value, NSRange range, BOOL *stop) {
                                  NSLog(@"Attribute: %@, %@", value, NSStringFromRange(range));
                              }];
    
    [amText enumerateAttributesInRange:NSMakeRange(0, [amText length])
                       options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired
                    usingBlock:^(id value, NSRange range, BOOL *stop) {
                        NSLog(@"Attribute: %@, %@", value, NSStringFromRange(range));
                    }];
    
    
    
    
    //------------------------------------------------------
    
    CFMutableAttributedStringRef cfamText = (__bridge_retained CFMutableAttributedStringRef)amText;

    //属性付きテキストでフレームセッタを作成
    CTFramesetterRef framesetter =  CTFramesetterCreateWithAttributedString(cfamText);

    //属性付きテキストを解放
    CFRelease(cfamText);
    
    //フレーム作成
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, 
                                                (__bridge CFDictionaryRef)[NSDictionary dictionaryWithObjectsAndKeys:
                                                                  [NSNumber numberWithUnsignedInt:kCTFrameProgressionRightToLeft], @"CTFrameProgression", nil]);
    
    
    //フレーム描画
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
    
	CGContextSaveGState(context);
	CTFrameDraw(frame, context);
	CGContextRestoreGState(context);
    
	CGContextSetTextMatrix(context, CGAffineTransformIdentity);
	CGContextSetTextPosition(context, 0, 0);
    
    CFRelease(frame); 
    CFRelease(framesetter);
 
    
}



@end
