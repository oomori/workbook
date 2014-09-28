//
//  OOOMyScene.m
//  SKKitSample
//
//  Created by air on 2014/02/15.
//  Copyright (c) 2014年 oomori. All rights reserved.
//

#import "OOOMyScene.h"
#import "OOOAppDelegate.h"

#import <CoreText/CoreText.h>
//PIを3.14...と定義
#define PI 3.14159265358979323846

//関数定義degrees*PI/180がradians
static inline double radians(double degrees) { return degrees * PI / 180; }
//関数定義radians/PI*180がdegrees
static inline double degrees(double radians) { return radians / PI * 180; }


@implementation OOOMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        //シーンのバックグラウンドカラー設定
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        //ラベルノード作成
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        //ラベルノードの設定
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        //シーンにラベルノードを追加
        [self addChild:myLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        
        //フォント
        CTFontRef font = CTFontCreateWithName(CFSTR("HiraKakuProN-W6"), 80, NULL);
        
        CFStringRef string = (CFStringRef)@"だ";
        
        CFMutableAttributedStringRef attrString = CFAttributedStringCreateMutable(kCFAllocatorDefault, 0);
        CFAttributedStringReplaceString (attrString, CFRangeMake(0, 0), string);
        
        CFAttributedStringSetAttribute(attrString, CFRangeMake(0, 1), kCTFontAttributeName, font);
        
        
        //カラースペース
        CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
        //RGBコンポーネント作成 RGBA
        CGFloat components[] = { 1.0, 0.0, 0.0, 0.8 };
        //カラーを作成
        CGColorRef red = CGColorCreate(rgbColorSpace, components);
        //解放
        CGColorSpaceRelease(rgbColorSpace);
        
        //属性をセット
        CFAttributedStringSetAttribute(attrString, CFRangeMake(0, 1), kCTForegroundColorAttributeName, red);
        
        //フレーム描画
        // 文字列の描画
        CTLineRef line = CTLineCreateWithAttributedString(attrString);
        
        //グリフの配列を得る
        CFArrayRef glyphRuns = CTLineGetGlyphRuns(line);
        //グリフ数を得る
        CFIndex runCount = CFArrayGetCount(glyphRuns);
        
        
        //Runの数だけループする
        for (CFIndex runIndex = 0; runIndex < runCount; ++runIndex)
        {
            CTRunRef run = CFArrayGetValueAtIndex(glyphRuns, runIndex);
            
            //Runのフォント
            //CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run),kCTFontAttributeName);
            CFIndex glyphCount = CTRunGetGlyphCount(run);
            
            //NSLog(@" %2.0ld: %ld chars",runIndex,glyphCount);
            
            for (CFIndex glyphIndex = 0; glyphIndex < glyphCount; ++glyphIndex)
            {
                
                CGGlyph *glyphs1= (CGGlyph*)CTRunGetGlyphsPtr(run);
                if (glyphIndex == 0){
                    
                    //NSLog(@"    glyph:%4.0hu %4.4f , %4.4f",glyphs1[glyphIndex],positions1[glyphIndex].x,positions1[glyphIndex].y);
                    
                    //グリフのパスを得るには
                    CGPathRef thePath = CTFontCreatePathForGlyph(font, *glyphs1, NULL);
                    glyphBezierPath = [UIBezierPath bezierPath];
                    [glyphBezierPath moveToPoint:currentPosition];
                    [glyphBezierPath appendPath:[UIBezierPath bezierPathWithCGPath:thePath]];
                    CGPathRelease(thePath);
                    
                    
                }
                
                
            }
        }

        

        //アクションの作成
        CGVector aVector = CGVectorMake(100.0f, 20.0f);
        SKAction *action = [SKAction moveBy:aVector duration:1 ];
        
        
        
        
        SKShapeNode *wheel = [[SKShapeNode alloc]init];
        CGPoint location = [touch locationInNode:self];
        
        
        //スプライトの位置
        wheel.path = glyphBezierPath.CGPath;
        wheel.fillColor = [SKColor whiteColor];
        wheel.position = location;
        //CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        
        //アクション実行
        //アクション実行
        //[wheel runAction:[SKAction repeatActionForever:action]];
        
        [wheel runAction:action];
        
        [self addChild:wheel];
        
        //シーンにスプライトを追加
        //[self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
