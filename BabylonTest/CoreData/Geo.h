//
//  Geo.h
//  BabylonTest
//
//  Created by Trevor Doodes on 20/03/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Geo : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
- (CLLocationCoordinate2D)coordinates;


@end

NS_ASSUME_NONNULL_END

#import "Geo+CoreDataProperties.h"
