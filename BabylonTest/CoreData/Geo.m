//
//  Geo.m
//  
//
//  Created by Trevor Doodes on 19/04/2016.
//
//

#import "Geo.h"
#import "Users.h"

@implementation Geo

// Insert code here to add functionality to your managed object subclass
- (CLLocationCoordinate2D)coordinates {
    return CLLocationCoordinate2DMake([self.latitude doubleValue], [self.longitude doubleValue]);
}


@end
