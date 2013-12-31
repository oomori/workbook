//
//  NSArrayTests.m
//  NSArrayTests
//
//  Created by 大森 智史 on 12/04/15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSArrayTests.h"
#import "OOOAppDelegate.h"
#import "OOOModel.h"

@implementation NSArrayTests

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
    //OOOAppDelegate *del = [[OOOAppDelegate alloc] init];
    OOOModel *model = [[OOOModel alloc] init];
    
    //XCTAssertTrue([[[del method001] class] isSubclassOfClass:[NSArray class]]);
    
    XCTAssertTrue([[[model method001] class] isSubclassOfClass:[NSArray class]]);

    XCTAssertTrue([[[model method001] objectAtIndex:0] isEqual:@"aaa"]);
    
    //指定した文字オブジェクトと同じオブジェクトが配列に存在するか？
    XCTAssertFalse([model method002] == NSNotFound,@"Not Found");
    
    
    //XCTAssertEqual([del method001].count == 9 , @"Wrong array size.");
    //XCTAssertEqual([[del method001] objectAtIndex:0], @"aaa");
    //STFail(@"Unit tests are not implemented yet in NSArrayTests");
}

@end
