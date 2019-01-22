//
//  AWRootNavigationController.m
//  Awesome
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019 zgy. All rights reserved.
//

#import "AWRootNavigationController.h"

@implementation AWRootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.useSystemBackBarButtonItem = YES;
}


- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.visibleViewController;
}

- (UIViewController *)childViewControllerForStatusBarHidden
{
    return self.visibleViewController;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers animated:(BOOL)animated
{
    if (viewControllers.count > 0) {
        int i = 0;
        for (UIViewController *vc in viewControllers) {
            if (i > 0) {
                vc.hidesBottomBarWhenPushed = YES;
            }
            i ++;
        }
    }
    [super setViewControllers:viewControllers animated:animated];
}

@end
