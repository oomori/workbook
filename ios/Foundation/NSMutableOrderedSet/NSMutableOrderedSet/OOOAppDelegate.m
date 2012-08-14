//
//  OOOAppDelegate.m
//  NSMutableOrderedSet
//
//  Created by 大森 智史 on 2012/08/11.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

#pragma mark NSMutableOrderedSet orderedSetWithArray:range:copyItems:
-(void)method001
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];

    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    
    [aOrderedSet addObject:aaa];
    [aOrderedSet addObject:bbb];
    [aOrderedSet addObject:ccc];
        
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"ggg"]) {
            *stop = YES;
        }
    }];
    //=>0x6870070 aaa
    //=>0x686ffc0 bbb
    //=>0x6870000 ccc
}

#pragma mark NSMutableOrderedSet addObject:
-(void)method002
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    
    [aOrderedSet addObject:aaa];
    [aOrderedSet addObject:bbb];
    [aOrderedSet addObject:ccc];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"ggg"]) {
            *stop = YES;
        }
    }];
    //=>0x6870070 aaa
    //=>0x686ffc0 bbb
    //=>0x6870000 ccc
}

#pragma mark NSMutableOrderedSet orderedSetWithObjects:count:
-(void)method003
{
    NSString *strings[5];
    strings[0]=@"Jan";
    strings[1]=@"Feb";
    strings[2]=@"Mar";
    strings[3]=@"Apr";
    strings[4]=@"May";
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithObjects:strings count:5];
        
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
    
    }];
    //=>0x6870070 aaa
    //=>0x686ffc0 bbb
    //=>0x6870000 ccc
}

#pragma mark NSMutableOrderedSet addObjectsFromArray:
-(void)method004
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    NSArray *anArray = [NSArray arrayWithObjects:aaa,bbb,ccc, nil];

    [aOrderedSet addObjectsFromArray:anArray];
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"ggg"]) {
            *stop = YES;
        }
    }];
    //=>
    //=>
    //=>
}

#pragma mark NSMutableOrderedSet addObjectsFromArray:
-(void)method005
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    NSArray *anArray = [NSArray arrayWithObjects:aaa,bbb,ccc, nil];
    
    [aOrderedSet addObjectsFromArray:anArray];
    
    [aOrderedSet insertObject:@"abc" atIndex:1];
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        
    }];
    //=>aaa
    //=>abc
    //=>bbb
    //=>ccc
}

#pragma mark NSMutableOrderedSet insertObjects:atIndexes:
-(void)method006
{
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc, nil];
    
    [aOrderedSet addObjectsFromArray:aArray];

    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    NSArray *bArray = [NSArray arrayWithObjects:ddd,eee,fff, nil];

    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2,3)];
    
    [aOrderedSet insertObjects:bArray atIndexes:indexSet];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        
    }];
    //=>aaa
    //=>bbb
    //=>ddd
    //=>eee
    //=>fff
    //=>ccc
}

#pragma mark NSMutableOrderedSet addObjectsFromArray:
-(void)method007
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    NSArray *anArray = [NSArray arrayWithObjects:aaa,bbb,ccc, nil];
    
    [aOrderedSet addObjectsFromArray:anArray];
    
    [aOrderedSet removeObject:@"bbb"];
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        
    }];
    //=>aaa
    //=>ccc
}

#pragma mark NSMutableOrderedSet addObjectsFromArray:
-(void)method008
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    NSArray *anArray = [NSArray arrayWithObjects:aaa,bbb,ccc, nil];
    
    [aOrderedSet addObjectsFromArray:anArray];
    
    [aOrderedSet removeObjectAtIndex:0];
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        
    }];
    //=>bbb
    //=>ccc
}

#pragma mark NSMutableOrderedSet addObjectsFromArray:
-(void)method009
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    NSArray *anArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    
    [aOrderedSet addObjectsFromArray:anArray];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2,3)];
    
    [aOrderedSet removeObjectsAtIndexes:indexSet];
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        
    }];
    //=>aaa
    //=>bbb
    //=>fff
}

#pragma mark NSMutableOrderedSet addObjectsFromArray:
-(void)method010
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    NSArray *anArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    
    [aOrderedSet addObjectsFromArray:anArray];
    
    NSArray *bArray = [NSArray arrayWithObjects:@"aaa",bbb, nil];
    
    [aOrderedSet removeObjectsInArray:bArray];
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        
    }];
    //=>ccc
    //=>ddd
    //=>eee
    //=>fff
}

#pragma mark NSMutableOrderedSet addObjectsFromArray:
-(void)method011
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    NSArray *anArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    
    [aOrderedSet addObjectsFromArray:anArray];
    
    
    [aOrderedSet replaceObjectAtIndex:1 withObject:@"XXX"];
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        
    }];
    //=>ccc
    //=>ddd
    //=>eee
    //=>fff
}
#pragma mark NSMutableOrderedSet addObjectsFromArray:
-(void)method012
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    NSArray *anArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    
    NSMutableString *ggg = [NSMutableString stringWithString:@"ggg"];
    NSMutableString *hhh = [NSMutableString stringWithString:@"hhh"];
    NSMutableString *iii = [NSMutableString stringWithString:@"iii"];
    NSArray *bArray = [NSArray arrayWithObjects:ggg,hhh,iii, nil];
    
    [aOrderedSet addObjectsFromArray:anArray];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2,3)];
    
    [aOrderedSet replaceObjectsAtIndexes:indexSet withObjects:bArray];
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        
    }];

}

#pragma mark NSMutableOrderedSet replaceObjectsInRange:withObjects:count:
-(void)method013
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    NSArray *anArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    
    [aOrderedSet addObjectsFromArray:anArray];
    
    NSString *strings[5];
    strings[0]=@"Jan";
    strings[1]=@"Feb";
    strings[2]=@"Mar";
    strings[3]=@"Apr";
    strings[4]=@"May";
    
    [aOrderedSet replaceObjectsInRange:NSMakeRange(0, 2) withObjects:strings count:3];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
    }];
    //=>Jan
    //=>Feb
    //=>Mar
    //=>ccc
    //=>ddd
    //=>eee
    //=>fff
    
}

#pragma mark NSMutableOrderedSet setObject:atIndex:
-(void)method014
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    NSArray *anArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];

    [aOrderedSet addObjectsFromArray:anArray];
    
    [aOrderedSet setObject:@"XXX" atIndex:3];
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        
    }];
    
}

#pragma mark NSMutableOrderedSet addObjectsFromArray:
-(void)method015
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    NSArray *anArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    
    [aOrderedSet addObjectsFromArray:anArray];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2,2)];
    [aOrderedSet moveObjectsAtIndexes:indexSet toIndex:3];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
    }];
    //=>aaa
    //=>bbb
    //=>eee
    //=>ccc
    //=>ddd
    //=>fff
    
    
}

#pragma mark NSMutableOrderedSet moveObjectsAtIndexes:toIndex:　その2
-(void)method016
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    NSArray *anArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    
    [aOrderedSet addObjectsFromArray:anArray];
    
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    [indexSet addIndex:1];
    [indexSet addIndex:3];
    [aOrderedSet moveObjectsAtIndexes:indexSet toIndex:3];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
    }];
    //=>aaa
    //=>ccc
    //=>eee
    //=>bbb
    //=>ddd
    //=>fff
}

#pragma mark NSMutableOrderedSet exchangeObjectAtIndex:withObjectAtIndex:

-(void)method017
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    NSArray *anArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd, nil];
    
    [aOrderedSet addObjectsFromArray:anArray];
    
    [aOrderedSet exchangeObjectAtIndex:1 withObjectAtIndex:3];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
    }];
    //=>aaa
    //=>ddd
    //=>ccc
    //=>bbb
}

#pragma mark NSMutableOrderedSet sortedArrayUsingComparator:
-(void)method018
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"aaa"];
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    NSArray *anArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd, nil];
    
    [aOrderedSet addObjectsFromArray:anArray];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
    }];
    //=>ccc
    //=>bbb
    //=>ddd
    //=>aaa
    
    [aOrderedSet sortedArrayUsingComparator:^(id obj1, id obj2) {
        return (NSComparisonResult)[obj1 compare:obj2];
    }];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
    }];
    //=>aaa
    //=>bbb
    //=>ccc
    //=>ddd
}

#pragma mark NSMutableOrderedSet sortWithOptions:usingComparator:
-(void)method019
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"aaa"];
    
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    NSArray *anArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd, nil];
    
    [aOrderedSet addObjectsFromArray:anArray];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
    }];
    //=>ccc
    //=>bbb
    //=>ddd
    //=>aaa
    
    [aOrderedSet sortWithOptions:NSSortConcurrent usingComparator:^(id obj1, id obj2) {
        return (NSComparisonResult)[obj1 compare:obj2];
    }];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
    }];
    //=>aaa
    //=>bbb
    //=>ccc
    //=>ddd
}

#pragma mark NSMutableOrderedSet intersectOrderedSet:
-(void)method020
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    [aOrderedSet addObjectsFromArray:aArray];
    
    NSMutableString *ggg = [NSMutableString stringWithString:@"eee"];
    NSMutableString *hhh = [NSMutableString stringWithString:@"fff"];
    NSMutableString *iii = [NSMutableString stringWithString:@"ggg"];
    NSArray *bArray = [NSArray arrayWithObjects:ggg,hhh,iii, nil];
    NSMutableOrderedSet *bOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    [bOrderedSet addObjectsFromArray:bArray];

    [aOrderedSet intersectOrderedSet:bOrderedSet];
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        
    }];
}

#pragma mark NSMutableOrderedSet intersectSet:
-(void)method021
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    [aOrderedSet addObjectsFromArray:aArray];
    
    NSMutableString *ggg = [NSMutableString stringWithString:@"eee"];
    NSMutableString *hhh = [NSMutableString stringWithString:@"fff"];
    NSMutableString *iii = [NSMutableString stringWithString:@"ggg"];
    NSArray *bArray = [NSArray arrayWithObjects:ggg,hhh,iii, nil];
    NSSet *bOrderedSet = [NSSet setWithArray:bArray];
    
    [aOrderedSet intersectSet:bOrderedSet];
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        
    }];
}

#pragma mark NSMutableOrderedSet minusOrderedSet:
-(void)method022
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    [aOrderedSet addObjectsFromArray:aArray];
    
    NSMutableString *ggg = [NSMutableString stringWithString:@"eee"];
    NSMutableString *hhh = [NSMutableString stringWithString:@"fff"];
    NSMutableString *iii = [NSMutableString stringWithString:@"ggg"];
    NSArray *bArray = [NSArray arrayWithObjects:ggg,hhh,iii, nil];
    NSMutableOrderedSet *bOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    [bOrderedSet addObjectsFromArray:bArray];
    
    [aOrderedSet minusOrderedSet:bOrderedSet];
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        
    }];
}

#pragma mark NSMutableOrderedSet minusSet:
-(void)method023
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    [aOrderedSet addObjectsFromArray:aArray];
    
    NSMutableString *ggg = [NSMutableString stringWithString:@"eee"];
    NSMutableString *hhh = [NSMutableString stringWithString:@"fff"];
    NSMutableString *iii = [NSMutableString stringWithString:@"ggg"];
    NSArray *bArray = [NSArray arrayWithObjects:ggg,hhh,iii, nil];
    NSSet *bOrderedSet = [NSSet setWithArray:bArray];
    
    [aOrderedSet minusSet:bOrderedSet];
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        
    }];
}


#pragma mark NSMutableOrderedSet unionOrderedSet:
-(void)method024
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    [aOrderedSet addObjectsFromArray:aArray];
    
    NSMutableString *ggg = [NSMutableString stringWithString:@"eee"];
    NSMutableString *hhh = [NSMutableString stringWithString:@"fff"];
    NSMutableString *iii = [NSMutableString stringWithString:@"ggg"];
    NSArray *bArray = [NSArray arrayWithObjects:ggg,hhh,iii, nil];
    NSMutableOrderedSet *bOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    [bOrderedSet addObjectsFromArray:bArray];
    
    [aOrderedSet unionOrderedSet:bOrderedSet];
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        
    }];
}

#pragma mark NSMutableOrderedSet unionSet:
-(void)method025
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSMutableOrderedSet *aOrderedSet = [NSMutableOrderedSet orderedSetWithCapacity:10];
    [aOrderedSet addObjectsFromArray:aArray];
    
    NSMutableString *ggg = [NSMutableString stringWithString:@"eee"];
    NSMutableString *hhh = [NSMutableString stringWithString:@"fff"];
    NSMutableString *iii = [NSMutableString stringWithString:@"ggg"];
    NSArray *bArray = [NSArray arrayWithObjects:ggg,hhh,iii, nil];
    NSSet *bOrderedSet = [NSSet setWithArray:bArray];
    
    [aOrderedSet unionSet:bOrderedSet];
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        
    }];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self method001];
    [self method002];
    [self method003];
    [self method004];
    [self method005];
    [self method006];
    [self method007];
    [self method008];
    [self method009];
    [self method010];
    [self method011];
    [self method012];
    [self method013];
    [self method014];
    [self method015];
    [self method016];
    [self method017];
    [self method018];
    [self method019];
    [self method020];
    [self method021];
    
    [self method022];
    [self method023];
    
    [self method024];
    
    [self method025];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
