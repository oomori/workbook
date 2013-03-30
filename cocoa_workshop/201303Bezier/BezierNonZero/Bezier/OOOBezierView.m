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
        timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                 target:		self
                                               selector:	@selector( timerControl: )
                                               userInfo:	nil
                                                repeats:	NO];
    
    currentPosition.y = currentPosition.y-10;
        if (currentPosition.y>0){currentPosition.y = 0;};
    
    }
    
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
//         UIBezierPath *currentPath = [UIBezierPath bezierPath];
         
         OOOPathObject *pathObj = [pathObjects objectAtIndex: loopCount ];
         
         for (OOOPointObject *pointObj in pathObj.pointArray) {
             NSLog(@"OOOPathObject %d ,%.2f,%.2f",loopCount,pathObj.startPoint.x,pathObj.startPoint.y);
         }
         
         
         loopCount++;
         //*stop = YES;
     }];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

    [[event allTouches] enumerateObjectsUsingBlock:^(id obj, BOOL *stop)
     {
         //NSLog(@"(%f,%f)",[obj locationInView:self].x-touchBegin.x,[obj locationInView:self].y-touchBegin.y);
         //currentPosition = CGPointMake([obj locationInView:self].x-touchBegin.x,[obj locationInView:self].y-touchBegin.y);
         
         OOOAppDelegate *appDelegate = (OOOAppDelegate *)[[UIApplication sharedApplication] delegate];
         NSMutableArray *pathObjects = [appDelegate pathObjects];
         OOOPathObject *pathObj = [pathObjects objectAtIndex:0];
         OOOPointObject *pointObj = [pathObj.pointArray objectAtIndex:0];
         pointObj.startPoint = CGPointMake([obj locationInView:self].x,[obj locationInView:self].y);
         pathObj.startPoint = CGPointMake([obj locationInView:self].x,[obj locationInView:self].y);
         
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
         OOOPathObject *pathObj = [pathObjects objectAtIndex:0];
         OOOPointObject *pointObj = [pathObj.pointArray objectAtIndex:0];
         pointObj.startPoint = CGPointMake(pointObj.startPoint.x,pointObj.startPoint.y);
         //pathObj.startPoint = CGPointMake(pointObj.startPoint.x+currentPosition.x,pointObj.startPoint.y+currentPosition.y);
         
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
    
    if (isPad) {
        
    } else {
        //iPhone用
        
    }
    
    //バックグラウンドパス
    UIBezierPath *backPath = [UIBezierPath bezierPathWithRect:CGRectMake(50,50,300,600)];
    [[UIColor lightGrayColor] setFill];
    [backPath fill];
    
    //外側のパス
    UIBezierPath *outPath = [UIBezierPath bezierPath];
    
    [outPath moveToPoint:CGPointMake(100,100)];
    [outPath addCurveToPoint:CGPointMake(200.0, 100.0)
                           controlPoint1:CGPointMake(100.0,100.0)
                           controlPoint2:CGPointMake(200.0,100.0)];
    [outPath addCurveToPoint:CGPointMake(200.0, 200.0)
                   controlPoint1:CGPointMake(200.0,100.0)
                   controlPoint2:CGPointMake(200.0,200.0)];
    [outPath addCurveToPoint:CGPointMake(100.0, 200.0)
                   controlPoint1:CGPointMake(200.0,200.0)
                   controlPoint2:CGPointMake(100.0,200.0)];
    [outPath addCurveToPoint:CGPointMake(100.0, 100.0)
                   controlPoint1:CGPointMake(100.0,200.0)
                   controlPoint2:CGPointMake(100.0,200.0)];
    [outPath closePath];

    [outPath moveToPoint:CGPointMake(120,120)];
    [outPath addCurveToPoint:CGPointMake(180.0, 120.0)
               controlPoint1:CGPointMake(120.0,120.0)
               controlPoint2:CGPointMake(180.0,120.0)];
    [outPath addCurveToPoint:CGPointMake(180.0, 180.0)
               controlPoint1:CGPointMake(180.0,120.0)
               controlPoint2:CGPointMake(180.0,180.0)];
    [outPath addCurveToPoint:CGPointMake(120.0, 180.0)
               controlPoint1:CGPointMake(180.0,180.0)
               controlPoint2:CGPointMake(120.0,180.0)];
    [outPath addCurveToPoint:CGPointMake(120.0, 120.0)
               controlPoint1:CGPointMake(120.0,180.0)
               controlPoint2:CGPointMake(120.0,120.0)];

    [outPath closePath];
    
    outPath.usesEvenOddFillRule = NO;
    
    [[UIColor blackColor] setFill];
    [outPath fill];
    
    
    
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

    //[outPath2 addArcWithCenter:CGPointMake(180.0,350.0) radius:50.0 startAngle:0 endAngle:radians(360) clockwise:YES];
    ////[outPath2 addArcWithCenter:CGPointMake(180.0,350.0) radius:50.0 startAngle:0 endAngle:radians(360) clockwise:NO];
    //[outPath2 closePath];
    
    outPath2.usesEvenOddFillRule = NO;
    
    [[UIColor blackColor] setFill];
    [outPath2 fill];
    
    
    

}


@end
