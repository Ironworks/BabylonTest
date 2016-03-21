//
//  Comments+CoreDataProperties.h
//  BabylonTest
//
//  Created by Trevor Doodes on 20/03/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Comments.h"

NS_ASSUME_NONNULL_BEGIN

@interface Comments (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *postID;
@property (nullable, nonatomic, retain) NSString *id;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *body;
@property (nullable, nonatomic, retain) Post *post;

@end

NS_ASSUME_NONNULL_END
