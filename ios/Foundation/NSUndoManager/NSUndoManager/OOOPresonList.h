//
//  OOOPresonList.h
//  NSUndoManager
//
//  Created by 大森 智史 on 2012/09/23.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OOOPresonList : NSObject
{
    NSMutableArray* _persons;
    
    NSUndoManager *undoManager;
    int i;
}
@property (nonatomic,retain) NSUndoManager *undoManager;
-(void)addATruck;
-(void)removeATruck;

- (void)addPersons:(NSArray*)persons;
- (void)removePersons:(NSArray*)persons;
@end
