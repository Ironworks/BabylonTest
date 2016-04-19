//
//  Address+CoreDataProperties.h
//  
//
//  Created by Trevor Doodes on 19/04/2016.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Address.h"

NS_ASSUME_NONNULL_BEGIN

@interface Address (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *city;
@property (nullable, nonatomic, retain) NSString *street;
@property (nullable, nonatomic, retain) NSString *suite;
@property (nullable, nonatomic, retain) NSString *zip;
@property (nullable, nonatomic, retain) Users *user;

@end

NS_ASSUME_NONNULL_END
