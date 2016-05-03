//
//  PostsTableViewController.m
//  BabylonTest
//
//  Created by Trevor Doodes on 24/04/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//

#import "PostsTableViewController.h"
#import "DataManager.h"
#import "NetworkManager.h"
#import "Post.h"
#import "PostsDetailViewController.h"


@interface PostsTableViewController ()
@property (nonatomic, strong) DataManager *dataManager;
@property (nonatomic, strong) NSArray *posts;

@end

@implementation PostsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Posts";
    
    NetworkManager *networkManager = [[NetworkManager alloc] init];
    self.dataManager = [[DataManager alloc] initWithNetworkManager:networkManager];
    
    [self.dataManager getPostsWithSuccessBlock:^(NSArray *dataArray) {
        self.posts = dataArray;
        [self.tableView reloadData];
        
    } failureBlock:^(NSString *message) {
        //
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.posts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Post *post = self.posts[indexPath.row];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = post.title;
    
    return cell;
}

#pragma mark - Table View Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"detailSegue" sender:nil];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        PostsDetailViewController *vc = (PostsDetailViewController *)[segue destinationViewController];
        vc.post = self.posts[[self.tableView indexPathForSelectedRow].row];
    }
}

@end
