//
//  XCTestTests.m
//  XCTestTests
//
//  Created by 大森 智史 on 2014/01/01.
//  Copyright (c) 2014年 Satoshi Oomori. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OOOModel.h"

@interface XCTestTests : XCTestCase

@end

@implementation XCTestTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    //XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    OOOModel *model = [[OOOModel alloc] init];
    
    //XCTAssertTrue([[[del method001] class] isSubclassOfClass:[NSArray class]]);
    
    XCTAssertTrue([[[model method001] class] isSubclassOfClass:[NSArray class]]);

}

@end
