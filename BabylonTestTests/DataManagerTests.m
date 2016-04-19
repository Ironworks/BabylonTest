//
//  DataManagerTests.m
//  BabylonTest
//
//  Created by Trevor Doodes on 19/04/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "DataManager.h"
#import "Post.h"
#import "NetworkManager.h"

@interface DataManagerTests : XCTestCase
@property (nonatomic, strong) DataManager *mgr;
@end

@implementation DataManagerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NetworkManager *networkManager = [[NetworkManager alloc] init];
    self.mgr = [[DataManager alloc] initWithNetworkManager:networkManager];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [MagicalRecord setupCoreDataStackWithInMemoryStore];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [MagicalRecord cleanUp];
    [super tearDown];
}


- (void)testCanCreateAnApplicationManagerObject {
    
    XCTAssertNotNil(self.mgr, @"Should be able to create an data manager");
}

- (void)testCanSetNetworkManager {
    
    XCTAssertNotNil(self.mgr.networkManager, @"Should be able to set newtwork manager");
}

- (void)testCanGetListOfApplications {
    
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:20];
    Post *post = [Post MR_createEntity];
    
    for (int i = 0; i < 20; i++) {
        [results addObject:post];
    }
    

    
    id sut = [OCMockObject mockForClass:[DataManager class]];
    [[[sut stub] andDo:^(NSInvocation *invocation) {
        //Our stubbed results
        NSArray *posts = results;
        successBlock blockToExecute = nil;
        
        [invocation getArgument:&blockToExecute atIndex:2];
        
        blockToExecute(posts);
    }] getPostsWithSuccessBlock:[OCMArg any]
     failureBlock:[OCMArg any]];
    
    
    [sut getPostsWithSuccessBlock:^(NSArray *applicationsArray) {
        XCTAssertTrue(applicationsArray.count == 20, @"Array should have data");
    } failureBlock:^(NSString *message) {
        //Should not see this in our test
        XCTAssertTrue(NO, @"Should not have an error");
    }];
}

@end
