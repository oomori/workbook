//
//  NSAutoreleasePoolTests.m
//  NSAutoreleasePoolTests
//
//  Created by 大森 智史 on 12/05/11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSAutoreleasePoolTests.h"
#import "OOOModel.h"

@implementation NSAutoreleasePoolTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    OOOModel *model = [[OOOModel alloc] init];
    
    //XCTAssertTrue([[[del method001] class] isSubclassOfClass:[NSArray class]]);
    
    XCTAssertTrue([model method001]);

    //XCTFail(@"Unit tests are not implemented yet in NSAutoreleasePoolTests");
}

@end
