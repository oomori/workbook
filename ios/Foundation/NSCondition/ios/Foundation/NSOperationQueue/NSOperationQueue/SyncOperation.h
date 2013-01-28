//
//  SyncOperation.h
//  NSOperation
//
//  Created by 大森 智史 on 2012/09/09.
//
//

#import <Foundation/Foundation.h>

@interface SyncOperation : NSOperation
{
    NSString *string;
    BOOL finished;
    BOOL executing;
}

@property(strong) NSString *string;
@property(assign) BOOL finished;
@property(assign) BOOL executing;

@end
