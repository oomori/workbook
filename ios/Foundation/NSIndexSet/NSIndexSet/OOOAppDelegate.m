//
//  OOOAppDelegate.m
//  NSIndexSet
//
//  Created by 大森 智史 on 12/05/05.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "OOOAppDelegate.h"

@implementation OOOAppDelegate

@synthesize window = _window;

#pragma mark indexSetWithIndexesInRange:
-(void)method001
{
    
    NSArray *anArray = [NSArray arrayWithObjects:@"aaa",[NSNumber numberWithFloat:2.0],@"bbb",@"ccc",@"ddd",@"eee",@"fff",@"ggg",@"hhh",nil];
    NSRange range = NSMakeRange(3,4);
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];

    
    NSArray *retArray = [anArray objectsAtIndexes:indexSet];
    
    NSLog(@"%s : %@", __FUNCTION__,[retArray description]);
    //=>-[OOOAppDelegate method001] :  (ccc,ddd,eee,fff)

}

#pragma mark indexSet:
-(void)method002
{
    NSMutableArray *anArray = [NSMutableArray arrayWithObjects:@"111",[NSNumber numberWithFloat:2.0],@"333",@"444",@"555",@"666",@"777",@"888",@"999",nil];

    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    [indexSet addIndex:3];
    [indexSet addIndex:4];
    [indexSet addIndex:5];
    [indexSet addIndex:6];
    [indexSet addIndex:7];

    
    NSArray *retArray = [anArray objectsAtIndexes:indexSet];
    
    NSLog(@"002 = %s : %@", __FUNCTION__,[retArray description]);
    //=>001 = -[OOOAppDelegate method002] : (444,555,666,777,888)
}
#pragma mark indexGreaterThanOrEqualToIndex:
-(void)method003
{

    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    [indexSet addIndex:3];
    [indexSet addIndex:5];
    [indexSet addIndex:7];
    [indexSet addIndex:3];
    [indexSet addIndex:9];
    [indexSet addIndex:10];
    [indexSet addIndex:11];
    
    NSUInteger integer = [indexSet indexGreaterThanOrEqualToIndex:6];
    
    NSLog(@"003 = %s %@: %d", __FUNCTION__,[indexSet description],integer);
    //=>003 = -[OOOAppDelegate method003] : 7
    
}

#pragma mark containsIndexesInRange:
-(void)method004
{

    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];

    [indexSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10,10)]];
    [indexSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(30,10)]];
    [indexSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(50,10)]];
    [indexSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(70,10)]];
    
    NSLog(@"%s ", __FUNCTION__);
    NSLog(@"10-15 %@",([indexSet containsIndexesInRange:NSMakeRange(10,5)]?@"YES":@"NO"));
    NSLog(@"20-25 %@",([indexSet containsIndexesInRange:NSMakeRange(20,15)]?@"YES":@"NO"));
    NSLog(@"10-25 %@",([indexSet containsIndexesInRange:NSMakeRange(10,15)]?@"YES":@"NO"));
    NSLog(@"10-35 %@",([indexSet containsIndexesInRange:NSMakeRange(10,25)]?@"YES":@"NO"));
    //=>-[OOOAppDelegate method004]
    //=>10-15 YES
    //=>20-25 NO
    //=>10-25 NO
    //=>10-35 NO
}
#pragma mark indexSetWithIndex:
-(void)method005
{
    
    NSArray *anArray = [NSArray arrayWithObjects:@"aaa",[NSNumber numberWithFloat:2.0],@"bbb",@"ccc",@"ddd",@"eee",@"fff",@"ggg",@"hhh",nil];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:3];
    
    
    NSArray *retArray = [anArray objectsAtIndexes:indexSet];
    
    NSLog(@"%s : %@", __FUNCTION__,[retArray description]);
    //=> (ccc)
    
}

#pragma mark initWithIndexSet:
-(void)method006
{
    
    NSArray *anArray = [NSArray arrayWithObjects:@"aaa",[NSNumber numberWithFloat:2.0],@"bbb",@"ccc",@"ddd",@"eee",@"fff",@"ggg",@"hhh",nil];
    NSRange range = NSMakeRange(3,4);
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
    
    NSIndexSet *newSet = [[NSIndexSet alloc ]initWithIndexSet:indexSet];
    
    NSArray *retArray = [anArray objectsAtIndexes:newSet];
    
    NSLog(@"%s : %@", __FUNCTION__,[retArray description]);
    //=>(ccc,ddd,eee,fff)

}

#pragma mark count
-(void)method007
{
    
    NSArray *anArray = [NSArray arrayWithObjects:@"aaa",[NSNumber numberWithFloat:2.0],@"bbb",@"ccc",@"ddd",@"eee",@"fff",@"ggg",@"hhh",nil];
    NSRange range = NSMakeRange(3,4);
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
    
    NSIndexSet *newSet = [[NSIndexSet alloc ]initWithIndexSet:indexSet];
    
    NSArray *retArray = [anArray objectsAtIndexes:newSet];
    
    NSLog(@"%s : %d", __FUNCTION__,[retArray count]);
    //=>
    
}

#pragma mark containsIndex
-(void)method008
{
    
    NSRange range = NSMakeRange(3,4);
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:range];
    
    NSIndexSet *newSet = [[NSIndexSet alloc ]initWithIndexSet:indexSet];
    
    NSLog(@"%s  %@", __FUNCTION__,([newSet containsIndex:2])?@"YES":@"NO");
    //=>NO
    NSLog(@"%s  %@", __FUNCTION__,([newSet containsIndex:4])?@"YES":@"NO");
    //=>YES
    
}

#pragma mark containsIndex
-(void)method009
{
    
    NSRange aRange = NSMakeRange(3,4);
    NSIndexSet *aSet = [NSIndexSet indexSetWithIndexesInRange:aRange];
    
    NSRange bRange = NSMakeRange(4,1);
    NSIndexSet *bSet = [NSIndexSet indexSetWithIndexesInRange:bRange];
    NSLog(@"%s  %@", __FUNCTION__,([aSet containsIndexes:bSet])?@"YES":@"NO");
    //=>YES
    
    NSRange cRange = NSMakeRange(4,8);
    NSIndexSet *cSet = [NSIndexSet indexSetWithIndexesInRange:cRange];
    NSLog(@"%s  %@", __FUNCTION__,([aSet containsIndexes:cSet])?@"YES":@"NO");
    //=>NO
    
    
}

#pragma mark containsIndexesInRange
-(void)method010
{
    
    NSRange aRange = NSMakeRange(3,4);
    NSIndexSet *aSet = [NSIndexSet indexSetWithIndexesInRange:aRange];
    
    NSRange bRange = NSMakeRange(4,1);
    NSLog(@"%s  %@", __FUNCTION__,([aSet containsIndexesInRange:bRange])?@"YES":@"NO");
    //=>YES
    
    NSRange cRange = NSMakeRange(4,8);
    NSLog(@"%s  %@", __FUNCTION__,([aSet containsIndexesInRange:cRange])?@"YES":@"NO");
    //=>NO
    
    
}

#pragma mark containsIndexesInRange
-(void)method011
{
    
    NSRange aRange = NSMakeRange(3,4);
    NSIndexSet *aSet = [NSIndexSet indexSetWithIndexesInRange:aRange];
    
    NSRange bRange = NSMakeRange(4,1);
    NSLog(@"%s  %@", __FUNCTION__,([aSet intersectsIndexesInRange:bRange])?@"YES":@"NO");
    //=>YES
    
    NSRange cRange = NSMakeRange(4,8);
    NSLog(@"%s  %@", __FUNCTION__,([aSet intersectsIndexesInRange:cRange])?@"YES":@"NO");
    //=>YES
    
    NSRange dRange = NSMakeRange(7,1);
    NSLog(@"%s  %@", __FUNCTION__,([aSet intersectsIndexesInRange:dRange])?@"YES":@"NO");
    //=>NO
    
    
}

#pragma mark containsIndexesInRange
-(void)method012
{
    
    NSRange aRange = NSMakeRange(3,4);
    NSIndexSet *aSet = [NSIndexSet indexSetWithIndexesInRange:aRange];
    
    NSRange bRange = NSMakeRange(4,1);
    NSLog(@"%s  %d", __FUNCTION__,[aSet countOfIndexesInRange:bRange]);
    //=>1
    
    NSRange cRange = NSMakeRange(4,8);
    NSLog(@"%s  %d", __FUNCTION__,[aSet countOfIndexesInRange:cRange]);
    //=>3
    
    
}

#pragma mark NSIndexSet indexPassingTest
-(void)method013
{
    
    NSRange aRange = NSMakeRange(3,4);
    NSIndexSet *aSet = [NSIndexSet indexSetWithIndexesInRange:aRange];
    
    
    NSUInteger index = [aSet indexPassingTest:^ BOOL (NSUInteger idx, BOOL *stop){
                          if (idx > 5) {
                              *stop = YES;
                              return YES;
                          }else{
                              return NO;
                          }
                      }];
    
    if (index == NSNotFound) {
        NSLog(@"Not Found");
    }else {
        NSLog(@"%s  %d", __FUNCTION__,index);
        //=>6
    }
}

#pragma mark NSIndexSet indexesPassingTest
-(void)method014
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(30,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(50,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(70,10)]];

    
    NSIndexSet *passSet = [aSet indexesPassingTest:^ BOOL (NSUInteger idx, BOOL *stop){
        if (idx > 55) {
            return YES;
        }else{
            return NO;
        }
    }];
    
    [passSet enumerateRangesUsingBlock:^(NSRange range, BOOL *stop) {
        NSLog(@"%s %d,%d",__FUNCTION__, range.location,range.length);
    }];
    //=> 56,4
    //=> 70,10
}

#pragma mark NSIndexSet indexesPassingTest
-(void)method015
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(30,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(50,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(70,10)]];
    
    
    NSUInteger index = [aSet indexWithOptions:NSEnumerationConcurrent
                                     passingTest:^ BOOL (NSUInteger idx, BOOL *stop){
                                         if (idx > 55) {
                                             *stop = YES;
                                             return YES;
                                         }else{
                                             return NO;
                                         }
    }];
    
    if (index == NSNotFound) {
        NSLog(@"Not Found");
    }else {
        NSLog(@"%s  %d", __FUNCTION__,index);
        //=>56
    }
}

#pragma mark NSIndexSet indexesWithOptions:passingTest:
-(void)method016
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(30,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(50,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(70,10)]];
    
    
    NSIndexSet *passSet = [aSet indexesWithOptions:NSEnumerationConcurrent
                                       passingTest:^ BOOL (NSUInteger idx, BOOL *stop){
        if (idx > 55) {
            return YES;
        }else{
            return NO;
        }
    }];
    
    [passSet enumerateRangesUsingBlock:^(NSRange range, BOOL *stop) {
        NSLog(@"%s %d,%d",__FUNCTION__, range.location,range.length);
    }];
    //=> 56,4
    //=> 70,10
}

#pragma mark NSIndexSet enumerateRangesUsingBlock:
-(void)method017
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(30,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(50,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(70,10)]];
    
    
    NSIndexSet *passSet = [aSet indexesWithOptions:NSEnumerationConcurrent
                                       passingTest:^ BOOL (NSUInteger idx, BOOL *stop){
                                           if (idx > 55) {
                                               return YES;
                                           }else{
                                               return NO;
                                           }
                                       }];
    
    [passSet enumerateRangesUsingBlock:^(NSRange range, BOOL *stop) {
        NSLog(@"%s %d,%d",__FUNCTION__, range.location,range.length);
    }];
    //=> 56,4
    //=> 70,10
}

#pragma mark containsIndexesInRange
-(void)method018
{
    
    NSRange aRange = NSMakeRange(3,4);
    NSIndexSet *aSet = [NSIndexSet indexSetWithIndexesInRange:aRange];
    
    NSRange bRange = NSMakeRange(3,4);
    NSIndexSet *bSet = [NSIndexSet indexSetWithIndexesInRange:bRange];
    NSLog(@"%s  %@", __FUNCTION__,([aSet isEqualToIndexSet:bSet])?@"YES":@"NO");
    //=>YES
    
    NSRange cRange = NSMakeRange(4,8);
    NSIndexSet *cSet = [NSIndexSet indexSetWithIndexesInRange:cRange];
    NSLog(@"%s  %@", __FUNCTION__,([aSet isEqualToIndexSet:cSet])?@"YES":@"NO");
    //=>NO
}

#pragma mark NSIndexSet firstIndex
-(void)method019
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(30,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(50,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(70,10)]];
    
    
    NSLog(@"%s %d",__FUNCTION__, [aSet firstIndex]);
    
}

#pragma mark NSIndexSet firstIndex
-(void)method020
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(30,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(50,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(70,10)]];
    
    
    NSLog(@"%s %d",__FUNCTION__, [aSet lastIndex]);
    
}

#pragma mark NSIndexSet indexLessThanIndex
-(void)method021
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(30,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(50,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(70,10)]];
    
    
    NSLog(@"%s %d",__FUNCTION__, [aSet indexLessThanIndex:50]);
    
}

#pragma mark NSIndexSet indexLessThanIndex
-(void)method022
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(30,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(50,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(70,10)]];
    
    
    NSLog(@"%s %d",__FUNCTION__, [aSet indexLessThanOrEqualToIndex:50]);
    
}
#pragma mark NSIndexSet indexLessThanIndex
-(void)method023
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(30,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(50,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(70,10)]];
    
    
    NSLog(@"%s %d",__FUNCTION__, [aSet indexGreaterThanIndex:50]);
    //=>51
    
}
#pragma mark NSIndexSet indexLessThanIndex
-(void)method024
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(30,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(50,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(70,10)]];
    //=>50
    
    NSLog(@"%s %d",__FUNCTION__, [aSet indexGreaterThanOrEqualToIndex:50]);
    
}

#pragma mark NSIndexSet enumerateRangesUsingBlock:
-(void)method025
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(30,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(50,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(70,10)]];

    NSUInteger buf[200];
    NSRange myRange = NSMakeRange(0, 200);
    NSUInteger indCount = [aSet getIndexes:buf maxCount:200
                                      inIndexRange:&myRange];
    
    NSLog(@"indCount: %u nextRange: %u,%u", indCount, myRange.location,myRange.length);

    
}

#pragma mark NSIndexSet indexesPassingTest
-(void)method026
{
    
    NSMutableIndexSet *aSet = [NSMutableIndexSet indexSet];
    
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(10,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(30,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(50,10)]];
    [aSet addIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(70,10)]];
    
    
    NSIndexSet *passSet = [aSet indexesPassingTest:^ BOOL (NSUInteger idx, BOOL *stop){
        if (idx > 55) {
            return YES;
        }else{
            return NO;
        }
    }];
    
    [passSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        NSLog(@"%s %d",__FUNCTION__, idx);
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
    [self method026];
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
