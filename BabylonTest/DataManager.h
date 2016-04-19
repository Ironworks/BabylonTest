//
//  DataManager.h
//  BabylonTest
//
//  Created by Trevor Doodes on 19/04/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NetworkManager;
@interface DataManager : NSObject
typedef void (^successBlock) (NSArray *dataArray);
typedef void (^failureBlock) (NSString *message);

@property (nonatomic, strong, readonly) NetworkManager *networkManager;

-(instancetype) initWithNetworkManager:(NetworkManager *)networkManager;

- (void)getPostsWithSuccessBlock:(successBlock)successBlock
                           failureBlock:(failureBlock)failureBlock;
@end
