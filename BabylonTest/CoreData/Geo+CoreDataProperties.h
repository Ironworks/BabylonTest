//
//  Geo+CoreDataProperties.h
//  BabylonTest
//
//  Created by Trevor Doodes on 20/03/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Geo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Geo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *longitude;

@end

NS_ASSUME_NONNULL_END
