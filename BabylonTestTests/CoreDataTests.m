//
//  CoredataTests.m
//  BabylonTest
//
//  Created by Trevor Doodes on 18/03/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>


@interface CoredataTests : XCTestCase

@end

@implementation CoredataTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [MagicalRecord setupCoreDataStackWithInMemoryStore];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCanCreatePost {
    
    Post *myPost = [Post createEntity];
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
