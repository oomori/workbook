//
//  OOOView.m
//  NSCalendar
//
//  Created by 大森 智史 on 2012/08/15.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOView.h"

@implementation OOOView
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{

    NSLog(@"--%@",[aCalendar calendarIdentifier]);
    
    //こちらは環境設定を変えたら自動的に反映される
    NSLog(@"--%@",[bCalendar calendarIdentifier]);

 }
-(void)awakeFromNib
{
    aCalendar = [NSCalendar currentCalendar];
    bCalendar = [NSCalendar autoupdatingCurrentCalendar];
    NSLog(@"--%@",[aCalendar calendarIdentifier]);
    NSLog(@"--%@",[bCalendar calendarIdentifier]);
    
    
}
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

@end
