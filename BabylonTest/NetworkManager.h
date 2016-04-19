//
//  NetworkManager.h
//  BabylonTest
//
//  Created by Trevor Doodes on 19/04/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject
typedef void (^success) (NSArray *dataArray);
typedef void (^failure) (NSString *message, NSUInteger statusCode);


- (void)retrievePostsSuccess:(success)success
                            failure:(failure)failure;
- (void)retrieveUsersSuccess:(success)success
                     failure:(failure)failure;
- (void)retrieveCommentsSuccess:(success)success
                     failure:(failure)failure;

@end
