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
         
         currentPosition = CGPointMake([obj locationInView:self].x,[obj locationInView:self].y);
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
         
         currentPosition = CGPointMake([obj locationInView:self].x,[obj locationInView:self].y);
         //yの変化量とxの変化量で角度を求める
         NSLog(@"angle =  %f",degrees(atan2(200.0-currentPosition.y,currentPosition.x-100)));//注意atanは(dy,dx)
         
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
        
    [outPath moveToPoint:CGPointMake(300,200)];
    [outPath addLineToPoint:CGPointMake(100.0,200.0)];
    [outPath addLineToPoint:CGPointMake(currentPosition.x,currentPosition.y)];

    [outPath setLineWidth:20.0];
    NSLog(@"%f",outPath.miterLimit);
    
    //outPath.miterLimit = 2.5;//60度
    outPath.miterLimit = 4.0;//30度
    //outPath.miterLimit = 5.0;//20度
    //outPath.miterLimit = 10.0;//10度
    //outPath.miterLimit = 20.0;//5度
    NSLog(@"%f",outPath.miterLimit);
    [[UIColor blackColor] setStroke];
    [outPath stroke];

    
    
    

}


@end
