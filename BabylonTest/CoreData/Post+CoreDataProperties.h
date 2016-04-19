//
//  Post+CoreDataProperties.h
//  
//
//  Created by Trevor Doodes on 19/04/2016.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface Post (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *body;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSNumber *userID;
@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSSet<Comments *> *comments;
@property (nullable, nonatomic, retain) Users *user;

@end

@interface Post (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(Comments *)value;
- (void)removeCommentsObject:(Comments *)value;
- (void)addComments:(NSSet<Comments *> *)values;
- (void)removeComments:(NSSet<Comments *> *)values;

@end

NS_ASSUME_NONNULL_END
