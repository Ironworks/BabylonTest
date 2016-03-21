//
//  Geo.m
//  BabylonTest
//
//  Created by Trevor Doodes on 20/03/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//

#import "Geo.h"

@implementation Geo

// Insert code here to add functionality to your managed object subclass
- (CLLocationCoordinate2D)coordinates {
    return CLLocationCoordinate2DMake([self.latitude doubleValue], [self.longitude doubleValue]);
}

@end
