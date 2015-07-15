//
//  PhoneCallViewController.m
//  NINEClient
//
//  Created by rimi on 15/7/15.
//  Copyright (c) 2015年 Drven. All rights reserved.
//

#import "PhoneCallViewController.h"

@interface PhoneCallViewController ()

@end

@implementation PhoneCallViewController

/*
 *!这配置自身样式
 */
- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"phone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.image = [[UIImage imageNamed:@"phone_no"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.title = @"电话";
        //设置分段器title
        self.segTitle = @[@"所有来电",@"未接来电"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)segBtnAction:(UIButton *)sender {
    [super segBtnAction:sender];
}

@end
