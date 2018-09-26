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

//- (void)setNaviBarAlpha:(CGFloat)alpha
//{
//    UIImage *bgImg = [UIImage jk_imageWithColor:[[UIColor whiteColor] colorWithAlphaComponent:alpha]];
//    UIImage *line = [UIImage jk_imageWithColor:[[UIColor lightGrayColor] colorWithAlphaComponent:alpha]];
//    UINavigationBar *navBar = self.navigationController.navigationBar;
//    [navBar setBackgroundImage:bgImg forBarMetrics:UIBarMetricsDefault];
//    [navBar setShadowImage:line];
//}

- (void)setNaviBarAlpha:(CGFloat)alpha
{
    UIImage *bgImg = [UIImage jk_imageWithColor:[[UIColor whiteColor] colorWithAlphaComponent:alpha]];
//    UIImage *line = [UIImage jk_imageWithColor:[kColorNaviLineGray colorWithAlphaComponent:alpha]];
    UINavigationBar *navBar = self.navigationController.navigationBar;
    [navBar setBackgroundImage:bgImg forBarMetrics:UIBarMetricsDefault];
//    [navBar setShadowImage:line];
    
    UIButton *leftBtn = nil;
    if ([self.navigationItem.leftBarButtonItem.customView isKindOfClass:[UIButton class]]) {
        leftBtn = self.navigationItem.leftBarButtonItem.customView;
    }
    
    if (alpha > 0.9) {
//        NSDictionary *dict = @{NSForegroundColorAttributeName : kColorNaviText};
//        [navBar setTitleTextAttributes:dict];
        if (leftBtn) {
            [leftBtn setImage:kImageNamed(@"aw_naviBack_black") forState:UIControlStateNormal];
        }
        //        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
        
    }else
    {
        NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
        [navBar setTitleTextAttributes:dict];
        if (leftBtn) {
            //            [leftBtn setImage:kImageNamed(@"aw_naviBack_gray") forState:UIControlStateNormal];
            [leftBtn setImage:kImageNamed(@"aw_naviBack_white") forState:UIControlStateNormal];
            
        }
        
        //        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        
    }
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)setNaviBarTitleHidenAlpha:(CGFloat)alpha title:(NSString *)title
{
    [self setNaviBarAlpha:alpha];
    if (alpha > 0.9) {
        self.title = title;
    }else
    {
        self.title = nil;
    }
}


- (void)resetSystemNavibar
{
    UINavigationBar *navBar = self.navigationController.navigationBar;
    [navBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [navBar setShadowImage:nil];
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor darkTextColor]};
    [navBar setTitleTextAttributes:dict];
    [self setNeedsStatusBarAppearanceUpdate];
}

@end
