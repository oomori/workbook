//
//  MyString.h
//  NSKeyedArchiver
//
//  Created by 大森 智史 on 2012/09/09.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyString : NSMutableString
{
    NSString *string;
}
- (id)initWithCoder:(NSCoder *)decoder;
- (void)encodeWithCoder:(NSCoder *)encoder;
@end
