//
//  EditContactViewController.m
//  NINEClient
//
//  Created by rimi on 15/7/15.
//  Copyright (c) 2015年 Drven. All rights reserved.
//

#import "EditContactViewController.h"

@interface EditContactViewController ()

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation EditContactViewController

- (instancetype)init {
    if (self = [super init]) {
        self.navItem = @[@"取消",@"完成"];
        self.titleText = @"编辑联系人";
        self.isTitle = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - appear disappear
/*
 *!隐藏tabBar
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}
/*
 *!
 */
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - reset methods
- (void)navItemAction:(UIButton *)sender {
    if (sender.tag == 12) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    return cell;
}

@end
