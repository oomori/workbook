//
//  OOOAppDelegate.h
//  Bezier
//
//  Created by 大森 智史 on 2013/03/03.
//  Copyright (c) 2013年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OOOBezierView.h"
#import "OOOPathObject.h"
#import "OOOPointObject.h"

@interface OOOAppDelegate : UIResponder <UIApplicationDelegate>
{
            NSMutableArray *pathObjects;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableArray *pathObjects;

@end
