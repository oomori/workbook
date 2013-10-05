//
//  testTraceTests.m
//  testTraceTests
//
//  Created by 大森 智史 on 12/01/21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "testTraceTests.h"


#import "OOOAppDelegate.h"
OOOAppDelegate * obj;



@implementation testTraceTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
     obj = [[OOOAppDelegate alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    //STFail(@"Unit tests are not implemented yet in testTraceTests");
    STAssertEquals(1, 1, @"test 1");
}

@end
