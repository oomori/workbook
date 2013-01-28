//
//  CGTestView.m
//  CoreGraphics
//
//  Created by 大森 智史 on 11/1/15.
//  Copyright 2011 Satoshi Oomori. All rights reserved.
//

#import <CoreText/CoreText.h>
#import "CGTestView.h"

//PIを3.14...と定義
#define PI 3.14159265358979323846

//関数定義degrees*PI/180がradians
static inline double radians(double degrees) { return degrees * PI / 180; }

@implementation CGTestView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}
-(BOOL)wantsUpdateLayer{
    return YES;
}

/* Callbacks */
void MyDeallocationCallback( void* refCon ){
    NSLog(@"Deallocation being set %@", refCon);
}
CGFloat MyGetAscentCallback( void *refCon ){
    NSLog(@"Ascent being set");
    return 20;
}
CGFloat MyGetDescentCallback( void *refCon ){
    NSLog(@"Descent being set");
    return 10;
}
CGFloat MyGetWidthCallback( void* refCon ){
    NSLog(@"Width being set %s",refCon);
    return 30.0;
}
//TEST 1 カラー　フォント　リガチャ　下線　段落
#pragma mark TEST 1

# if 0
- (void)drawRect:(CGRect)rect {
    //コンテキスト
	CGContextRef context = UIGraphicsGetCurrentContext();
    //パス
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect bounds = CGRectMake((CGFloat)self.bounds.origin.x,
                               (CGFloat)self.bounds.origin.y,
                               (CGFloat)self.bounds.size.width,
                               (CGFloat)self.bounds.size.height);
    CGPathAddRect(path, NULL, bounds);
    //フォント
    CTFontRef aFont1 = CTFontCreateWithName(CFSTR("Times New Roman"), 64, NULL);
    //CTFontRef aFont1 = CTFontCreateWithName(CFSTR("HiraMinProN-W6"), 64, NULL);
    CGColorRef darkGrayColor = [[UIColor darkGrayColor] CGColor];
    CGColorRef redColor = [[UIColor redColor] CGColor];
    
    CTTextAlignment alignment = kCTCenterTextAlignment;
    
    float_t lineHeight = 64.0;
    id paragraphStyleAttr = ((^ {

        CTParagraphStyleSetting paragraphStyles[] = (CTParagraphStyleSetting[]){
            (CTParagraphStyleSetting)
            { kCTParagraphStyleSpecifierAlignment, sizeof(alignment), &alignment},
            (CTParagraphStyleSetting)
            { kCTParagraphStyleSpecifierLineHeightMultiple, sizeof(float_t), (float_t[]){ lineHeight } },
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
        return (__bridge  id)paragraphStyleRef;
        
    })());
    
    
    NSDictionary *fontAttributes1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                     
                                     (__bridge id)aFont1, @"NSFont",
                                     (__bridge id)darkGrayColor, @"CTForegroundColor",
                                     //リガチャ
                                     //[NSNumber numberWithBool:YES],kCTLigatureAttributeName,
                                     //下線
                                     (__bridge id)redColor,kCTUnderlineColorAttributeName,
                                     [NSNumber numberWithInt:0x0100],kCTUnderlineStyleAttributeName,
                                     //段落
                                     paragraphStyleAttr, kCTParagraphStyleAttributeName,
                                     
                                     nil];
    NSDictionary *fontAttributes2 = [NSDictionary dictionaryWithObjectsAndKeys:
                                     (__bridge id)aFont1, @"NSFont",
                                     (__bridge id)darkGrayColor, @"CTForegroundColor",
                                     
                                     [NSNumber numberWithBool:NO],kCTLigatureAttributeName,
                                     nil];
    CFRelease(aFont1);
    CFRelease(darkGrayColor);
    
    NSAttributedString *grayString = [[NSAttributedString alloc] initWithString:@"リガチャ\n\n ffi fl\n"  attributes:fontAttributes1];
    
    
    NSMutableAttributedString *amText = [[NSMutableAttributedString alloc] initWithAttributedString:grayString];
    
    NSAttributedString *blueString = [[NSAttributedString alloc] initWithString:@" ffi fl\n"  attributes:fontAttributes2];
    [amText appendAttributedString:blueString];
    
    CFMutableAttributedStringRef cfamText = (__bridge_retained CFMutableAttributedStringRef)amText;
    
    //属性付きテキストでフレームセッタを作成
    CTFramesetterRef framesetter =  CTFramesetterCreateWithAttributedString(cfamText);
    
    //属性付きテキストを解放
    CFRelease(cfamText);
    
    //フレーム作成
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path,
                            (__bridge CFDictionaryRef)[NSDictionary dictionaryWithObjectsAndKeys:
                                                //[NSNumber numberWithUnsignedInt:kCTFrameProgressionRightToLeft], @"CTFrameProgression",
                                                       nil]);
    //レイヤーを作成
    CGLayerRef          layer;
    CGContextRef        layerContext;
    
    layer = CGLayerCreateWithContext(context,CGSizeMake(800, 800),NULL);
    //レイヤーのコンテキストを取得
    layerContext = CGLayerGetContext(layer);
    
    
    //状態保存
    CGContextSaveGState(layerContext);
    
    CGContextScaleCTM(layerContext, 1, -1);
	CGContextTranslateCTM(layerContext, 0, -self.bounds.size.height);
    
    CTFrameDraw(frame, layerContext);
    
    
    //戻す
    CGContextRestoreGState(layerContext);
    CGContextDrawLayerInRect(context, CGRectMake(0, 0, 800,800), layer);

    
}
#endif

//TEST 2　テキストフレームを縦書きに、CTVerticalFormsをYESにして縦書きに
#pragma mark TEST 2

# if 1
- (void)drawRect:(CGRect)rect {
    //コンテキスト
	CGContextRef context = UIGraphicsGetCurrentContext();
    //パス
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect bounds = CGRectMake((CGFloat)self.bounds.origin.x,
                               (CGFloat)self.bounds.origin.y,
                               (CGFloat)self.bounds.size.width,
                               (CGFloat)self.bounds.size.height);
    CGPathAddRect(path, NULL, bounds);
    //フォント
    CTFontRef aFont1 = CTFontCreateWithName(CFSTR("HiraMinProN-W6"), 25, NULL);
    CTFontRef aFont2 = CTFontCreateWithName(CFSTR("HiraKakuProN-W6"), 25, NULL);
    //カラー
    CGColorRef darkGrayColor = [[UIColor darkGrayColor] CGColor];
    //CGColorRef redColor = [[UIColor redColor] CGColor];
    CGColorRef blueColor = [[UIColor blueColor] CGColor];
    
    // create the delegate
    CTRunDelegateCallbacks callbacks;
    callbacks.version = kCTRunDelegateCurrentVersion;
    callbacks.dealloc = MyDeallocationCallback;
    callbacks.getAscent = MyGetAscentCallback;
    callbacks.getDescent = MyGetDescentCallback;
    callbacks.getWidth = MyGetWidthCallback;
    CTRunDelegateRef delegate = CTRunDelegateCreate(&callbacks, NULL);
    
    CTGlyphInfoRef glyphInfo = CTGlyphInfoCreateWithGlyph( 0x00A9,aFont2,(CFStringRef)@"©");
    
    NSDictionary *fontAttributes1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                     
                                     (__bridge id)aFont1, @"NSFont",
                                     
                                     (__bridge id)darkGrayColor, @"CTForegroundColor",
                                     [NSNumber numberWithBool:YES], @"CTVerticalForms",
                                     
                                     //delegate,kCTRunDelegateAttributeName,  //デリゲート
                                
                                     //[NSNumber numberWithFloat:5.0],kCTKernAttributeName,
                                     //@"http://www.apple.co. jp/" ,@"NSLinkAttributeName",
                                     
                                     nil];
    NSDictionary *fontAttributes2 = [NSDictionary dictionaryWithObjectsAndKeys:
                                     
                                     (__bridge id)aFont2, @"NSFont",
                                     
                                     (__bridge id)blueColor, @"CTForegroundColor",
                                     [NSNumber numberWithBool:YES], @"CTVerticalForms",
                                     
                                     //delegate,kCTRunDelegateAttributeName,  //デリゲート
                                     //glyphInfo,kCTGlyphInfoAttributeName,
                                     //[NSNumber numberWithInt:1],kCTCharacterShapeAttributeName,
                                     //[NSNumber numberWithInt:0x0100],@"CTUnderlineStyle",
                                     //(__bridge id)redColor,kCTUnderlineColorAttributeName,
                                     //[NSNumber numberWithInt:0x0100],kCTUnderlineStyleAttributeName,
                                     //[NSNumber numberWithInt:1],kCTSuperscriptAttributeName,
                                     //(__bridge id)blueColor,kCTStrokeColorAttributeName,
                                     //[NSNumber numberWithFloat:2.0],kCTStrokeWidthAttributeName,
                                     //[NSNumber numberWithFloat:3.0],kCTKernAttributeName,
                                     //[NSNumber numberWithInt:(int)kCTUnderlineStyleSingle|kCTUnderlinePatternDot] ,@"CTUnderlineStyleModifiers",
                                     //[NSNumber numberWithBool:YES],kCTForegroundColorFromContextAttributeName,
                                     //@"http://www.apple.co. jp/" ,@"NSLinkAttributeName",
                                     
                                     nil];

    
    CFRelease(aFont1);
    CFRelease(darkGrayColor);
    
    NSAttributedString *grayString = [[NSAttributedString alloc] initWithString:@"みなさん、こんにちは。\nこれは縦書き表示をするサンプルです。\n割と簡単に表示できるでしょ？\nいろいろ試してみてください。"  attributes:fontAttributes1];
    NSMutableAttributedString *amText = [[NSMutableAttributedString alloc] initWithAttributedString:grayString];
    
    NSAttributedString *blueString = [[NSAttributedString alloc] initWithString:@"追加してみた文字です。きゃきゅきょ\n"  attributes:fontAttributes2];
    [amText appendAttributedString:blueString];
    
    CFMutableAttributedStringRef cfamText = (__bridge_retained CFMutableAttributedStringRef)amText;
    
    //属性付きテキストでフレームセッタを作成
    CTFramesetterRef framesetter =  CTFramesetterCreateWithAttributedString(cfamText);
    
    //属性付きテキストを解放
    CFRelease(cfamText);
    
    //フレーム作成
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path,
                                                (__bridge CFDictionaryRef)[NSDictionary dictionaryWithObjectsAndKeys:
                                                                           [NSNumber numberWithUnsignedInt:kCTFrameProgressionRightToLeft], @"CTFrameProgression",
                                                                           nil]);
    //レイヤーを作成
    CGLayerRef          layer;
    CGContextRef        layerContext;
    
    layer = CGLayerCreateWithContext(context,CGSizeMake(800, 800),NULL);
    //レイヤーのコンテキストを取得
    layerContext = CGLayerGetContext(layer);
    
    
    //状態保存
    CGContextSaveGState(layerContext);
    
    CGContextScaleCTM(layerContext, 1, -1);
	CGContextTranslateCTM(layerContext, 0, -self.bounds.size.height);
    
    CTFrameDraw(frame, layerContext);
    
    
    //戻す
    CGContextRestoreGState(layerContext);
    CGContextDrawLayerInRect(context, CGRectMake(0, 0, 800,800), layer);
    
    
}
#endif
//TEST 3　段落
//縦書きは段落有効ではない
#pragma mark TEST 3
# if 0
- (void)drawRect:(CGRect)rect {
    //コンテキスト
	CGContextRef context = UIGraphicsGetCurrentContext();
    //パス
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect bounds = CGRectMake((CGFloat)self.bounds.origin.x,
                               (CGFloat)self.bounds.origin.y,
                               (CGFloat)self.bounds.size.width,
                               (CGFloat)self.bounds.size.height);
    CGPathAddRect(path, NULL, bounds);
    //フォント
    CTFontRef aFont1 = CTFontCreateWithName(CFSTR("HiraKakuProN-W6"), 20, NULL);
    CTFontRef aFont2 = CTFontCreateWithName(CFSTR("HiraMinProN-W6"), 20, NULL);
    //カラー
    CGColorRef darkGrayColor = [[UIColor darkGrayColor] CGColor];
    //CGColorRef redColor = [[UIColor redColor] CGColor];
    CGColorRef blueColor = [[UIColor blueColor] CGColor];
    
    //段落スタイル
    CTTextAlignment alignment = kCTCenterTextAlignment;
    
    
    float_t lineHeight = 40.0;
    id paragraphStyleAttr = ((^ {
        //CTTextAlignment alignment = kCTCenterTextAlignment;
        CTParagraphStyleSetting paragraphStyles[] = (CTParagraphStyleSetting[]){
            (CTParagraphStyleSetting)
            { kCTParagraphStyleSpecifierAlignment, sizeof(alignment), &alignment},
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
        return (__bridge  id)paragraphStyleRef;
        
    })());

    
    NSDictionary *fontAttributes1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                     
                                     (__bridge id)aFont1, @"NSFont",
                                     
                                     (__bridge id)darkGrayColor, @"CTForegroundColor",
                                     [NSNumber numberWithBool:YES], @"CTVerticalForms",
                                     //[NSNumber numberWithBool:YES],kCTLigatureAttributeName,
                                     
                                     paragraphStyleAttr, kCTParagraphStyleAttributeName,
                                     //delegate,kCTRunDelegateAttributeName,  //デリゲート
                                     //glyphInfo,kCTGlyphInfoAttributeName,
                                     //[NSNumber numberWithInt:1],kCTCharacterShapeAttributeName,
                                     //[NSNumber numberWithInt:0x0100],@"CTUnderlineStyle",
                                     //(__bridge id)redColor,kCTUnderlineColorAttributeName,
                                     //[NSNumber numberWithInt:0x0100],kCTUnderlineStyleAttributeName,
                                     //[NSNumber numberWithInt:1],kCTSuperscriptAttributeName,
                                     //(__bridge id)blueColor,kCTStrokeColorAttributeName,
                                     //[NSNumber numberWithFloat:2.0],kCTStrokeWidthAttributeName,
                                     //[NSNumber numberWithFloat:3.0],kCTKernAttributeName,
                                     //[NSNumber numberWithInt:(int)kCTUnderlineStyleSingle|kCTUnderlinePatternDot] ,@"CTUnderlineStyleModifiers",
                                     //[NSNumber numberWithBool:YES],kCTForegroundColorFromContextAttributeName,
                                     //@"http://www.apple.co. jp/" ,@"NSLinkAttributeName",
                                     
                                     nil];
    NSDictionary *fontAttributes2 = [NSDictionary dictionaryWithObjectsAndKeys:
                                     
                                     (__bridge id)aFont2, @"NSFont",
                                     
                                     (__bridge id)blueColor, @"CTForegroundColor",
                                     [NSNumber numberWithBool:YES], @"CTVerticalForms",
                                     //[NSNumber numberWithBool:YES],kCTLigatureAttributeName,
                                     
                                     //paragraphStyleAttr, kCTParagraphStyleAttributeName,
                                     //delegate,kCTRunDelegateAttributeName,  //デリゲート
                                     //glyphInfo,kCTGlyphInfoAttributeName,
                                     //[NSNumber numberWithInt:1],kCTCharacterShapeAttributeName,
                                     //[NSNumber numberWithInt:0x0100],@"CTUnderlineStyle",
                                     //(__bridge id)redColor,kCTUnderlineColorAttributeName,
                                     //[NSNumber numberWithInt:0x0100],kCTUnderlineStyleAttributeName,
                                     //[NSNumber numberWithInt:1],kCTSuperscriptAttributeName,
                                     //(__bridge id)blueColor,kCTStrokeColorAttributeName,
                                     //[NSNumber numberWithFloat:2.0],kCTStrokeWidthAttributeName,
                                     //[NSNumber numberWithFloat:3.0],kCTKernAttributeName,
                                     //[NSNumber numberWithInt:(int)kCTUnderlineStyleSingle|kCTUnderlinePatternDot] ,@"CTUnderlineStyleModifiers",
                                     //[NSNumber numberWithBool:YES],kCTForegroundColorFromContextAttributeName,
                                     //@"http://www.apple.co. jp/" ,@"NSLinkAttributeName",
                                     
                                     nil];
    
    
    CFRelease(aFont1);
    CFRelease(darkGrayColor);
    
    NSAttributedString *grayString = [[NSAttributedString alloc] initWithString:@"みなさん、こんにちは。\nこれは縦書き表示をするサンプルです。\n割と簡単に表示できるでしょ？\nいろいろ試してみてください。"  attributes:fontAttributes1];
    NSMutableAttributedString *amText = [[NSMutableAttributedString alloc] initWithAttributedString:grayString];
    
    NSAttributedString *blueString = [[NSAttributedString alloc] initWithString:@"追加してみた文字です。きゃきゅきょ\n"  attributes:fontAttributes2];
    
    [amText appendAttributedString:blueString];
    
    CFMutableAttributedStringRef cfamText = (__bridge_retained CFMutableAttributedStringRef)amText;
    
    //属性付きテキストでフレームセッタを作成
    CTFramesetterRef framesetter =  CTFramesetterCreateWithAttributedString(cfamText);
    
    //属性付きテキストを解放
    CFRelease(cfamText);
    
    //フレーム作成
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path,
                                                (__bridge CFDictionaryRef)[NSDictionary dictionaryWithObjectsAndKeys:
                                                                           [NSNumber numberWithUnsignedInt:kCTFrameProgressionRightToLeft], @"CTFrameProgression",
                                                                           nil]);
    //レイヤーを作成
    CGLayerRef          layer;
    CGContextRef        layerContext;
    
    layer = CGLayerCreateWithContext(context,CGSizeMake(800, 800),NULL);
    //レイヤーのコンテキストを取得
    layerContext = CGLayerGetContext(layer);
    
    
    //状態保存
    CGContextSaveGState(layerContext);
    
    CGContextScaleCTM(layerContext, 1, -1);
	CGContextTranslateCTM(layerContext, 0, -self.bounds.size.height);
    
    CTFrameDraw(frame, layerContext);
    
    
    //戻す
    CGContextRestoreGState(layerContext);
    CGContextDrawLayerInRect(context, CGRectMake(0, 0, 800,800), layer);
    
    
}
#endif

#pragma mark TEST 4
# if 0
- (void)drawRect:(CGRect)rect {

    
    //コンテキスト
	CGContextRef context = UIGraphicsGetCurrentContext();
    
    //描画する画像
    UIImage *nimage =[UIImage imageNamed:@"gazou.jpg"];
    
    CGContextRef bitmapContext;
	
	//コンテキストに線のカラーをセットします。
    float col[4];
    col[0] = 1.0;
    col[1] = 1.0;
    col[2] = 0.5;
    col[3] = 0.5;
    
    //画像の色空間
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    
    
    CGImageRef cgImage = nimage.CGImage;
    CGDataProviderRef dataProvider = CGImageGetDataProvider(cgImage);
    CFDataRef pData = CGDataProviderCopyData(dataProvider);
    
    int imageH = CGImageGetHeight( cgImage);
    int imageW = CGImageGetWidth( cgImage);
    int bitsPerComponent = CGImageGetBitsPerComponent(cgImage);
    int bytesPerRow = CGImageGetBytesPerRow(cgImage);
    
    bitmapContext = CGBitmapContextCreateWithData((void *)pData, imageW, imageH, bitsPerComponent, bytesPerRow, space, kCGImageAlphaNoneSkipLast, NULL, NULL);
    
    //------------
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect bounds = CGRectMake((CGFloat)self.bounds.origin.x,
                               (CGFloat)self.bounds.origin.y,
                               (CGFloat)self.bounds.size.width,
                               (CGFloat)self.bounds.size.height);
    CGPathAddRect(path, NULL, bounds);
    //-------------
    /*
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    
    CGFloat delta = radians(360 * 90);
    
    CGFloat innerRadius = 20;
    CGFloat outerRadius = innerRadius + 180;
    
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:99/256.0 green:183/256.0 blue:70/256.0 alpha:.5].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:99/256.0 green:183/256.0 blue:70/256.0 alpha:10.0].CGColor);
    CGContextSetLineWidth(context, 1);
    
    //CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddRelativeArc(path, NULL, center.x, center.y, innerRadius, -(M_PI / 2), delta);
    CGPathAddRelativeArc(path, NULL, center.x, center.y, outerRadius, delta - (M_PI / 2), -delta);
    CGPathAddLineToPoint(path, NULL, center.x, center.y-innerRadius);
    
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    */

    
    
    //フォント
    CTFontRef aFont1 = CTFontCreateWithName(CFSTR("Times New Roman"), 20, NULL);
    //CTFontRef aFont1 = CTFontCreateWithName(CFSTR("HiraKakuProN-W6"), 20, NULL);
    CTFontRef aFont2 = CTFontCreateWithName(CFSTR("HiraMinProN-W6"), 18, NULL);
    //カラー
    CGColorRef darkGrayColor = [[UIColor darkGrayColor] CGColor];
    CGColorRef redColor = [[UIColor redColor] CGColor];
    CGColorRef blueColor = [[UIColor blueColor] CGColor];
    
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
        return (__bridge  id)paragraphStyleRef;
        
    })());
    
    //属性辞書
    // create the delegate
    CTRunDelegateCallbacks callbacks;
    callbacks.version = kCTRunDelegateCurrentVersion;
    callbacks.dealloc = MyDeallocationCallback;
    callbacks.getAscent = MyGetAscentCallback;
    callbacks.getDescent = MyGetDescentCallback;
    callbacks.getWidth = MyGetWidthCallback;
    CTRunDelegateRef delegate = CTRunDelegateCreate(&callbacks, NULL);
    
    
    CTGlyphInfoRef glyphInfo = CTGlyphInfoCreateWithGlyph( 0x00A9,aFont2,(CFStringRef)@"©");
    
    
    NSDictionary *fontAttributes1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                     
                                     (__bridge id)aFont1, @"NSFont",
                                     
                                     (__bridge id)darkGrayColor, @"CTForegroundColor",
                                     [NSNumber numberWithBool:YES], @"CTVerticalForms",
                                     [NSNumber numberWithBool:YES],kCTLigatureAttributeName,
                                     
                                     //paragraphStyleAttr, kCTParagraphStyleAttributeName,
                                      //delegate,kCTRunDelegateAttributeName,  //デリゲート
                                      //glyphInfo,kCTGlyphInfoAttributeName,
                                      //[NSNumber numberWithInt:1],kCTCharacterShapeAttributeName,
                                      //[NSNumber numberWithInt:0x0100],@"CTUnderlineStyle",
                                      //(__bridge id)redColor,kCTUnderlineColorAttributeName,
                                      //[NSNumber numberWithInt:0x0100],kCTUnderlineStyleAttributeName,
                                      //[NSNumber numberWithInt:1],kCTSuperscriptAttributeName,
                                      //(__bridge id)blueColor,kCTStrokeColorAttributeName,
                                      //[NSNumber numberWithFloat:2.0],kCTStrokeWidthAttributeName,
                                      //[NSNumber numberWithFloat:3.0],kCTKernAttributeName,
                                      //[NSNumber numberWithInt:(int)kCTUnderlineStyleSingle|kCTUnderlinePatternDot] ,@"CTUnderlineStyleModifiers",
                                      //[NSNumber numberWithBool:YES],kCTForegroundColorFromContextAttributeName,
                                      //@"http://www.apple.co. jp/" ,@"NSLinkAttributeName",
                                      
                                     nil];
    //CFRelease(delegate);
    //属性辞書
    NSDictionary *fontAttributes2 = [NSDictionary dictionaryWithObjectsAndKeys:
                                     (__bridge id)aFont2, @"NSFont",
                                     (__bridge id)redColor, @"CTForegroundColor",
                                     [NSNumber numberWithBool:YES], @"CTVerticalForms",
                                     //[NSNumber numberWithInt:3],kCTUnderlineStyleAttributeName,
                                     paragraphStyleAttr, kCTParagraphStyleAttributeName,
                                     nil];
    
    NSDictionary *fontAttributes5 = [NSDictionary dictionaryWithObjectsAndKeys:
                                     (__bridge id)aFont2, @"NSFont",
                                     (__bridge id)blueColor, @"CTForegroundColor",
                                     [NSNumber numberWithBool:YES], @"CTVerticalForms",
                                     //[NSNumber numberWithInt:3],kCTUnderlineStyleAttributeName,
                                     paragraphStyleAttr, kCTParagraphStyleAttributeName,
                                     nil];
    CFRelease(aFont1);
    CFRelease(aFont2);
    CFRelease(darkGrayColor);
    CFRelease(redColor);
    CFRelease(blueColor);
    
    NSAttributedString *grayString = [[NSAttributedString alloc] initWithString:@"みなさん、こんにちは。\nこれはNSAttributedStringとCoreTextを使って、縦書き表示をするサンプルです。\n割とffi簡単に表示できるでしょ？\nいろいろ試してみてください。"  attributes:fontAttributes1];
    NSAttributedString *redString = [[NSAttributedString alloc] initWithString:@"ここから属性を変えて追加した赤い文字です。"  attributes:fontAttributes2];
    
    NSMutableAttributedString *amText = [[NSMutableAttributedString alloc] initWithAttributedString:grayString];
    //[amText appendAttributedString:redString];
    
    //----------------------------------------------------
    /*
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
    */
     //------------------------------------------------------
    /*
    NSLog(@"%@",[[amText attribute:@"NSFont"
                           atIndex:1
                    effectiveRange:&bRange
                  ]
                 description]);
    NSLog(@"%d,%d",bRange.location,bRange.length);
    
    NSLog(([grayString isEqualToAttributedString:redString])?@"YES":@"NO");
    
    
    
    
    NSAttributedString *subString = [amText attributedSubstringFromRange:NSMakeRange(2,20)];
    NSLog(@"%@",[subString string]);
    */
    /*
    [amText enumerateAttribute:(NSString *) kCTFontAttributeName
                       inRange:NSMakeRange(0, [amText length])
                       options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired
                    usingBlock:^(id value, NSRange range, BOOL *stop) {
                        //NSLog(@"Attribute: %@, %@", value, NSStringFromRange(range));
                    }];
    
    [amText enumerateAttributesInRange:NSMakeRange(0, [amText length])
                               options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired
                            usingBlock:^(id value, NSRange range, BOOL *stop) {
                                //NSLog(@"Attribute: %@, %@", value, NSStringFromRange(range));
                            }];
    
    
    NSLog(@"%@",[[amText mutableString] description]);
    
    [amText replaceCharactersInRange:NSMakeRange(92, 3) withString:@"別の文字"];
    [amText deleteCharactersInRange:NSMakeRange(0, 3)];
    
    //setAttributes
    CGColorRef greenColor = [[UIColor greenColor] CGColor];
    NSDictionary *fontAttributes3 = [NSDictionary dictionaryWithObjectsAndKeys:
                                     (__bridge id)greenColor, @"CTForegroundColor",
                                     [NSNumber numberWithBool:YES], @"CTVerticalForms",
                                     paragraphStyleAttr, kCTParagraphStyleAttributeName,
                                     nil];
    [amText setAttributes:fontAttributes3 range:NSMakeRange(0, 3)];
    */
    //---------------------------
    /*
    [amText enumerateAttributesInRange:NSMakeRange(3,5)
                               options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired
                            usingBlock:^(id value, NSRange range, BOOL *stop) {
                                NSRange bRange;
                                NSDictionary *aDic = [amText attributesAtIndex:range.location longestEffectiveRange:&bRange  inRange:range];
                                NSMutableDictionary *retDic = [[NSMutableDictionary alloc] initWithCapacity:10];
                                [retDic addEntriesFromDictionary:aDic];
                                [retDic setObject:(__bridge id)greenColor forKey:@"CTForegroundColor"];
                                [amText setAttributes:retDic range:range];
                                NSLog(@"Attribute: %@, %@", value, NSStringFromRange(range));
                            }];
    
    [amText addAttribute:@"CTForegroundColor" value:(__bridge id)greenColor range:NSMakeRange(85, 10)];
    CFRelease(greenColor);
    */
     /*
    NSDictionary *fontAttributes4 = [NSDictionary dictionaryWithObjectsAndKeys:
                                     (__bridge id)greenColor, @"CTForegroundColor",
                                     [NSNumber numberWithBool:NO], @"CTVerticalForms",
                                     nil];
    [amText addAttributes:fontAttributes4 range:NSMakeRange(70, 10)];
    [amText removeAttribute:@"CTForegroundColor" range:NSMakeRange(50, 10)];
    */
    /*
    NSAttributedString *blueString = [[NSAttributedString alloc] initWithString:@"ここから属性を変えて追加した青い文字です。"  attributes:fontAttributes5];
    [amText appendAttributedString:blueString];
    */
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
    
    //kCTFrameProgressionRightToLeft
    //------------
    
    CGRect r = CGRectMake(50.0, self.bounds.size.height-50.0-50.0, 50.0, 50.0);//self.bounds;
	
    
    //レイヤーを作成
    CGLayerRef          layer;
    CGContextRef        layerContext;
    
    layer = CGLayerCreateWithContext(context,CGSizeMake(800, 800),NULL);
    //レイヤーのコンテキストを取得
    layerContext = CGLayerGetContext(layer);
    
    
    //状態保存
    CGContextSaveGState(layerContext);
    
    CGContextScaleCTM(layerContext, 1, -1);
	CGContextTranslateCTM(layerContext, 0, -self.bounds.size.height);
    
    CTFrameDraw(frame, layerContext);
    CGContextDrawImage(layerContext, r,cgImage) ;
    
    
    //戻す
    CGContextRestoreGState(layerContext);
    CGContextDrawLayerInRect(context, CGRectMake(0, 0, 800,800), layer);

    
    
}
# endif


@end
