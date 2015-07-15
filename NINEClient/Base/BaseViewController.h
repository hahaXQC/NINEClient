//
//  BaseViewController.h
//  NINEClient
//
//  Created by rimi on 15/7/15.
//  Copyright (c) 2015年 Drven. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EditContactViewController;

@interface BaseViewController : UIViewController

@property (nonatomic, assign, getter=isHiddenSeg) BOOL isHiddenSeg;//default is NO
@property (nonatomic, assign, getter=isLeft) BOOL isLeft;
@property (nonatomic, assign, getter=isRight) BOOL isRight;
@property (nonatomic, assign, getter=isTitle) BOOL isTitle;

@property (nonatomic, strong) NSArray * segTitle;
@property (nonatomic, strong) NSArray * navItem;
@property (nonatomic, strong) NSString * titleText;

//公用接口，方便外部调用
- (void)segBtnAction:(UIButton *)sender;
- (void)navItemAction:(UIButton *)sender;

@end
