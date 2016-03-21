//
//  Users.h
//  BabylonTest
//
//  Created by Trevor Doodes on 20/03/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Address, Geo, Post;

NS_ASSUME_NONNULL_BEGIN

@interface Users : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "Users+CoreDataProperties.h"
