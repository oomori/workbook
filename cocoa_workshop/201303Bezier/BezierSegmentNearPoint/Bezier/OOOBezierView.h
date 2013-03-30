//
//  OOOBezierView.h
//  Bezier
//
//  Created by 大森 智史 on 2013/03/03.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OOOAppDelegate.h"

@interface OOOBezierView : UIView
{
    CGPoint touchBegin ;
    CGPoint currentPosition ;
    NSTimer *timer ;

    float t;
    CGPoint hitPoint;
    
}
@end
