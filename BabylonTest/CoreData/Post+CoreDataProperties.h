//
//  Post+CoreDataProperties.h
//  BabylonTest
//
//  Created by Trevor Doodes on 20/03/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@class Comments;
@interface Post (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *userID;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *body;
@property (nullable, nonatomic, retain) NSManagedObject *user;
@property (nullable, nonatomic, retain) NSSet<Comments *> *comments;

@end

@interface Post (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(Comments *)value;
- (void)removeCommentsObject:(Comments *)value;
- (void)addComments:(NSSet<Comments *> *)values;
- (void)removeComments:(NSSet<Comments *> *)values;

@end

NS_ASSUME_NONNULL_END
