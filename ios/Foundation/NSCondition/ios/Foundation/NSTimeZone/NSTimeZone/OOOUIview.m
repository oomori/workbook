//
//  OOOUIview.m
//  NSTimeZone
//
//  Created by 大森 智史 on 2012/08/16.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOUIview.h"

@implementation OOOUIview
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    
    
    NSLog(@"--%@",[NSTimeZone localTimeZone]);
    //--Local Time Zone (GMT (GMT) offset 0)
    //--Local Time Zone (GMT (GMT) offset 0)
    NSLog(@"--%@",[NSTimeZone systemTimeZone]);
    //--Asia/Tokyo (JST) offset 32400
    //--Asia/Seoul (KST) offset 32400
    
}
-(void)awakeFromNib
{
    
    
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
