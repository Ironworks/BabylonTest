//
//  Post+CoreDataProperties.m
//  BabylonTest
//
//  Created by Trevor Doodes on 20/03/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Post+CoreDataProperties.h"

@implementation Post (CoreDataProperties)

@dynamic userID;
@dynamic title;
@dynamic body;
@dynamic user;
@dynamic comments;

@end
