//
//  NSBlockOperationTests.m
//  NSBlockOperationTests
//
//  Created by 大森 智史 on 12/05/13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSBlockOperationTests.h"
#import "OOOModel.h"

@implementation NSBlockOperationTests

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
    //STFail(@"Unit tests are not implemented yet in NSBlockOperationTests");
    OOOModel *model = [[OOOModel alloc] init];
    

    
    XCTAssertTrue([model method001]);

}

@end
