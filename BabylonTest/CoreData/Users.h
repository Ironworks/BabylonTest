//
//  Users.h
//  
//
//  Created by Trevor Doodes on 19/04/2016.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Address, Company, Geo, Post;

NS_ASSUME_NONNULL_BEGIN

@interface Users : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "Users+CoreDataProperties.h"
