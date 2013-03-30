//
//  OOOBezierView.m
//  Bezier
//
//  Created by 大森 智史 on 2013/03/03.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import "OOOBezierView.h"

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
    
    currentPosition.y = currentPosition.y-5;
        if (currentPosition.y<0){currentPosition.y = 0;};
    
    }
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    //どの指かタッチしたら
    [[event allTouches] enumerateObjectsUsingBlock:^(id obj, BOOL *stop)
     {
         //NSLog(@"(%f,%f)",[obj locationInView:self].x,[obj locationInView:self].y);
         touchBegin = CGPointMake([obj locationInView:self].x,[obj locationInView:self].y);
         //currentPosition = touchBegin;
         *stop = YES;
     }];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

    [[event allTouches] enumerateObjectsUsingBlock:^(id obj, BOOL *stop)
     {
         //NSLog(@"(%f,%f)",[obj locationInView:self].x-touchBegin.x,[obj locationInView:self].y-touchBegin.y);
         currentPosition = CGPointMake([obj locationInView:self].x,[obj locationInView:self].y-touchBegin.y);
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
         *stop = YES;
     }];
    
    [self setNeedsDisplay];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.0
                                             target:		self
                                           selector:	@selector( timerControl: )
                                           userInfo:	nil
                                            repeats:	NO];
    
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

    //コントロールポイント
//    UIBezierPath *pointPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(200+100-(currentPosition.y/5),currentPosition.y+200-(currentPosition.y/3),3, 3)];
//    [pointPath fill];
//    
    //下の半円
    UIBezierPath *currentPath = [UIBezierPath bezierPath];
    [currentPath addArcWithCenter:CGPointMake(200,currentPosition.y+200) radius:100-(currentPosition.y/5) startAngle:radians(0) endAngle:radians(180) clockwise:YES];
    //左側のつなぎ
    [currentPath addCurveToPoint:CGPointMake(100,200)
                   controlPoint1:CGPointMake(100+(currentPosition.y/5),currentPosition.y+200-(currentPosition.y/3))
                   controlPoint2:CGPointMake(100,200+(currentPosition.y/5))];
    //上の半円
    [currentPath addArcWithCenter:CGPointMake(200,200) radius:100 startAngle:radians(180) endAngle:radians(0) clockwise:YES];
    
    //右側のつなぎ
    [currentPath addCurveToPoint:CGPointMake(200+100-(currentPosition.y/5),currentPosition.y+200)
                   controlPoint1:CGPointMake(200+100,200+(currentPosition.y/5))
                   controlPoint2:CGPointMake(200+100-(currentPosition.y/5),currentPosition.y+200-(currentPosition.y/3))];
    //パスを閉じる
    [currentPath closePath];
    
    //グレーで塗り
    [[UIColor lightGrayColor] setFill];
    [currentPath fill];
    //[currentPath stroke];
    
    
    

}


@end
