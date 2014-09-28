//
//  OOOBezierView.m
//  Bezier
//
//  Created by 大森 智史 on 2013/03/03.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import "OOOBezierView.h"
#import "OOOPathObject.h"

#import <CoreText/CoreText.h>

//PIを3.14...と定義
#define PI 3.14159265358979323846

//関数定義degrees*PI/180がradians
static inline double radians(double degrees) { return degrees * PI / 180; }
//関数定義radians/PI*180がdegrees
static inline double degrees(double radians) { return radians / PI * 180; }

@implementation OOOBezierView
CGPoint getPointCB(t,x1,y1,x2,y2,x3,y3,x4,y4) {

    CGFloat tp = (1-t);
    CGFloat x = t*t*t*x4 + 3*t*t*tp*x3 + 3*t*tp*tp*x2 + tp*tp*tp*x1;
    CGFloat y = t*t*t*y4 + 3*t*t*tp*y3 + 3*t*tp*tp*y2 + tp*tp*tp*y1;

    return CGPointMake(x, y);
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
     
        selectPointNumber = 0;

    }
    return self;
}

-(void) timerControl:(NSTimer *)aTimer
{
    //if (currentPosition.y>0){
    [self setNeedsDisplay];
        timer = [NSTimer scheduledTimerWithTimeInterval:0.02
                                                 target:		self
                                               selector:	@selector( timerControl: )
                                               userInfo:	nil
                                                repeats:	NO];
    
        t = t+0.01;
        //NSLog(@"%f",t);
        if (t>=1){
            t = 0;
            
        };
    
    //}
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    //どの指かタッチしたら
    __block NSInteger loopCount = 0;
    [[event allTouches] enumerateObjectsUsingBlock:^(id obj, BOOL *stop)
     {
         //NSLog(@"(%f,%f)",[obj locationInView:self].x,[obj locationInView:self].y);
         touchBegin = CGPointMake([obj locationInView:self].x,[obj locationInView:self].y);
         
         OOOAppDelegate *appDelegate = (OOOAppDelegate *)[[UIApplication sharedApplication] delegate];
         NSMutableArray *pathObjects = [appDelegate pathObjects];
         
         OOOPathObject *pathObj = [pathObjects objectAtIndex: loopCount ];
         for (OOOPointObject *pointObj in pathObj.pointArray) {

             UIBezierPath *p1Path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(pointObj.startPoint.x+pointObj.p1Offset.x,pointObj.startPoint.y+pointObj.p1Offset.y,3, 3)];
             [p1Path fill];
             
             int hitTest = 0;
             
             double bestDistance = 1000.0;
             for (int i = 0; i <=100; i++) {
                 //座標を求める
                 float ta = 0.01*(float)i;
                 float x1 = pointObj.startPoint.x;
                 float cp1x = pointObj.startPoint.x+pointObj.p1Offset.x;
                 float cp2x = pointObj.endPoint.x+pointObj.p2Offset.x;
                 float x2 = pointObj.endPoint.x;
                 float y1 = pointObj.startPoint.y;
                 float cp1y = pointObj.startPoint.y+pointObj.p1Offset.y;
                 float cp2y = pointObj.endPoint.y+pointObj.p2Offset.y;
                 float y2 = pointObj.endPoint.y;
                 
                 float tp = (1-ta);
                 CGFloat x = ta*ta*ta*x2 + 3*ta*ta*tp*cp2x + 3*ta*tp*tp*cp1x + tp*tp*tp*x1;
                 CGFloat y = ta*ta*ta*y2 + 3*ta*ta*tp*cp2y + 3*ta*tp*tp*cp1y + tp*tp*tp*y1;
                 
                 double d = sqrt(pow([obj locationInView:self].x-x,2)+pow([obj locationInView:self].y-y,2));
                 
                 
                 if (bestDistance > d){
                     //NSLog(@"%f,  %.2f,  %.2f,  %.2f,  %.2f",ta,x,y,d,bestDistance);
                     bestDistance = d;
                     hitTest = i;
                     hitPoint = CGPointMake(x, y);
                 }
             }
             //NSLog(@"hitTest %d",hitTest);
             
             
             
             
             
             
         }

                  
         
         
         
         loopCount++;
         *stop = YES;
         
         
     }];
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:		self
                                           selector:	@selector( timerControl: )
                                           userInfo:	nil
                                            repeats:	NO];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

    [[event allTouches] enumerateObjectsUsingBlock:^(id obj, BOOL *stop)
     {
         currentPosition = CGPointMake([obj locationInView:self].x,[obj locationInView:self].y);
         OOOAppDelegate *appDelegate = (OOOAppDelegate *)[[UIApplication sharedApplication] delegate];
         NSMutableArray *pathObjects = [appDelegate pathObjects];
         
         //一つ目の場所移動
         OOOPathObject *pathObj = [pathObjects objectAtIndex: selectPointNumber ];
         OOOPointObject *pointObj = [pathObj.pointArray objectAtIndex: selectPointNumber ];
         pointObj.startPoint = CGPointMake([obj locationInView:self].x,[obj locationInView:self].y);
         pathObj.startPoint = CGPointMake([obj locationInView:self].x,[obj locationInView:self].y);
         
         
         for (OOOPointObject *pointObj in pathObj.pointArray) {
             //NSLog(@"OOOPathObject %d ,%.2f,%.2f",loopCount,pathObj.startPoint.x,pathObj.startPoint.y);
             
             
             
             UIBezierPath *p1Path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(pointObj.startPoint.x+pointObj.p1Offset.x,pointObj.startPoint.y+pointObj.p1Offset.y,3, 3)];
             [p1Path fill];
             
             int hitTest = 0;
             
             double bestDistance = 1000.0;
             for (int i = 0; i <=100; i++) {
                 //座標を求める
                 float ta = 0.01*(float)i;
                 float x1 = pointObj.startPoint.x;
                 float cp1x = pointObj.startPoint.x+pointObj.p1Offset.x;
                 float cp2x = pointObj.endPoint.x+pointObj.p2Offset.x;
                 float x2 = pointObj.endPoint.x;
                 float y1 = pointObj.startPoint.y;
                 float cp1y = pointObj.startPoint.y+pointObj.p1Offset.y;
                 float cp2y = pointObj.endPoint.y+pointObj.p2Offset.y;
                 float y2 = pointObj.endPoint.y;
                 
                 float tp = (1-ta);
                 CGFloat x = ta*ta*ta*x2 + 3*ta*ta*tp*cp2x + 3*ta*tp*tp*cp1x + tp*tp*tp*x1;
                 CGFloat y = ta*ta*ta*y2 + 3*ta*ta*tp*cp2y + 3*ta*tp*tp*cp1y + tp*tp*tp*y1;
                 
                 double d = sqrt(pow([obj locationInView:self].x-x,2)+pow([obj locationInView:self].y-y,2));
                 
                 
                 if (bestDistance > d){
                     //NSLog(@"%f,  %.2f,  %.2f,  %.2f,  %.2f",ta,x,y,d,bestDistance);
                     bestDistance = d;
                     hitTest = i;
                     hitPoint = CGPointMake(x, y);
                 }
             }
             //NSLog(@"hitTest %d",hitTest);
             
             
             
             
             
             
         }

         
         *stop = YES;
     }];
    [self setNeedsDisplay];
    
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[event allTouches] enumerateObjectsUsingBlock:^(id obj, BOOL *stop)
     {
         NSLog(@"(%f,%f)",[obj locationInView:self].x,[obj locationInView:self].y);
         touchBegin = CGPointMake([obj locationInView:self].x,[obj locationInView:self].y);
         
         OOOAppDelegate *appDelegate = (OOOAppDelegate *)[[UIApplication sharedApplication] delegate];
         NSMutableArray *pathObjects = [appDelegate pathObjects];

         //一つ目の場所移動
         OOOPathObject *pathObj = [pathObjects objectAtIndex: selectPointNumber ];
         OOOPointObject *pointObj = [pathObj.pointArray objectAtIndex: selectPointNumber ];
         pointObj.startPoint = CGPointMake(pointObj.startPoint.x,pointObj.startPoint.y);
         
         [self setNeedsDisplay];
         
         
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
    
    CGContextRef context = UIGraphicsGetCurrentContext();
	//コンテキストに線のカラーをセットします。
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect bounds = CGRectMake(10.0, 10.0, 300.0, 200.0);
    CGPathAddRect(path, NULL, bounds);
    
    //フォント
    CTFontRef font = CTFontCreateWithName(CFSTR("HiraKakuProN-W6"), 80, NULL);
    
    CFStringRef string = (CFStringRef)@"漢";
    
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
            
            //CGPoint *positions1= (CGPoint*)CTRunGetPositionsPtr(run);
            CGGlyph *glyphs1= (CGGlyph*)CTRunGetGlyphsPtr(run);
            if (glyphIndex == 0){
                
                //NSLog(@"    glyph:%4.0hu %4.4f , %4.4f",glyphs1[glyphIndex],positions1[glyphIndex].x,positions1[glyphIndex].y);
                
                //グリフのパスを得るには
                CGPathRef thePath = CTFontCreatePathForGlyph(font, *glyphs1, NULL);
                glyphBezierPath = [UIBezierPath bezierPath];
                [glyphBezierPath moveToPoint:currentPosition];
                [glyphBezierPath appendPath:[UIBezierPath bezierPathWithCGPath:thePath]];
                CGPathRelease(thePath);
                
                //NSLog(@"%@",[glyphBezierPath description]);
                
            }
            
            
            //CGContextShowGlyphsAtPositions(context, CTRunGetGlyphsPtr(run), CTRunGetPositionsPtr(run), CTRunGetGlyphCount(run));
            
            
        }
    }
    
    
    
    
    
    
    
    
    BOOL isPad = [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPad;
    
    if (isPad) {
        
    } else {
        //iPhone用
        
    }
    OOOAppDelegate *appDelegate = (OOOAppDelegate *)[[UIApplication sharedApplication] delegate];
    NSMutableArray *pathObjects = [appDelegate pathObjects];

    
    UIBezierPath *currentPath = [UIBezierPath bezierPath];
    
    //for (OOOPathObject *pathObj in pathObjects) {
      
        OOOPathObject *pathObj = [pathObjects objectAtIndex:0];
        [currentPath moveToPoint:CGPointMake(pathObj.startPoint.x,pathObj.startPoint.y)];
        
        for (OOOPointObject *pointObj in pathObj.pointArray) {
            //OOOPointObject *pointObj = [pathObj.pointArray objectAtIndex:0];
            [currentPath addCurveToPoint:pointObj.endPoint// CGPointMake(100,200)
                           controlPoint1:CGPointMake(pointObj.startPoint.x+pointObj.p1Offset.x,pointObj.startPoint.y+pointObj.p1Offset.y)
                           controlPoint2:CGPointMake(pointObj.endPoint.x+pointObj.p2Offset.x,pointObj.endPoint.y+pointObj.p2Offset.y)];
            
            UIBezierPath *p1Path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(pointObj.startPoint.x+pointObj.p1Offset.x,pointObj.startPoint.y+pointObj.p1Offset.y,3, 3)];
            [p1Path fill];
            UIBezierPath *p2Path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(pointObj.endPoint.x+pointObj.p2Offset.x,pointObj.endPoint.y+pointObj.p2Offset.y,3, 3)];
            [p2Path fill];
            
            //座標を求める
            float x1 = pointObj.startPoint.x;
            float cp1x = pointObj.startPoint.x+pointObj.p1Offset.x;
            float cp2x = pointObj.endPoint.x+pointObj.p2Offset.x;
            float x2 = pointObj.endPoint.x;
            float y1 = pointObj.startPoint.y;
            float cp1y = pointObj.startPoint.y+pointObj.p1Offset.y;
            float cp2y = pointObj.endPoint.y+pointObj.p2Offset.y;
            float y2 = pointObj.endPoint.y;
            
            float tp = (1-t);
            CGFloat x = t*t*t*x2 + 3*t*t*tp*cp2x + 3*t*tp*tp*cp1x + tp*tp*tp*x1;
            CGFloat y = t*t*t*y2 + 3*t*t*tp*cp2y + 3*t*tp*tp*cp1y + tp*tp*tp*y1;
            //NSLog(@"(%.2f,%.2f)",x,y);
            
            UIBezierPath *pointPath = [UIBezierPath bezierPath];
            
            //[pointPath addArcWithCenter:CGPointMake(x4,y4) radius:20.0 startAngle:0 endAngle:radians(360) clockwise:YES];
            [pointPath addArcWithCenter:CGPointMake(x,y) radius:20.0 startAngle:0 endAngle:radians(360) clockwise:YES];
            [[UIColor greenColor] setFill];
            [pointPath fill];
            
            
            UIBezierPath *pointPath2 = [UIBezierPath bezierPath];
            
            //[pointPath addArcWithCenter:CGPointMake(x4,y4) radius:20.0 startAngle:0 endAngle:radians(360) clockwise:YES];
            [pointPath2 addArcWithCenter:CGPointMake(hitPoint.x,hitPoint.y) radius:20.0 startAngle:0 endAngle:radians(360) clockwise:YES];
            [[UIColor greenColor] setFill];
            [pointPath2 fill];
            
            
            //微分して接線の角度を求める
            CGFloat dx = 3*(t*t*(x2-cp2x)+2*t*tp*(cp2x-cp1x)+tp*tp*(cp1x-x1));
            CGFloat dy = 3*(t*t*(y2-cp2y)+2*t*tp*(cp2y-cp1y)+tp*tp*(cp1y-y1));
            
            //NSLog(@"%.2f,(%.2f,%.2f)",degrees(atan2(dy,dx)),dx,dy);
            
            
            double theX = cos(atan2(dy,dx))*50;
            double theY = sin(atan2(dy,dx))*50;
            //NSLog(@"(%.2f,%.2f)",theX,theY);
            UIBezierPath *linePath = [UIBezierPath bezierPath];
            [linePath moveToPoint:CGPointMake(x-theX,y-theY)];
            [linePath addLineToPoint:CGPointMake(x+theX, y+theY)];
            [linePath setLineWidth:2.0];
            [[UIColor redColor] setStroke];
            [linePath stroke];
            
            
            UIBezierPath *nearPath = [UIBezierPath bezierPath];
            [nearPath moveToPoint:CGPointMake(currentPosition.x,currentPosition.y)];
            [nearPath addLineToPoint:CGPointMake(hitPoint.x,hitPoint.y)];
            [nearPath setLineWidth:2.0];
            [[UIColor blueColor] setStroke];
            [nearPath stroke];
            
            //CGAffineTransform affine = CGAffineTransformMakeRotation((-1)*atan2(dy,dx));
            
            CGAffineTransform affine = CGAffineTransformMakeTranslation(x,y);
            affine = CGAffineTransformRotate(affine, atan2(dy,dx));
            
            [glyphBezierPath applyTransform:affine];
            [[UIColor blueColor] setStroke];
            [glyphBezierPath setLineWidth:3.0];
            [glyphBezierPath stroke];
            
            NSLog(@"glyphBezierPath %.2f,%.2f",glyphBezierPath.currentPoint.x,glyphBezierPath.currentPoint.y);
            
            //状態保存
            CGContextSaveGState(context);
            //上下反転
            CGContextScaleCTM(context, 1, -1);
            //反転したのでRect分上に移動
            CGContextTranslateCTM(context, 0, -self.bounds.size.height);
            
            CGContextSetTextMatrix(context, CGAffineTransformMakeRotation((-1)*atan2(dy,dx)));
            CGContextSetTextPosition(context, x, 1000-y);
            CTLineDraw(line, context);
            
            
            CFRelease(font);
            
            // 後片付け
            CFRelease(line);
            //CFRelease(affine);
            //戻す
            CGContextRestoreGState(context);
            
        }
//}
    
    [[UIColor blackColor] setStroke];
    [currentPath setLineWidth:2.0];
    [currentPath stroke];
    
    
    
    
    


}


@end
