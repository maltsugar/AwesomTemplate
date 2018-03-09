//
//  UIViewController+Extension.m
//  NationalWealth
//
//  Created by qm on 2017/11/16.
//  Copyright © 2017年 欣亨. All rights reserved.
//

#import "UIViewController+Extension.h"
#import "UIImage+JKColor.h"

@implementation UIViewController (Extension)

- (void)addEmptyViewAdaptIPhoneX
{
    if (isIPhoneX()) {
        UIView *cover = [UIView new];
        cover.backgroundColor = self.view.backgroundColor;
        [self.view addSubview:cover];
        [cover mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(kBottomSafeHeight));
            make.leading.equalTo(@0);
            make.trailing.equalTo(@0);
            make.bottom.equalTo(@0);
        }];
    }
    
}

- (void)setNaviBarAlpha:(CGFloat)alpha
{
    UIImage *bgImg = [UIImage jk_imageWithColor:[[UIColor whiteColor] colorWithAlphaComponent:alpha]];
    UIImage *line = [UIImage jk_imageWithColor:[[UIColor lightGrayColor] colorWithAlphaComponent:alpha]];
    UINavigationBar *navBar = self.navigationController.navigationBar;
    [navBar setBackgroundImage:bgImg forBarMetrics:UIBarMetricsDefault];
    [navBar setShadowImage:line];
}


@end
