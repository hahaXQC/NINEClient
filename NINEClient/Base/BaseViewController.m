//
//  BaseViewController.m
//  NINEClient
//
//  Created by rimi on 15/7/15.
//  Copyright (c) 2015年 Drven. All rights reserved.
//

#import "BaseViewController.h"
#import "EditContactViewController.h"

@interface BaseViewController () {
    NSMutableArray * _btnContainer;
}

@property (nonatomic, strong) UIView * navView;
@property (nonatomic, strong) UIButton * rightBtn;
@property (nonatomic, strong) UIButton * leftBtn;
@property (nonatomic, strong) UIView * segView;
@property (nonatomic, strong) UILabel * titleLabel;

@end

@implementation BaseViewController

#pragma mark - control getter
- (UIView *)navView {
    if (!_navView) {
        _navView = ({
            UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen_Height, 64)];
            view.backgroundColor = UIColorFromRGB(0x3ca5c9);
            if (!self.isHiddenSeg && !self.isTitle) {
                [view addSubview:self.segView];
            }else {
                [view addSubview:self.titleLabel];
            }
            if (!self.isLeft) {
                [view addSubview:self.leftBtn];
            }
            if (!self.isRight) {
                [view addSubview:self.rightBtn];
            }
            view;
        });
    }
    return _navView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = ({
            UILabel * label = [[UILabel alloc] init];
            label.center = CGPointMake(UIScreen_Width / 2, 43);
            label.bounds = CGRectMake(0, 0, 180, 30);
            label.text = self.titleText;
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont systemFontOfSize:20];
            label.textAlignment = NSTextAlignmentCenter;
            label;
        });
    }
    return _titleLabel;
}
- (UIView *)segView {
    if (!_segView) {
        _segView = ({
            _btnContainer = [NSMutableArray array];
            UIView * view = [[UIView alloc] init];
            view.center = CGPointMake(UIScreen_Width / 2, 43);
            view.layer.borderWidth = 1.3;
            view.layer.cornerRadius = 15;
            view.layer.borderColor = [UIColor whiteColor].CGColor;
            view.bounds = CGRectMake(0, 0, 180, 30);
            view.layer.masksToBounds = YES;
            view.backgroundColor = [UIColor clearColor];
            for (int i = 0; i < 2; i ++) {
                UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(90 * i, 0, 90, 30)];
                [btn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateSelected];
                [btn setTitleColor:UIColorFromRGB(0x3489a6) forState:UIControlStateNormal];
                if (i == 0) {
                    btn.backgroundColor = UIColorFromRGB(0x50c4f0);
                    btn.selected = YES;
                }else {
                    btn.backgroundColor = UIColorFromRGB(0x3ca5c9);
                    btn.selected = NO;
                }
                btn.tag = 10 + i;
                [btn setTitle:self.segTitle[i] forState:UIControlStateNormal];
                btn.titleLabel.font = [UIFont systemFontOfSize:15];
                [view addSubview:btn];
                [_btnContainer addObject:btn];
                [btn addTarget:self action:@selector(segBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            }
            UILabel * lable = [[UILabel alloc] initWithFrame:CGRectMake(90 - 0.75, 0, 1.5, 30)];
            lable.backgroundColor = [UIColor whiteColor];
            [view addSubview:lable];
            view;
        });
    }
    return _segView;
}
- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = ({
            UIButton * btn = [[UIButton alloc] init];
            btn.bounds = CGRectMake(0, 0, 30, 30);
            btn.center = CGPointMake(29, 43);
            NSString * str = self.navItem[0];
            if ([str rangeOfString:@"_"].length == 1) {
                [btn setBackgroundImage:[UIImage imageNamed:str] forState:UIControlStateNormal];
            }else {
                [btn setTitle:str forState:UIControlStateNormal];
            }
            [btn addTarget:self action:@selector(navItemAction:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = 12;
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            btn;
        });
    }
    return _leftBtn;
}
- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = ({
            UIButton * btn = [[UIButton alloc] init];
            btn.bounds = CGRectMake(0, 0, 30, 30);
            btn.center = CGPointMake(UIScreen_Width - 29, 43);
            NSString * str = self.navItem[1];
            if ([str rangeOfString:@"_"].length == 1) {
                [btn setBackgroundImage:[UIImage imageNamed:str] forState:UIControlStateNormal];
            }else {
                [btn setTitle:str forState:UIControlStateNormal];
            }
            btn.tag = 13;
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            [btn addTarget:self action:@selector(navItemAction:) forControlEvents:UIControlEventTouchUpInside];
            btn;
        });
    }
    return _rightBtn;
}

#pragma mark - value getter
- (BOOL)isHiddenSeg {
    if (!_isHiddenSeg) {
        _isHiddenSeg = NO;
    }
    return _isHiddenSeg;
}
- (BOOL)isLeft {
    if (!_isLeft) {
        _isLeft = NO;
    }
    return _isLeft;
}
- (BOOL)isRight {
    if (!_isRight) {
        _isRight = NO;
    }
    return _isRight;
}
- (BOOL)isTitle {
    if (!_isTitle) {
        _isTitle = NO;
    }
    return _isTitle;
}
- (NSArray *)segTitle {
    if (!_segTitle) {
        _segTitle = [[NSArray alloc] initWithObjects:@"联系人",@"价值分组", nil];
    }
    return _segTitle;
}
/*
 *[0]left
 *[1]right
 */
- (NSArray *)navItem {
    if (!_navItem) {
        _navItem = [[NSArray alloc] initWithObjects:@"rinfo_no",@"add_btn", nil];
    }
    return _navItem;
}

#pragma mark - 按钮点击事件
- (void)segBtnAction:(UIButton *)sender {
    //切花按钮状态和背景颜色
    if (!self.isHiddenSeg) {
        UIButton * btn_f = _btnContainer[0];
        UIButton * btn_s = _btnContainer[1];
        if (sender.selected) {
            return;
        }
        if (sender != btn_f) {
            btn_f.selected = NO;
            sender.selected = YES;
            btn_f.backgroundColor = UIColorFromRGB(0x3ca5c9);
            sender.backgroundColor = UIColorFromRGB(0x50c4f0);
            return;
        }
        if (sender != btn_s) {
            btn_s.selected = NO;
            sender.selected = YES;
            btn_s.backgroundColor = UIColorFromRGB(0x3ca5c9);
            sender.backgroundColor = UIColorFromRGB(0x50c4f0);
            return;
        }
    }
}
- (void)navItemAction:(UIButton *)sender {
    if (sender.tag == 12) {
        EditContactViewController * edit = [[EditContactViewController alloc] init];
        [self.navigationController pushViewController:edit animated:YES];
    }
}

/*
 *!隐藏导航栏
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark ---------
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.navView];
}

@end
