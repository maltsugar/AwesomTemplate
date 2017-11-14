//
//  AWNavigationController.m
//  Awesome
//
//  Created by qm on 2017/11/13.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "AWNavigationController.h"

@interface AWNavigationController ()

@end

@implementation AWNavigationController


+ (void)initialize
{
    // 导航
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.barTintColor = [UIColor redColor];
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [navBar setTitleTextAttributes:dict];
    
    
    // 设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置普通状态
    UIFont *font = [UIFont systemFontOfSize:15];
    NSDictionary *normalAttr = @{
                                 NSForegroundColorAttributeName: [UIColor whiteColor],
                                 NSFontAttributeName: font
                                 };
    [item setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    
    // 设置不可用状态
    NSDictionary *disableAttr = @{
                                  NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                  NSFontAttributeName: font
                                  };
    [item setTitleTextAttributes:disableAttr forState:UIControlStateDisabled];
    // 返回按钮
    [item setBackButtonBackgroundImage:[[UIImage imageNamed:@"backitem"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 40, 0, 0)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    // 设置文字，水平偏移到看不见的位置
    [item setBackButtonTitlePositionAdjustment:UIOffsetMake(-500, 0) forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

//- (void)back
//{
//    [self popViewControllerAnimated:YES];
//}



@end
