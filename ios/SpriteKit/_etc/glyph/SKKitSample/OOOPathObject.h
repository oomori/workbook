//
//  OOOPathObject.h
//  Bezier
//
//  Created by 大森 智史 on 2013/03/03.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OOOPathObject : NSObject
{
    CGPoint startPoint;
    NSMutableArray *pointArray;
    BOOL selected;
    
}
@property () CGPoint startPoint;
@property (retain) NSMutableArray *pointArray;
@property (getter = isSelected, setter = setSelect:) BOOL selected;

@end
