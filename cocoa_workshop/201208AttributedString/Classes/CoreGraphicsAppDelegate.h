//
//  CoreGraphicsAppDelegate.h
//  CoreGraphics
//
//  Created by 大森 智史 on 10/11/23.
//  Copyright 2010 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreGraphicsViewController;

@interface CoreGraphicsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CoreGraphicsViewController *viewController;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet CoreGraphicsViewController *viewController;

@end

