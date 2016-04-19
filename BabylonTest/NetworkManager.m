//
//  NetworkManager.m
//  BabylonTest
//
//  Created by Trevor Doodes on 19/04/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//

#import "NetworkManager.h"
#import "AFNetworking.h"

@implementation NetworkManager

NSString * const kBaseURL = @"http://jsonplaceholder.typicode.com/%@";

- (void)retrieveDataForURL:(NSURL *)URL
                        Success:(success)success
                        failure:(failure)failure
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSHTTPURLResponse *httpResp = (NSHTTPURLResponse *)response;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (failure) {
                    failure(error.localizedDescription, httpResp.statusCode);
                }
            });
            
        } else {
            
            
            NSArray *entries  = responseObject;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (success) {
                    success(entries);
                }
            });
            
        }
    }];
    [dataTask resume];

}

- (void)retrievePostsSuccess:(success)success
                     failure:(failure)failure
{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:kBaseURL, @"posts"]];
    [self retrieveDataForURL:URL Success:success failure:failure];
}


- (void)retrieveUsersSuccess:(success)success
                     failure:(failure)failure
{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:kBaseURL, @"users"]];
    [self retrieveDataForURL:URL Success:success failure:failure];
    
}
- (void)retrieveCommentsSuccess:(success)success
                        failure:(failure)failure
{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:kBaseURL, @"comments"]];
    [self retrieveDataForURL:URL Success:success failure:failure];
    
}
@end
