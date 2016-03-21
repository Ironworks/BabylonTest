//
//  CoredataTests.m
//  BabylonTest
//
//  Created by Trevor Doodes on 18/03/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Corelocation/CoreLocation.h>
#import "Post.h"
#import "Users.h"
#import "Address.h"
#import "Comments.h"
#import "Geo.h"
#import "Company.h"



@interface CoredataTests : XCTestCase

@property (nonatomic, strong) Post *myPost;
@property (nonatomic, strong) Users *myUser;
@property (nonatomic, strong) Address *myAddress;
@property (nonatomic, strong) Comments *myComment;
@property (nonatomic, strong) Geo *myLocation;
@property (nonatomic, strong) Company *myCompany;


@end

@implementation CoredataTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [MagicalRecord setupCoreDataStackWithInMemoryStore];
    
    //Create a post
    self.myPost = [Post MR_createEntity];
    self.myPost.userID = @"ABCD";
    self.myPost.title = @"My Post";
    self.myPost.body = @"Body";
    
    //Create a user
    self.myUser = [Users MR_createEntity];
    self.myUser.id = @"ABCD";
    self.myUser.name = @"Name";
    self.myUser.username = @"Username";
    self.myUser.email = @"example@example.com";
    self.myUser.website = @"http://www.example.com";
    
    //Create an Address
    self.myAddress = [Address MR_createEntity];
    self.myAddress.street = @"A Street";
    self.myAddress.suite = @"Suite 1";
    self.myAddress.city = @"City";
    self.myAddress.zip = @"12345";
    
    
    //Create a comment
    self.myComment = [Comments MR_createEntity];
    self.myComment.postID = @"1";
    self.myComment.id = @"ABCD";
    self.myComment.email = @"example@example.com";
    self.myComment.body = @"Body";
    
    //Create a location
    self.myLocation = [Geo MR_createEntity];
    self.myLocation.latitude = [NSNumber numberWithDouble:-1.23456];
    self.myLocation.longitude = [NSNumber numberWithDouble:1.23456];
    
    //Create a company
    self.myCompany = [Company MR_createEntity];
    self.myCompany.name  = @"Company";
    self.myCompany.catchPhrase = @"Where's me washboard?";
    self.myCompany.bs = @"Some old BS";
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.myPost = nil;
    self.myUser = nil;
    self.myAddress = nil;
    self.myComment = nil;
    self.myLocation = nil;
    [MagicalRecord cleanUp];
    [super tearDown];
}

- (void)testCanCreatePost {
    XCTAssertNotNil(self.myPost, @"Should be able to create a post");
    XCTAssertEqual(self.myPost.userID, @"ABCD", @"Should be able to set userID");
    XCTAssertEqual(self.myPost.title, @"My Post", @"Should be able to set Title");
    XCTAssertEqual(self.myPost.body, @"Body", @"Should be able to set Body");

}

- (void)testCanCreateUser {
    XCTAssertNotNil(self.myUser, @"Should be able to create a user");
    XCTAssertEqual(self.myUser.id, @"ABCD", @"Should be able to set id");
    XCTAssertEqual(self.myUser.username, @"Username", @"Should be able to set username");
    XCTAssertEqual(self.myUser.email, @"example@example.com");
    XCTAssertEqual(self.myUser.website, @"http://www.example.com");
    
}

- (void)testCanCreateAddress {
    XCTAssertNotNil(self.myAddress, @"Should be able to create a user");
    XCTAssertEqual(self.myAddress.street, @"A Street", @"Should be able to set street");
    XCTAssertEqual(self.myAddress.suite, @"Suite 1", @"Should be able to set suite");
    XCTAssertEqual(self.myAddress.city, @"City", @"Should be able to set city");
    XCTAssertEqual(self.myAddress.zip, @"12345", @"Should be able to set zip");
}

- (void)testCanCreateComment {
    XCTAssertNotNil(self.myComment, @"Should be able to create a comment");
    XCTAssertEqual(self.myComment.postID, @"1", @"Should be able to set post ID");
    XCTAssertEqual(self.myComment.id, @"ABCD", @"Should be able to set id");
    XCTAssertEqual(self.myComment.email, @"example@example.com", @"Should be able to set email");
    XCTAssertEqual(self.myComment.body, @"Body", @"Should be able to set comment body");
}

- (void)testCanCreateALocation {
    XCTAssertNotNil(self.myLocation, @"Should be able to create a location");
    XCTAssertEqualObjects(self.myLocation.latitude, @(-1.23456), @"Should be able to set latittude");
    XCTAssertEqualObjects(self.myLocation.longitude, @(1.23456), @"Should be able to set longitude");
}

- (void)testCanCreateComapny {
    XCTAssertNotNil(self.myCompany, @"Should be able to create a company");
    XCTAssertEqual(self.myCompany.name, @"Company", @"Should be able to set company name");
    XCTAssertEqual(self.myCompany.catchPhrase, @"Where's me washboard?", @"Should be able to set company catchphrase");
    XCTAssertEqual(self.myCompany.bs, @"Some old BS", @"Should be able to set company bs");
}

- (void)testThatGeoReturnsCLLocationCoordinate2D {
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(-1.23456, 1.23456);
    CLLocationCoordinate2D locationUnderTest = [self.myLocation coordinates];
    
    XCTAssertEqualWithAccuracy(locationUnderTest.latitude, location.latitude, 0.00001, @"Should return a valid CLLocationCoordinate2D");
    
}

- (void)testCanAddUserToPost {
    self.myPost.user = self.myUser;
    
    XCTAssertEqual(self.myPost.user, self.myUser, @"Should be able to add user to post");
}

- (void)testCanAddAddressToUser {
    self.myUser.address = self.myAddress;
    XCTAssertEqual(self.myUser.address, self.myAddress, @"Should be able to set address for user");
}

- (void)testShouldBeAbleToSetLocationForUser {
    self.myUser.location = self.myLocation;
    XCTAssertEqual(self.myUser.location, self.myLocation, @"Should be able to set location for user");
}



- (void)testCanAddCommentsToPost {
    Comments *comment1 = [Comments MR_createEntity];
    Comments *comment2 = [Comments MR_createEntity];
    Comments *comment3 = [Comments MR_createEntity];
    
    [self.myPost addCommentsObject:comment1];
    [self.myPost addCommentsObject:comment2];
    [self.myPost addCommentsObject:comment3];
    
    XCTAssertEqual(self.myPost.comments.count, (long)3, @"Should be able to add comments to post");
}

@end
