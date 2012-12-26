//
//  OOOAppDelegate.h
//  NSJSONSerialization
//
//  Created by 大森 智史 on 2012/09/03.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OOOAppDelegate : UIResponder <UIApplicationDelegate,NSStreamDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSInputStream *inputStream;
@property (strong, nonatomic) NSOutputStream *outputStream;

@property (strong, nonatomic) NSMutableData *recieveData;


@end
