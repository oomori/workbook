//
//  OOOAppDelegate.h
//  NSStream
//
//  Created by 大森 智史 on 2012/09/02.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OOOPOP3.h"

@interface OOOAppDelegate : UIResponder <UIApplicationDelegate,NSStreamDelegate>
{
    
    OOOPOP3 *pop3Obj;	//POP3受信のためのクラス
    
    NSTimer *timer;
}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSInputStream *inputStream;
@property (strong, nonatomic) NSOutputStream *outputStream;

@property (strong, nonatomic) NSMutableData *recieveData;

-(void)method001;

@end