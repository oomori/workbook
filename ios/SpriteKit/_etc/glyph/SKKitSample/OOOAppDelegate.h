//
//  OOOAppDelegate.h
//  SKKitSample
//
//  Created by air on 2014/02/15.
//  Copyright (c) 2014年 oomori. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "OOOBezierView.h"
#import "OOOPathObject.h"
#import "OOOPointObject.h"

@interface OOOAppDelegate : UIResponder <UIApplicationDelegate>
{
    NSMutableArray *pathObjects;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableArray *pathObjects;

@end
