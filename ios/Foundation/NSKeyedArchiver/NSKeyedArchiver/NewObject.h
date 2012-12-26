//
//  NewObject.h
//  NSKeyedArchiver
//
//  Created by 大森 智史 on 2012/09/09.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewObject : NSObject <NSCopying,NSCoding,NSDiscardableContent>
{
    NSString *string;
}
- (id)initWithString:(NSString *)aString;
- (id)initWithCoder:(NSCoder *)decoder;
- (void)encodeWithCoder:(NSCoder *)encoder;
- (NSString*)description;
/*
 -(void)testMethod;
 -(void)messageWith:(NSString *)message;
 -(void)messageA;
 -(void)messageB;
 
 //NSDiscardableContent
 - (BOOL)beginContentAccess;
 - (void)endContentAccess;
 - (void)discardContentIfPossible;
 - (BOOL)isContentDiscarded;
 */
@end
