//
//  DataManager.m
//  BabylonTest
//
//  Created by Trevor Doodes on 19/04/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//

#import "DataManager.h"
#import "NetworkManager.h"
#import "Post.h"
#import "Users.h"
#import "Comments.h"
#import "Address.h"
#import "Geo.h"
#import "Company.h"

@interface DataManager ()
@property (nonatomic, strong) NSMutableArray *postsArray;
@property (nonatomic, strong) NSArray *users;
@property (nonatomic, strong) NSArray *posts;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, strong) successBlock successBlock;
@property (nonatomic, strong) failureBlock failureBlock;

@end


@implementation DataManager

-(instancetype) initWithNetworkManager:(NetworkManager *)networkManager {
    
    if (self = [super init]) {
        _networkManager = networkManager;
    }
    
    return self;
}

- (void)saveUsers
{
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
        for (NSDictionary *dict in self.users) {
            Users *newUser = [Users MR_createEntityInContext:localContext];
            newUser.id = dict[@"id"];
            newUser.name = dict[@"name"];
            newUser.email = dict[@"email"];
            
            NSDictionary *address = dict[@"address"];
            Address *newAddress = [Address MR_createEntityInContext:localContext];
            newAddress.suite = address[@"suite"];
            newAddress.street = address[@"street"];
            newAddress.city = address[@"city"];
            newAddress.zip = address[@"zipcode"];
            newUser.address = newAddress;
            newUser.phone = dict[@"phone"];
            newUser.website = dict[@"website"];
            
            NSDictionary *geo = address[@"Geo"];
            Geo *newGeo = [Geo MR_createEntityInContext:localContext];
            newGeo.latitude = geo[@"lat"];
            newGeo.longitude = geo[@"lng"];
            newUser.location = newGeo;
            
            NSDictionary *company = dict[@"company"];
            Company *newCompany = [Company MR_createEntityInContext:localContext];
            newCompany.name = company[@"name"];
            newCompany.catchPhrase = company[@"catchPhrase"];
            newCompany.bs = company[@"bs"];
            [newCompany addUsersObject:newUser];
        }

    } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
        [self retrievePosts];
    }];
    
}

- (void)savePosts {
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
        for (NSDictionary *dict in self.posts) {
            
            //Create new post
            Post *newPost = [Post MR_createEntityInContext:localContext];
            newPost.userID = dict[@"userId"];
            newPost.id = dict[@"id"];
            newPost.title = dict[@"title"];
            newPost.body = dict[@"body"];
            
            //Get user for post
            NSPredicate *filter = [NSPredicate predicateWithFormat:@"id == %@", newPost.userID];
            Users *user = [Users MR_findFirstWithPredicate:filter inContext:localContext];
            [user addPostsObject:newPost];
        }

    } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
        [self retrieveComments];
    }];
    
    

}

- (void)saveComments
{

    [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
        for (NSDictionary *dict in self.comments) {
            
            //Create new comment
            Comments *newComment = [Comments MR_createEntityInContext:localContext];
            newComment.postID = dict[@"postId"];
            newComment.name = dict[@"name"];
            newComment.email = dict[@"email"];
            newComment.body = dict[@"body"];
            
            //Get post for comment
            NSPredicate *filter = [NSPredicate predicateWithFormat:@"id == %@", newComment.postID];
            Post *post = [Post MR_findFirstWithPredicate:filter inContext:localContext];
            [post addCommentsObject:newComment];
        }

    } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error occured");
        } else {
            NSArray *results = [self postsFromCoreData];
            if (self.successBlock) {
                self.successBlock(results);
            }
        }
    }];

}

- (void)retrievePosts
{
    [self.networkManager retrievePostsSuccess:^(NSArray *dataArray) {
        self.posts = dataArray;
        [self savePosts];
    } failure:^(NSString *message, NSUInteger statusCode) {
        //
    }];
}


- (void)retrieveUsers
{
    [self.networkManager retrieveUsersSuccess:^(NSArray *dataArray) {
        self.users = dataArray;
        [self saveUsers];
    } failure:^(NSString *message, NSUInteger statusCode) {
        //
    }];
}

- (void)retrieveComments
{
    [self.networkManager retrieveCommentsSuccess:^(NSArray *dataArray) {
        self.comments = dataArray;
        [self saveComments];
    } failure:^(NSString *message, NSUInteger statusCode) {
        //
    }];
}

- (void)loadData
{
    
    //Get Users
    [self retrieveUsers];
    
}

- (NSArray *)postsFromCoreData
{
    return [Post MR_findAll];
}

- (void)getPostsWithSuccessBlock:(successBlock)successBlock
                    failureBlock:(failureBlock)failureBlock
{
    
    self.successBlock = successBlock;
    self.failureBlock = failureBlock;
    
    NSArray *results = [self postsFromCoreData];
    
    if (!results ||
        results.count == 0) {
        //Data isn't loaded so we need to load to core data
        [self loadData];
     } else {
        if (self.successBlock) {
            self.successBlock(results);
        }
    }
}

#pragma mark - Accessor Methods
- (NSMutableArray *)postsArray {
    
    if (_postsArray == nil) {
        _postsArray = [NSMutableArray array];
    }
    
    return _postsArray;
}

@end
