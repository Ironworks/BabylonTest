//
//  Geo.h
//  
//
//  Created by Trevor Doodes on 19/04/2016.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <CoreLocation/CoreLocation.h>

@class Users;

NS_ASSUME_NONNULL_BEGIN

@interface Geo : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
- (CLLocationCoordinate2D)coordinates;


@end

NS_ASSUME_NONNULL_END

#import "Geo+CoreDataProperties.h"
