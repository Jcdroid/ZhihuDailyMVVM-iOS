//
//  ZhihuDailyMVVM_iOSTests.m
//  ZhihuDailyMVVM-iOSTests
//
//  Created by mac on 16/1/8.
//  Copyright © 2016年 Jcdroid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ZHAPI.h"

@interface ZhihuDailyMVVM_iOSTests : XCTestCase

@end

@implementation ZhihuDailyMVVM_iOSTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSLog(@"%@", Zhihu_StartImage);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
