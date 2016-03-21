//
//  Company+CoreDataProperties.h
//  BabylonTest
//
//  Created by Trevor Doodes on 21/03/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Company.h"

NS_ASSUME_NONNULL_BEGIN

@interface Company (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *catchPhrase;
@property (nullable, nonatomic, retain) NSString *bs;
@property (nullable, nonatomic, retain) NSSet<Users *> *users;

@end

@interface Company (CoreDataGeneratedAccessors)

- (void)addUsersObject:(Users *)value;
- (void)removeUsersObject:(Users *)value;
- (void)addUsers:(NSSet<Users *> *)values;
- (void)removeUsers:(NSSet<Users *> *)values;

@end

NS_ASSUME_NONNULL_END
