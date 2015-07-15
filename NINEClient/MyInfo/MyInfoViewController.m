//
//  MyInfoViewController.m
//  NINEClient
//
//  Created by rimi on 15/7/15.
//  Copyright (c) 2015年 Drven. All rights reserved.
//

#import "MyInfoViewController.h"

@interface MyInfoViewController ()

@end

@implementation MyInfoViewController

- (instancetype)init {
    if (self = [super init]) {
        //改变tabBarItem图片
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"info"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.image = [[UIImage imageNamed:@"info_no"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.title = @"联系人";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


@end
