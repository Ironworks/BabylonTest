//
//  PostsDetailViewController.m
//  BabylonTest
//
//  Created by Trevor Doodes on 03/05/2016.
//  Copyright © 2016 Ironworks Media Ltd. All rights reserved.
//

#import "PostsDetailViewController.h"
#import "Post.h"
#import "Users.h"


@interface PostsDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *postTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *postBodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *postUserLabel;
@property (weak, nonatomic) IBOutlet UILabel *postNumberOfCommentsLabel;

@end

@implementation PostsDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.postTitleLabel.text = self.post.title;
    self.postBodyLabel.text = self.post.body;
    self.postUserLabel.text = self.post.user.name;
    self.postNumberOfCommentsLabel.text = [NSString stringWithFormat:@"%lu comments", self.post.comments.count];
}

@end
