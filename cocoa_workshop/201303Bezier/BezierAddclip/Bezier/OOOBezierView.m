//
//  OOOBezierView.m
//  Bezier
//
//  Created by 大森 智史 on 2013/03/03.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import "OOOBezierView.h"
#import "OOOPathObject.h"

//PIを3.14...と定義
#define PI 3.14159265358979323846

//関数定義degrees*PI/180がradians
static inline double radians(double degrees) { return degrees * PI / 180; }

@implementation OOOBezierView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        

        

    }
    return self;
}

-(void) timerControl:(NSTimer *)aTimer
{
    if (currentPosition.y>0){
    [self setNeedsDisplay];
        timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                                 target:		self
                                               selector:	@selector( timerControl: )
                                               userInfo:	nil
                                                repeats:	NO];
        radius = radius+1;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    //どの指かタッチしたら
    OOOAppDelegate *appDele = [[UIApplication sharedApplication] delegate];
    
    [[event allTouches] enumerateObjectsUsingBlock:^(id obj, BOOL *stop)
     {
         
         currentPosition  = CGPointMake([obj locationInView:self].x,[obj locationInView:self].y);
         //loopCount++;
         if(appDele.nimage){
             
             
             //CGImageに
             cgImage = appDele.nimage.CGImage;
             CGDataProviderRef dataProvider = CGImageGetDataProvider(cgImage);
             pData = CGDataProviderCopyData(dataProvider);
         }
         
         timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                  target:		self
                                                selector:	@selector( timerControl: )
                                                userInfo:	nil
                                                 repeats:	NO];
         radius = 20;
         *stop = YES;
     }];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

    [[event allTouches] enumerateObjectsUsingBlock:^(id obj, BOOL *stop)
     {

         currentPosition  = CGPointMake([obj locationInView:self].x,[obj locationInView:self].y);
         
         
         *stop = YES;
     }];
    [self setNeedsDisplay];
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[event allTouches] enumerateObjectsUsingBlock:^(id obj, BOOL *stop)
     {

         [timer invalidate];
         *stop = YES;
     }];
    
    [self setNeedsDisplay];

}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    BOOL isPad = [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad;
    
    
    
    //コンテキスト
	CGContextRef context = UIGraphicsGetCurrentContext();
    
    //描画する画像
    OOOAppDelegate *appDele = [[UIApplication sharedApplication] delegate];
    
    if (isPad) {
        appDele.nimage=[UIImage imageNamed:@"IMG_3830.jpg"];
        //NSLog(@"I am iPad");
    } else {
        appDele.nimage=[UIImage imageNamed:@"IMG_3830.jpg"];
    }
    
    
    CGContextRef bitmapContext;
	
	//コンテキストに線のカラーをセットします。
    float col[4];
    col[0] = 1.0;
    col[1] = 1.0;
    col[2] = 0.5;
    col[3] = 0.5;
    
    //画像の色空間
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    
    
    
    int imageH = CGImageGetHeight( cgImage);
    int imageW = CGImageGetWidth( cgImage);
    int bitsPerComponent = CGImageGetBitsPerComponent(cgImage);
    int bytesPerRow = CGImageGetBytesPerRow(cgImage);
    
    bitmapContext = CGBitmapContextCreateWithData((void *)pData, imageW, imageH, bitsPerComponent, bytesPerRow, space, kCGImageAlphaNoneSkipLast, NULL, NULL);
    
    CGRect r = CGRectMake(50.0, 300.0, imageW/4, imageH/4);//self.bounds;
	
    //状態保存
    CGContextSaveGState(context);
    

    
    
    
    //外側のパス
    UIBezierPath *outPath2 = [UIBezierPath bezierPath];
    
    [outPath2 moveToPoint:CGPointMake(100,300)];
    [outPath2 addCurveToPoint:CGPointMake(200.0, 300.0)
                controlPoint1:CGPointMake(100.0,300.0)
                controlPoint2:CGPointMake(200.0,300.0)];
    [outPath2 addCurveToPoint:CGPointMake(200.0, 400.0)
                controlPoint1:CGPointMake(200.0,300.0)
                controlPoint2:CGPointMake(200.0,400.0)];
    [outPath2 addCurveToPoint:CGPointMake(100.0, 400.0)
                controlPoint1:CGPointMake(200.0,400.0)
                controlPoint2:CGPointMake(100.0,400.0)];
    [outPath2 addCurveToPoint:CGPointMake(100.0, 300.0)
                controlPoint1:CGPointMake(100.0,400.0)
                controlPoint2:CGPointMake(100.0,400.0)];
    [outPath2 closePath];
    
    [outPath2 moveToPoint:CGPointMake(120,320)];
    [outPath2 addCurveToPoint:CGPointMake(120.0, 380.0)
                controlPoint1:CGPointMake(120.0,320.0)
                controlPoint2:CGPointMake(120.0,380.0)];
    [outPath2 addCurveToPoint:CGPointMake(180.0, 380.0)
                controlPoint1:CGPointMake(120.0,380.0)
                controlPoint2:CGPointMake(180.0,380.0)];
    [outPath2 addCurveToPoint:CGPointMake(180.0, 320.0)
                controlPoint1:CGPointMake(180.0,380.0)
                controlPoint2:CGPointMake(180.0,320.0)];
    [outPath2 addCurveToPoint:CGPointMake(120.0, 320.0)
                controlPoint1:CGPointMake(180.0,320.0)
                controlPoint2:CGPointMake(120.0,320.0)];
    [outPath2 closePath];
    
    [outPath2 addArcWithCenter:CGPointMake(currentPosition.x,currentPosition.y) radius:radius startAngle:0 endAngle:radians(360) clockwise:YES];
    ////[outPath2 addArcWithCenter:CGPointMake(180.0,350.0) radius:50.0 startAngle:0 endAngle:radians(360) clockwise:NO];
    [outPath2 closePath];
    [outPath2 addClip];
    outPath2.usesEvenOddFillRule = YES;
    
    [[UIColor blackColor] setFill];
    [outPath2 fill];
    
    
    CGContextScaleCTM(context, 1, -1);
	CGContextTranslateCTM(context, 0, -self.bounds.size.height);
    CGContextDrawImage(context, r,cgImage) ;
    
    
    
    
    
    //戻す
    CGContextRestoreGState(context);
    
    
    if (isPad) {
        
    } else {
        //iPhone用
        
    }
    
    
    

    

}


@end
