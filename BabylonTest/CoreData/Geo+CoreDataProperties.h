//
//  Geo+CoreDataProperties.h
//  
//
//  Created by Trevor Doodes on 19/04/2016.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Geo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Geo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *longitude;
@property (nullable, nonatomic, retain) Users *user;

@end

NS_ASSUME_NONNULL_END
