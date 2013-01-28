//
//  OOOAppDelegate.m
//  NSOrderedSet
//
//  Created by 大森 智史 on 2012/08/05.
//  Copyright (c) 2012年 Satoshi Oomori. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

#pragma mark NSOrderedSet orderedSetWithArray:

-(void)method001
{
    NSArray *aArray = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d",@"a", nil];
    NSOrderedSet *aOrderedSet = [NSOrderedSet orderedSetWithArray:aArray];

    NSLog(@"%s a %@",__FUNCTION__,[aOrderedSet description]);
    //=>a {(a,b,c,d)}
}

#pragma mark NSOrderedSet orderedSetWithArray:range:copyItems:
-(void)method002
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSLog(@"%s %p %@",__FUNCTION__,aaa,aaa);
    NSLog(@"%s %p %@",__FUNCTION__,bbb,bbb);
    NSLog(@"%s %p %@",__FUNCTION__,ccc,ccc);
    //=>0x6e73fd0 aaa
    //=>0x6e736f0 bbb
    //=>0x6e73730 ccc
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc, nil];
    NSOrderedSet *aOrderedSet = [NSOrderedSet orderedSetWithArray:aArray range:NSMakeRange(0,3) copyItems:YES];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"ggg"]) {
            *stop = YES;
        }
    }];
    //=>0xb52bfe0 aaa
    //=>0xb52eb30 bbb
    //=>0xb52fb30 ccc
}

#pragma mark NSOrderedSet orderedSetWithObject:
-(void)method003
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSLog(@"%s %p %@",__FUNCTION__,aaa,aaa);
    //=>0x6b5e930 aaa

    NSOrderedSet *aOrderedSet = [NSOrderedSet orderedSetWithObject:aaa];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"ggg"]) {
            *stop = YES;
        }
    }];
    //=>0x6b5e930 aaa

}

#pragma mark NSOrderedSet orderedSetWithObjects:
-(void)method004
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSLog(@"%s %p %@",__FUNCTION__,aaa,aaa);
    NSLog(@"%s %p %@",__FUNCTION__,bbb,bbb);
    NSLog(@"%s %p %@",__FUNCTION__,ccc,ccc);
    //=>0xbd5c350 aaa
    //=>0xbd5c3e0 bbb
    //=>0xbd5c420 ccc
    
    NSOrderedSet *aOrderedSet = [NSOrderedSet orderedSetWithObjects:aaa,bbb,ccc, nil];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"ggg"]) {
            *stop = YES;
        }
    }];
    //=>0xbd5c350 aaa
    //=>0xbd5c3e0 bbb
    //=>0xbd5c420 ccc
    
}

#pragma mark NSOrderedSet orderedSetWithObjects:
-(void)method005
{
    NSString *strings[5];
    strings[0]=@"Jan";
    strings[1]=@"Feb";
    strings[2]=@"Mar";
    strings[3]=@"Apr";
    strings[4]=@"May";
    
    NSOrderedSet *aOrderedSet = [NSOrderedSet orderedSetWithObjects:strings count:5];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"ggg"]) {
            *stop = YES;
        }
    }];
    //=>0xbd5c350 aaa
    //=>0xbd5c3e0 bbb
    //=>0xbd5c420 ccc
    
}
#pragma mark NSOrderedSet orderedSetWithObjects:
-(void)method006
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];

    NSOrderedSet *aSet = [NSOrderedSet orderedSetWithObjects:aaa,bbb,ccc,nil];
    NSOrderedSet *aOrderedSet = [NSOrderedSet orderedSetWithOrderedSet:aSet];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"ggg"]) {
            *stop = YES;
        }
    }];
    //=>0xbd5c350 aaa
    //=>0xbd5c3e0 bbb
    //=>0xbd5c420 ccc
    
}

#pragma mark NSOrderedSet orderedSetWithObjects:
-(void)method007
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    
    NSSet *aSet = [NSSet setWithObjects:aaa,bbb,ccc,nil];
    NSOrderedSet *aOrderedSet = [NSOrderedSet orderedSetWithSet:aSet];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"ggg"]) {
            *stop = YES;
        }
    }];

    
}

#pragma mark NSOrderedSet orderedSetWithArray:range:copyItems:
-(void)method008
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSLog(@"%s %p %@",__FUNCTION__,aaa,aaa);
    NSLog(@"%s %p %@",__FUNCTION__,bbb,bbb);
    NSLog(@"%s %p %@",__FUNCTION__,ccc,ccc);
    //=>0x6e73fd0 aaa
    //=>0x6e736f0 bbb
    //=>0x6e73730 ccc
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc, nil];
    NSOrderedSet *aOrderedSet = [[NSOrderedSet alloc]  initWithArray:aArray range:NSMakeRange(0,3) copyItems:YES];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"ggg"]) {
            *stop = YES;
        }
    }];
    //=>0xb52bfe0 aaa
    //=>0xb52eb30 bbb
    //=>0xb52fb30 ccc
}

#pragma mark NSOrderedSet orderedSetWithObjects:
-(void)method009
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    
    NSOrderedSet *aOrderedSet = [[NSOrderedSet alloc]initWithObject:aaa];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"ggg"]) {
            *stop = YES;
        }
    }];
    
    
}
#pragma mark NSOrderedSet orderedSetWithObjects:
-(void)method010
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSNumber *ddd = [NSNumber numberWithInt:10];
    NSDate *eee = [NSDate date];
    NSValue *fff = [NSValue valueWithCGPoint:CGPointMake(10.0, 10.0)];
    NSSet *ggg = [NSSet setWithObjects:aaa,bbb,ccc,nil];
    NSData *hhh = [NSData data];
    
    NSOrderedSet *aOrderedSet = [[NSOrderedSet alloc]initWithObjects:aaa,bbb,ccc,ddd,eee,fff,ggg,hhh,nil];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
    }];
    
    
}

#pragma mark NSOrderedSet orderedSetWithObjects:
-(void)method011
{
    NSString *strings[5];
    strings[0]=@"Jan";
    strings[1]=@"Feb";
    strings[2]=@"Mar";
    strings[3]=@"Apr";
    strings[4]=@"May";
    
    NSOrderedSet *aOrderedSet = [[NSOrderedSet alloc] initWithObjects:strings count:5];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);

    }];
    //=>0xbd5c350 aaa
    //=>0xbd5c3e0 bbb
    //=>0xbd5c420 ccc
    
}

#pragma mark NSOrderedSet count
-(void)method012
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    
    NSSet *aSet = [NSSet setWithObjects:aaa,bbb,ccc,nil];
    NSOrderedSet *aOrderedSet = [NSOrderedSet orderedSetWithSet:aSet];
    
    NSLog(@"%s %d",__FUNCTION__, [aOrderedSet count]);
        
    
}

#pragma mark NSOrderedSet enumerateObjectsUsingBlock:
-(void)method013
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];

    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSOrderedSet *aOrderedSet = [[NSOrderedSet alloc]  initWithArray:aArray];
    
    [aOrderedSet enumerateObjectsUsingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"eee"]) {
            *stop = YES;
        }
    }];
    
    
}

#pragma mark NSOrderedSet enumerateObjectsUsingBlock:
-(void)method014
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSOrderedSet *aOrderedSet = [[NSOrderedSet alloc]  initWithArray:aArray];
    
    [aOrderedSet enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"eee"]) {
            *stop = YES;
        }
    }];
    
    
}

#pragma mark NSOrderedSet enumerateObjectsAtIndexes:options:usingBlock:
-(void)method015
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSOrderedSet *aOrderedSet = [[NSOrderedSet alloc]  initWithArray:aArray];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2,4)];
    
    [aOrderedSet enumerateObjectsAtIndexes:indexSet options:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"eee"]) {
            *stop = YES;
        }
    }];
    
    
}

#pragma mark NSOrderedSet objectEnumerator
-(void)method016
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSOrderedSet *anOrderedSet = [[NSOrderedSet alloc]  initWithArray:aArray];
    
    id obj;
    NSEnumerator *aEnumerator = [anOrderedSet objectEnumerator];
    while ((obj = [aEnumerator nextObject]) != nil) {
		NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
	}
}

#pragma mark indexOfObjectPassingTest:
-(void)method017
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSOrderedSet *anOrderedSet = [[NSOrderedSet alloc]  initWithArray:aArray];
    
    NSIndexSet *indexSet =[anOrderedSet indexesOfObjectsPassingTest:
                     ^ BOOL (id obj, NSUInteger idx, BOOL *stop)
                      {
                          if (idx > 4) {
                              return YES;
                              *stop = YES;
                          }
                          
                          if ([obj isEqualToString:@"bbb"]) {
                              return YES;
                          }else {
                              return NO;
                          }
                          
                      }];
    
    NSLog(@"%s %@",__FUNCTION__, [indexSet description]);
    
    
}

#pragma mark indexesOfObjectsWithOptions:passingTest:
-(void)method018
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSOrderedSet *anOrderedSet = [[NSOrderedSet alloc]  initWithArray:aArray];
    NSIndexSet *indexSet =
    [anOrderedSet indexesOfObjectsWithOptions:NSEnumerationReverse passingTest:^ BOOL (id obj, NSUInteger idx, BOOL *stop)
                           {
                               if (idx > 4) {
                                   return YES;
                                   *stop = YES;
                               }
                               
                               if ([obj isEqualToString:@"bbb"]) {
                                   return YES;
                               }else {
                                   return NO;
                               }
                               
                           }];
    
    NSLog(@"%s %@",__FUNCTION__, [indexSet description]);
    
    
}
#pragma mark indexOfObjectPassingTest:
-(void)method019
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSOrderedSet *anOrderedSet = [[NSOrderedSet alloc]  initWithArray:aArray];
    
    NSUInteger index =[anOrderedSet indexOfObjectPassingTest:
                           ^ BOOL (id obj, NSUInteger idx, BOOL *stop)
                           {
                               
                               if ([obj isEqualToString:@"ccc"]) {
                                   return YES;
                               }else {
                                   return NO;
                               }
                               
                           }];
    
    NSLog(@"%s %u",__FUNCTION__, index );
    
    
}

#pragma mark sortedArrayUsingComparator:
-(void)method020
{
    NSArray *anArray =
    [[NSArray alloc] initWithObjects:   @"aaa",@"bbb",@"ccc",
     @"ddd",@"eee",@"fff",
     @"ggg",@"hhh",@"iii",nil];
    NSOrderedSet *anOrderedSet = [[NSOrderedSet alloc]  initWithArray:anArray];
    NSRange aRange = NSMakeRange(0,[anOrderedSet count]-1);
    NSUInteger anInteger = [anOrderedSet indexOfObject:@"ddd" inSortedRange:aRange options:NSBinarySearchingFirstEqual usingComparator:^(id obj1,id obj2){
                                return [obj1 compare:obj2];
                            }];
    
    if (anInteger == NSNotFound) {
        NSLog(@"Not Found");
    }else {
        NSLog(@"%s %d",__FUNCTION__,anInteger);
    }
}

#pragma mark sortedArrayUsingComparator:
-(void)method021
{
    NSArray *anArray =
    [[NSArray alloc] initWithObjects:   @"ddd",@"hhh",@"iii",@"aaa",@"bbb",@"ddd",
     @"dea",@"eee",@"fff",
     nil];
    NSOrderedSet *anOrderedSet = [[NSOrderedSet alloc]  initWithArray:anArray];
    NSRange aRange = NSMakeRange(0,[anOrderedSet count]-1);
    NSUInteger anInteger = [anOrderedSet indexOfObject:@"des" inSortedRange:aRange options:NSBinarySearchingInsertionIndex usingComparator:^(id obj1,id obj2){
        return [obj1 compare:obj2];
    }];
    
    if (anInteger == NSNotFound) {
        NSLog(@"Not Found");
    }else {
        NSLog(@"%s %d",__FUNCTION__,anInteger);
    }
}

#pragma mark indexOfObject:
-(void)method022
{
    NSArray *anArray =
    [[NSArray alloc] initWithObjects:   @"aaa",@"bbb",@"ccc",
     @"ddd",@"eee",@"fff",
     @"ggg",@"hhh",@"iii",nil];
    NSOrderedSet *anOrderedSet = [[NSOrderedSet alloc]  initWithArray:anArray];
    NSUInteger anInteger = [anOrderedSet indexOfObject:@"ddd"];
    
    if (anInteger == NSNotFound) {
        NSLog(@"Not Found");
    }else {
        NSLog(@"%s %d",__FUNCTION__,anInteger);
    }
}

#pragma mark indexOfObject:
-(void)method023
{
    NSArray *anArray =
    [[NSArray alloc] initWithObjects:   @"aaa",@"bbb",@"ccc",
     @"ddd",@"eee",@"fff",
     @"ggg",@"hhh",@"iii",nil];
    NSOrderedSet *anOrderedSet = [[NSOrderedSet alloc]  initWithArray:anArray];
    
    if ([anOrderedSet containsObject:@"ddd"]) {
        NSLog(@"%s OK",__FUNCTION__);
    }else {
        NSLog(@"%s NG",__FUNCTION__);
    }
}

#pragma mark indexOfObject:
-(void)method024
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSOrderedSet *anOrderedSet = [[NSOrderedSet alloc]  initWithArray:aArray];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2,4)];
    NSOrderedSet *reversedOrderedSet = [anOrderedSet reversedOrderedSet];
    
    [reversedOrderedSet enumerateObjectsAtIndexes:indexSet options:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger  idx, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"eee"]) {
            *stop = YES;
        }
    }];

}


#pragma mark getObjects:range:
-(void)method025
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSOrderedSet *anOrderedSet = [[NSOrderedSet alloc]  initWithArray:aArray];
    
    NSRange range = NSMakeRange(0, [aArray count]);
    
    NSMutableData* data = [NSMutableData dataWithLength: sizeof(id) * [anOrderedSet count]];
    
    [anOrderedSet getObjects: (__unsafe_unretained id *)data.mutableBytes range:range];
    
    NSString* content = [[NSString alloc] initWithFormat: @"1: %@ 2: %@ 3: %@"  arguments: data.mutableBytes];
    
    NSLog(@"%@", content);
  
}


#pragma mark NSOrderedSet set
-(void)method026
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSOrderedSet *anOrderedSet = [[NSOrderedSet alloc]  initWithArray:aArray];
    
    NSSet *aSet = [anOrderedSet set];
    [aSet enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"eee"]) {
            *stop = YES;
        }
    }];
    
}

#pragma mark NSOrderedSet array
-(void)method027
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"fff"];
    
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSOrderedSet *anOrderedSet = [[NSOrderedSet alloc]  initWithArray:aArray];
    
    NSArray *bArray = [anOrderedSet array];
    [bArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx,BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
        if ([obj isEqualToString:@"eee"]) {
            *stop = YES;
        }
    }];
    
}

#pragma mark NSOrderedSet sortedArrayUsingComparator
-(void)method028
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"fff"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"aaa"];
    
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSOrderedSet *anOrderedSet = [[NSOrderedSet alloc]  initWithArray:aArray];
    
    NSArray *bArray = [anOrderedSet sortedArrayUsingComparator:^(id obj1,id obj2){
        return [obj1 compare:obj2];
    }];
    
    
    [bArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx,BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);

    }];
    
}

#pragma mark NSOrderedSet sortedArrayUsingComparator
-(void)method029
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"ddd"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"fff"];
    NSMutableString *ddd = [NSMutableString stringWithString:@"ccc"];
    NSMutableString *eee = [NSMutableString stringWithString:@"eee"];
    NSMutableString *fff = [NSMutableString stringWithString:@"aaa"];
    
    NSArray *aArray = [NSArray arrayWithObjects:aaa,bbb,ccc,ddd,eee,fff, nil];
    NSOrderedSet *anOrderedSet = [[NSOrderedSet alloc]  initWithArray:aArray];
    
    NSArray *bArray = [anOrderedSet sortedArrayWithOptions:NSSortConcurrent usingComparator:^(id obj1,id obj2){
        return [obj1 compare:obj2];
    }];
    
    
    [bArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx,BOOL *stop) {
        NSLog(@"%s %p %@",__FUNCTION__, obj ,obj);
        
    }];
    
}

#pragma mark NSOrderedSet isEqualToOrderedSet
-(void)method030
{
    NSOrderedSet *aOrderedSet = [NSOrderedSet orderedSetWithObjects:@"aaa",@"bbb",@"ccc",@"ddd",@"eee",@"fff", nil];
    
    NSOrderedSet *bOrderedSet = [NSOrderedSet orderedSetWithObjects:@"aaa",@"bbb",@"ccc",@"ddd",@"eee",@"fff", nil];
                                                                
    NSOrderedSet *cOrderedSet = [NSOrderedSet orderedSetWithObjects:@"aaa",@"bbb",@"ccc",@"ddd", nil];
    NSOrderedSet *dOrderedSet = [NSOrderedSet orderedSetWithObjects:@"abc",@"bbb",@"ccc",@"ddd",@"eee",@"fff", nil];

    NSLog(@"%s 1 %@",__FUNCTION__,([aOrderedSet isEqualToOrderedSet:bOrderedSet])?@"YES":@"NO");
    //=>YES
    NSLog(@"%s 2 %@",__FUNCTION__,([aOrderedSet isEqualToOrderedSet:cOrderedSet])?@"YES":@"NO");
    //=>NO
    NSLog(@"%s 3 %@",__FUNCTION__,([aOrderedSet isEqualToOrderedSet:dOrderedSet])?@"YES":@"NO");
    //=>NO
}

#pragma mark NSOrderedSet isEqualToOrderedSet
-(void)method031
{
    NSOrderedSet *aOrderedSet = [NSOrderedSet orderedSetWithObjects:@"aaa",@"bbb",@"ccc",@"ddd",@"eee",@"fff", nil];
    
    NSOrderedSet *bOrderedSet = [NSOrderedSet orderedSetWithObjects:@"ggg",@"hhh",@"iii",@"jjj",@"kkk",@"lll", nil];
    
    NSOrderedSet *cOrderedSet = [NSOrderedSet orderedSetWithObjects:@"aaa",@"bbb",@"ccc",@"ddd", nil];
    NSOrderedSet *dOrderedSet = [NSOrderedSet orderedSetWithObjects:@"aaa",@"bbb",@"ccc",@"ddd",@"eee",@"fff",@"GGG", nil];
    
    NSLog(@"%s 1 %@",__FUNCTION__,([aOrderedSet intersectsOrderedSet:bOrderedSet])?@"YES":@"NO");
    //=>NO
    NSLog(@"%s 2 %@",__FUNCTION__,([aOrderedSet intersectsOrderedSet:cOrderedSet])?@"YES":@"NO");
    //=>YES
    NSLog(@"%s 3 %@",__FUNCTION__,([aOrderedSet intersectsOrderedSet:dOrderedSet])?@"YES":@"NO");
    //=>YES
}

#pragma mark NSOrderedSet isEqualToOrderedSet
-(void)method032
{
    NSOrderedSet *aOrderedSet = [NSOrderedSet orderedSetWithObjects:@"aaa",@"bbb",@"ccc",@"ddd",@"eee",@"fff", nil];
    
    NSOrderedSet *bOrderedSet = [NSOrderedSet orderedSetWithObjects:@"bbb",@"aaa",@"ccc",@"ddd",@"eee",@"fff", nil];
    
    NSOrderedSet *cOrderedSet = [NSOrderedSet orderedSetWithObjects:@"aaa",@"bbb",@"ccc",@"ddd", nil];
    NSOrderedSet *dOrderedSet = [NSOrderedSet orderedSetWithObjects:@"aaa",@"bbb",@"ccc",@"ddd",@"eee",@"fff",@"GGG", nil];
    
    NSLog(@"%s 1 %@",__FUNCTION__,([aOrderedSet isSubsetOfOrderedSet:bOrderedSet])?@"YES":@"NO");
    //=>YES
    NSLog(@"%s 2 %@",__FUNCTION__,([aOrderedSet isSubsetOfOrderedSet:cOrderedSet])?@"YES":@"NO");
    //=>NO
    NSLog(@"%s 3 %@",__FUNCTION__,([aOrderedSet isSubsetOfOrderedSet:dOrderedSet])?@"YES":@"NO");
    //=>YES
}

#pragma mark NSOrderedSet isEqualToOrderedSet
-(void)method033
{
    NSOrderedSet *aOrderedSet = [NSOrderedSet orderedSetWithObjects:@"aaa",@"bbb",@"ccc",@"ddd",@"eee",@"fff", nil];
    
    NSSet *bOrderedSet = [NSSet setWithObjects:@"ggg",@"hhh",@"iii",@"jjj",@"kkk",@"lll", nil];
    
    NSSet *cOrderedSet = [NSSet setWithObjects:@"aaa",@"bbb",@"ccc",@"ddd", nil];
    NSSet *dOrderedSet = [NSSet setWithObjects:@"aaa",@"bbb",@"ccc",@"ddd",@"eee",@"fff",@"GGG", nil];
    
    NSLog(@"%s 1 %@",__FUNCTION__,([aOrderedSet intersectsSet:bOrderedSet])?@"YES":@"NO");
    //=>NO
    NSLog(@"%s 2 %@",__FUNCTION__,([aOrderedSet intersectsSet:cOrderedSet])?@"YES":@"NO");
    //=>YES
    NSLog(@"%s 3 %@",__FUNCTION__,([aOrderedSet intersectsSet:dOrderedSet])?@"YES":@"NO");
    //=>YES
}

#pragma mark NSOrderedSet isEqualToOrderedSet
-(void)method034
{
    NSOrderedSet *aOrderedSet = [NSOrderedSet orderedSetWithObjects:@"aaa",@"bbb",@"ccc",@"ddd",@"eee",@"fff", nil];
    
    NSSet *bOrderedSet = [NSSet setWithObjects:@"bbb",@"aaa",@"ccc",@"ddd",@"eee",@"fff", nil];
    
    NSSet *cOrderedSet = [NSSet setWithObjects:@"aaa",@"bbb",@"ccc",@"ddd", nil];
    NSSet *dOrderedSet = [NSSet setWithObjects:@"aaa",@"bbb",@"ccc",@"ddd",@"eee",@"fff",@"GGG", nil];
    
    NSLog(@"%s 1 %@",__FUNCTION__,([aOrderedSet isSubsetOfSet:bOrderedSet])?@"YES":@"NO");
    //=>YES
    NSLog(@"%s 2 %@",__FUNCTION__,([aOrderedSet isSubsetOfSet:cOrderedSet])?@"YES":@"NO");
    //=>NO
    NSLog(@"%s 3 %@",__FUNCTION__,([aOrderedSet isSubsetOfSet:dOrderedSet])?@"YES":@"NO");
    //=>YES
}

#pragma mark addObserver:toObjectsAtIndexes:forKeyPath:options:context:
-(void)method035
{
    NSMutableString *aaa = [NSMutableString stringWithString:@"aaa"];
    NSMutableString *bbb = [NSMutableString stringWithString:@"bbb"];
    NSMutableString *ccc = [NSMutableString stringWithString:@"ccc"];

    NSMutableDictionary *dic1 =
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     aaa,@"key1",bbb,@"key2",ccc,@"key3",nil];
    NSMutableDictionary *dic2 =
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     aaa,@"key1",bbb,@"key2",ccc,@"key3",nil];
    NSMutableDictionary *dic3 =
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     aaa,@"key1",bbb,@"key2",ccc,@"key3",nil];
    NSMutableDictionary *dic4 =
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     aaa,@"key1",bbb,@"key2",ccc,@"key3",nil];
    
    NSArray *aArray = [NSArray arrayWithObjects:dic1,dic2,dic3,dic4, nil];
    NSOrderedSet *anOrderedSet = [[NSOrderedSet alloc]  initWithArray:aArray];
    
    //
    /*
    [anOrderedSet addObserver:self //(NSObject *)anObserver
              forKeyPath:@"self.key1" //(NSString *)keyPath
                 options:NSKeyValueObservingOptionInitial //(NSKeyValueObservingOptions )options
                 context:nil //(void *)context
     ];
    [[dic1 objectForKey:@"key1"] appendString:@"+aString"];
    */
     //NSLog(@"013 = %@",[anArray description]);
    
    //=>
}
#pragma mark setValue:forKey:
-(void)method036
{
    NSMutableDictionary *dic1 =
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"aaa4",@"key1",@"bbb1",@"key2",@"ccc1",@"key3",nil];
    NSMutableDictionary *dic2 =
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"aaa2",@"key1",@"bbb2",@"key2",@"ccc2",@"key3",nil];
    NSMutableDictionary *dic3 =
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"aaa1",@"key1",@"bbb3",@"key2",@"ccc3",@"key3",nil];
    NSMutableDictionary *dic4 =
    [NSMutableDictionary dictionaryWithObjectsAndKeys:
     @"aaa3",@"key1",@"bbb4",@"key2",@"ccc4",@"key3",nil];
    
    NSOrderedSet *aOrderedSet = [NSOrderedSet orderedSetWithObjects:dic1,dic2,dic3,dic4, nil];
    NSLog(@"%s %@,%@,%@,%@",__FUNCTION__,[[aOrderedSet objectAtIndex:0] valueForKey:@"key1"],
          [[aOrderedSet objectAtIndex:1] valueForKey:@"key1"],
          [[aOrderedSet objectAtIndex:2] valueForKey:@"key1"],
          [[aOrderedSet objectAtIndex:3] valueForKey:@"key1"]);
    //=>-[OOOAppDelegate method035] aaa4,aaa2,aaa1,aaa3
    [aOrderedSet setValue:@"xxx" forKey:@"key1"];
    
    NSLog(@"%s %@,%@,%@,%@",__FUNCTION__,[[aOrderedSet objectAtIndex:0] valueForKey:@"key1"],
          [[aOrderedSet objectAtIndex:1] valueForKey:@"key1"],
          [[aOrderedSet objectAtIndex:2] valueForKey:@"key1"],
          [[aOrderedSet objectAtIndex:3] valueForKey:@"key1"]);
    
    //=>-[OOOAppDelegate method035] xxx,xxx,xxx,xxx
    
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
    [self method026];
    [self method027];
    [self method028];
    [self method029];
    [self method030];
    [self method031];
    [self method032];
    [self method033];
    [self method034];
    [self method035];
    
    [self method036];
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
