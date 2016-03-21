//
//  Users+CoreDataProperties.h
//  BabylonTest
//
//  Created by Trevor Doodes on 20/03/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Users.h"

NS_ASSUME_NONNULL_BEGIN

@interface Users (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *id;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *city;
@property (nullable, nonatomic, retain) NSString *username;
@property (nullable, nonatomic, retain) NSString *phone;
@property (nullable, nonatomic, retain) NSString *website;
@property (nullable, nonatomic, retain) NSSet<Post *> *posts;
@property (nullable, nonatomic, retain) Geo *location;
@property (nullable, nonatomic, retain) Address *address;

@end

@interface Users (CoreDataGeneratedAccessors)

- (void)addPostsObject:(Post *)value;
- (void)removePostsObject:(Post *)value;
- (void)addPosts:(NSSet<Post *> *)values;
- (void)removePosts:(NSSet<Post *> *)values;

@end

NS_ASSUME_NONNULL_END
