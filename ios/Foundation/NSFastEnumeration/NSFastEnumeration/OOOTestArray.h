//
//  OOOTestFastEnumeration.h
//  NSFastEnumeration
//
//  Created by 大森 智史 on 2012/08/12.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OOOTestArray : NSObject{
@private
NSString *mName;
}

@property (readonly) NSString *name;
- (id)initWithName:(NSString *)name;
+ (OOOTestArray *)objWithName:(NSString *)name;

@end


@interface OOOStack : NSObject<NSFastEnumeration> {
@private
    NSMutableArray *mObjects;
}

@property (readonly) int length;
- (OOOTestArray *)objAt:(int) index;
- (void)appendObj:(OOOTestArray *)obj;

@end
