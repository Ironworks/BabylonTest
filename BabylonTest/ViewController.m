//
//  ViewController.m
//  BabylonTest
//
//  Created by Trevor Doodes on 16/03/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//

#import "ViewController.h"
#import "DataManager.h"
#import "NetworkManager.h"

@interface ViewController ()
@property (nonatomic, strong) DataManager *dataManager;
@property (nonatomic, strong) NSArray *posts;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NetworkManager *networkManager = [[NetworkManager alloc] init];
    self.dataManager = [[DataManager alloc] initWithNetworkManager:networkManager];
    
    [self.dataManager getPostsWithSuccessBlock:^(NSArray *dataArray) {
        self.posts = dataArray;
    } failureBlock:^(NSString *message) {
        //
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
