//
//  OOOPointObject.h
//  Bezier
//
//  Created by 大森 智史 on 2013/03/03.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OOOPointObject : NSObject
{
    CGPoint startPoint;
    CGPoint endPoint;
    //CGPoint p1;
    //CGPoint p2;
    CGPoint p1Offset;
    CGPoint p2Offset;
}
@property () CGPoint startPoint;
@property () CGPoint endPoint;
@property () CGPoint p1Offset;
@property () CGPoint p2Offset;
@end
