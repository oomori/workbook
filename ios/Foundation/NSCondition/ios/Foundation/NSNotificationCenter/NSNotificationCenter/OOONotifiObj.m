//
//  OOONotifiObj.m
//  NSNotificationCenter
//
//  Created by 大森 智史 on 12/07/15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOONotifiObj.h"

@implementation OOONotifiObj
- (void)windowResize:(NSNotification *)notification
{
    NSLog(@"%s %@",__FUNCTION__,[notification description]);

    
    NSNotificationCenter *nCenter = [NSNotificationCenter defaultCenter];
    [nCenter removeObserver:self
                       name:UIKeyboardFrameBeginUserInfoKey
                     object:nil];
}
@end
