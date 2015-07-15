//
//  MyMessageViewController.m
//  NINEClient
//
//  Created by rimi on 15/7/15.
//  Copyright (c) 2015年 Drven. All rights reserved.
//

#import "MyMessageViewController.h"

@interface MyMessageViewController ()

@end

@implementation MyMessageViewController

- (instancetype)init {
    if (self = [super init]) {
        //改变tabBarItem图片
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"message"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.image = [[UIImage imageNamed:@"message_no"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.title = @"消息";
        //设置分段器title
        self.segTitle = @[@"信息",@"分组信息"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
