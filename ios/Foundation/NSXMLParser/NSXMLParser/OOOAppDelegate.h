//
//  OOOAppDelegate.h
//  NSXMLParser
//
//  Created by 大森 智史 on 2012/09/02.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface OOOAppDelegate : UIResponder <UIApplicationDelegate,NSXMLParserDelegate,NSStreamDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSInputStream *inputStream;
@property (strong, nonatomic) NSOutputStream *outputStream;

@end
