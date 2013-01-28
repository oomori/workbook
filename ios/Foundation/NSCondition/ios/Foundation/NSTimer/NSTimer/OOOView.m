//
//  OOOView.m
//  NSTimer
//
//  Created by 大森 智史 on 2012/09/08.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOView.h"

@implementation OOOView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch* touch = [touches anyObject];
	CGPoint pt = [touch locationInView:self];
	printf("point = %lf,%lf\n", pt.x, pt.y);
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
	CGPoint pt = [touch locationInView:self];
	printf("point = %lf,%lf\n", pt.x, pt.y);
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
	CGPoint pt = [touch locationInView:self];
	printf("point = %lf,%lf\n", pt.x, pt.y);
}

@end
