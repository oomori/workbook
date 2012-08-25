//
//  OOOViewController.m
//  NSAttributedString
//
//  Created by 大森 智史 on 12/05/04.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOViewController.h"
#import <CoreText/CoreText.h>
@interface OOOViewController ()

@end

@implementation OOOViewController

#pragma mark initWithString:
-(void)method001
{
    
    
    NSAttributedString *aString = [[NSAttributedString alloc] initWithString:@"string"];
    
    NSLog(@"%s %@",__FUNCTION__,[aString description]);
    
    
}

#pragma mark boldSystemFontOfSize
-(void)method002
{

    CTFontRef aFont2 = CTFontCreateWithName(CFSTR("HiraMinProN-W6"), 18, NULL);
    CGColorRef darkGrayColor = [[UIColor darkGrayColor] CGColor];
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
    NSDictionary *fontAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                     (__bridge id)aFont2, @"NSFont",
                                     (__bridge id)darkGrayColor, @"CTForegroundColor",
                                     [NSNumber numberWithBool:YES], @"CTVerticalForms",
                                     paragraphStyleAttr, kCTParagraphStyleAttributeName,
                                     nil];
    
    NSAttributedString *aString = [[NSAttributedString alloc] initWithString:@"string"  attributes:fontAttributes];
    
    NSLog(@"%s %@",__FUNCTION__,[aString description]);
    
    NSLog(@"%s %@",__FUNCTION__,[aString string]);
    
    
}
#pragma mark initWithString:

-(void)method003
{
    
    NSAttributedString *aString = [[NSAttributedString alloc] initWithString:@"string"];    
    
    NSLog(@"%s %@",__FUNCTION__,[aString description]);
    
    
}

#pragma mark initWithString:
-(void)method004
{
    
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
    
    
    CGRect r = CGRectMake(50.0, self.view.bounds.size.height-50.0-50.0, 50.0, 50.0);//self.bounds;
	
    
    //レイヤーを作成
    CGLayerRef          layer;
    CGContextRef        layerContext;
    
    layer = CGLayerCreateWithContext(context,CGSizeMake(100, 100),NULL);
    //レイヤーのコンテキストを取得
    layerContext = CGLayerGetContext(layer);
    
    [self.view.layer addSublayer:layer];
    //状態保存
    CGContextSaveGState(layerContext);
    
    CGContextScaleCTM(layerContext, 1, -1);
	CGContextTranslateCTM(layerContext, 0, -self.view.bounds.size.height);
    
    CGContextDrawImage(layerContext, r,cgImage) ;
    
    //戻す
    CGContextRestoreGState(layerContext);
    
    
    
    CGContextDrawLayerInRect(context, CGRectMake(0, 0, 100,100), layer);
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
     [self method001];
    [self method002];
    //[self method003];
    [self method004];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
