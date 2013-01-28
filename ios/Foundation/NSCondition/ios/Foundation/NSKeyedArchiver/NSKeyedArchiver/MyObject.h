//
//  MyObject.h
//  NSObject
//
//  Created by 大森 智史 on 2012/09/01.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyObject : NSObject <NSCopying,NSCoding,NSDiscardableContent>
{
    NSString *string;
}
- (id)initWithString:(NSString *)aString;
- (id)initWithCoder:(NSCoder *)decoder;
- (void)encodeWithCoder:(NSCoder *)encoder;
- (NSString*)description;


@end
