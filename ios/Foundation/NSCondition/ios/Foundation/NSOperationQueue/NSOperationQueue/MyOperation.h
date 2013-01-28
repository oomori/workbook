//
//  MyOperation.h
//  NSOperation
//
//  Created by 大森 智史 on 12/05/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyOperation : NSOperation
{
    NSString *string;
    BOOL finished;
    BOOL executing;
}

@property(strong) NSString *string;
@property(assign) BOOL finished;
@property(assign) BOOL executing;

@end
