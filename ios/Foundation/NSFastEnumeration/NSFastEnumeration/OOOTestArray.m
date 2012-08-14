//
//  OOOTestFastEnumeration.m
//  NSFastEnumeration
//
//  Created by 大森 智史 on 2012/08/12.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOTestArray.h"

@implementation OOOTestArray

@synthesize name = mName;

- (id)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        mName = name ;
    }
    return self;
}

+ (OOOTestArray *)objWithName:(NSString *)name {
    return [[OOOTestArray alloc] initWithName:name] ;
}

@end


@implementation OOOStack

- (id)init {
    self = [super init];
    if (self) {
        mObjects = [[NSMutableArray alloc] init];
    }
    return self;
}



- (int)length {
    return [mObjects count];
}

- (OOOTestArray *)objAt:(int) index {
    return [mObjects objectAtIndex:index];
}

- (void)appendObj:(OOOTestArray *)book {
    [mObjects addObject:book];
}



- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained []) stackbuf count:(NSUInteger)len
{
    int count = 0;
    while(state->state < self.length && count < len) {
        stackbuf[count++] = [self objAt:state->state++];
    }
    state->itemsPtr = stackbuf;
    state->mutationsPtr = &state->extra[0];
    
    NSLog(@"%s %d",__FUNCTION__,count);
    return count;
}



@end