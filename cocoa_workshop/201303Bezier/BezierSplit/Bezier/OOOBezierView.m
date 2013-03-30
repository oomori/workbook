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
     
        

    }
    return self;
}

-(void) timerControl:(NSTimer *)aTimer
{
    //if (currentPosition.y>0){
    [self setNeedsDisplay];
        timer = [NSTimer scheduledTimerWithTimeInterval:0.01
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
             NSLog(@"hitTest %d",hitTest);
             
             
             
             
             
             
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
         OOOPathObject *pathObj = [pathObjects objectAtIndex:0];
         OOOPointObject *pointObj = [pathObj.pointArray objectAtIndex:0];
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
             NSLog(@"hitTest %d",hitTest);
             
             
             
             
             
             
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
         OOOPathObject *pathObj = [pathObjects objectAtIndex:0];
         OOOPointObject *pointObj = [pathObj.pointArray objectAtIndex:0];
         pointObj.startPoint = CGPointMake(pointObj.startPoint.x,pointObj.startPoint.y);
         //pathObj.startPoint = CGPointMake(pointObj.startPoint.x+currentPosition.x,pointObj.startPoint.y+currentPosition.y);
         
         [self setNeedsDisplay];
         
         double x1 = pointObj.startPoint.x;
         double cp1x = pointObj.startPoint.x+pointObj.p1Offset.x;
         double cp2x = pointObj.endPoint.x+pointObj.p2Offset.x;
         double x2 = pointObj.endPoint.x;
         double y1 = pointObj.startPoint.y;
         double cp1y = pointObj.startPoint.y+pointObj.p1Offset.y;
         double cp2y = pointObj.endPoint.y+pointObj.p2Offset.y;
         double y2 = pointObj.endPoint.y;
         double t1 = 0.0;
         double t2 = t;
         double t1p = 1-t1;
         double t2p = 1-t2;
         double newx1 = t1p*t1p*t1p*x1 + 3*t1*t1p*t1p*cp1x + 3*t1*t1*t1p*cp2x + t1*t1*t1*x2;
         double newy1 = t1p*t1p*t1p*y1 + 3*t1*t1p*t1p*cp1y + 3*t1*t1*t1p*cp2y + t1*t1*t1*y2;
         double newcp1x = t1p*t1p*(t2p*x1+t2*cp1x) + 2*t1p*t1*(t2p*cp1x+t2*cp2x) + t1*t1*(t2p*cp2x+t2*x2);
         double newcp1y = t1p*t1p*(t2p*y1+t2*cp1y) + 2*t1p*t1*(t2p*cp1y+t2*cp2y) + t1*t1*(t2p*cp2y+t2*y2);
         double newcp2x = t2p*t2p*(t1p*x1+t1*cp1x) + 2*t2p*t2*(t1p*cp1x+t1*cp2x) + t2*t2*(t1p*cp2x+t1*x2);
         double newcp2y = t2p*t2p*(t1p*y1+t1*cp1y) + 2*t2p*t2*(t1p*cp1y+t1*cp2y) + t2*t2*(t1p*cp2y+t1*y2);
         double newx2 = t2p*t2p*t2p*x1 + 3*t2*t2p*t2p*cp1x + 3*t2*t2*t2p*cp2x + t2*t2*t2*x2;
         double newy2 = t2p*t2p*t2p*y1 + 3*t2*t2p*t2p*cp1y + 3*t2*t2*t2p*cp2y + t2*t2*t2*y2;
         
         NSLog(@"%.2f",newx1);
         splitPoint1 = CGPointMake(newx1, newy1);
         splitPoint2 = CGPointMake(newx2, newy2);
         splitControlPoint1 =  CGPointMake(newcp1x, newcp1y);
         splitControlPoint2 =  CGPointMake(newcp2x, newcp2y);
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
            
            
            
            
            UIBezierPath *pointPath3 = [UIBezierPath bezierPath];
            [pointPath3 addArcWithCenter:CGPointMake(splitPoint1.x,splitPoint1.y) radius:10.0 startAngle:0 endAngle:radians(360) clockwise:YES];
            [[UIColor darkGrayColor] setFill];
            [pointPath3 fill];

            UIBezierPath *pointPath4 = [UIBezierPath bezierPath];
            [pointPath4 addArcWithCenter:CGPointMake(splitPoint2.x,splitPoint2.y) radius:10.0 startAngle:0 endAngle:radians(360) clockwise:YES];
            [[UIColor darkGrayColor] setFill];
            [pointPath4 fill];
            
            
            UIBezierPath *pointPath7 = [UIBezierPath bezierPath];
            [pointPath7 moveToPoint:CGPointMake(splitPoint1.x,splitPoint1.y)];
            [pointPath7 addLineToPoint:CGPointMake(splitControlPoint1.x,splitControlPoint1.y)];
            [pointPath7 setLineWidth:2.0];
            [[UIColor lightGrayColor] setStroke];
            [pointPath7 stroke];
            
            UIBezierPath *pointPath8 = [UIBezierPath bezierPath];
            [pointPath8 moveToPoint:CGPointMake(splitPoint2.x,splitPoint2.y)];
            [pointPath8 addLineToPoint:CGPointMake(splitControlPoint2.x,splitControlPoint2.y)];
            [pointPath8 setLineWidth:2.0];
            [[UIColor lightGrayColor] setStroke];
            [pointPath8 stroke];
            
            UIBezierPath *pointPath5 = [UIBezierPath bezierPath];
            [pointPath5 addArcWithCenter:CGPointMake(splitControlPoint1.x,splitControlPoint1.y) radius:10.0 startAngle:0 endAngle:radians(360) clockwise:YES];
            [[UIColor lightGrayColor] setFill];
            [pointPath5 fill];
            
            UIBezierPath *pointPath6 = [UIBezierPath bezierPath];
            [pointPath6 addArcWithCenter:CGPointMake(splitControlPoint2.x,splitControlPoint2.y) radius:10.0 startAngle:0 endAngle:radians(360) clockwise:YES];
            [[UIColor lightGrayColor] setFill];
            [pointPath6 fill];
            
            

            UIBezierPath *newCurvePath = [UIBezierPath bezierPath];
            [newCurvePath moveToPoint:splitPoint1];
            [newCurvePath addCurveToPoint:splitPoint2
                           controlPoint1:splitControlPoint1
                           controlPoint2:splitControlPoint2
             ];
            [[UIColor orangeColor] setStroke];
            [newCurvePath setLineWidth:5.0];
            [newCurvePath stroke];
            
        }
//}
    
    [[UIColor lightGrayColor] setStroke];
    [currentPath setLineWidth:2.0];
    [currentPath stroke];
    
    

}


@end
