//
//  AWTabBarController.m
//  Awesome
//
//  Created by zgy on 2017/9/29.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "AWTabBarController.h"
#import "AWRootNavigationController.h"
#import "AWUserManager.h"


#import "DemoViewController0.h"
#import "DemoViewController1.h"
#import "DemoViewController2.h"

@interface AWTabBarController ()<UITabBarControllerDelegate>
{
    UIColor *_normalTextColor;
    UIColor *_selectedTextColor;
}
@end

@implementation AWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildViewControllers];
}

- (void)setupChildViewControllers
{
    _normalTextColor = kRGBColor(123, 123, 123);
    _selectedTextColor = kColorWithHex(0x26ab28);
    
    
    DemoViewController0 *vc0 = [DemoViewController0 new];
    [self setupChildVc:vc0 title:@"首页" image:@"tabbar_0" selectedImage:@"tabbar_0hl"];
    
    DemoViewController1 *vc1 = [DemoViewController1 new];
    [self setupChildVc:vc1 title:@"更多" image:@"tabbar_1" selectedImage:@"tabbar_1hl"];
    [vc1.view showEmptyView];
    
    DemoViewController2 *vc2 = [DemoViewController2 new];
    [self setupChildVc:vc2 title:@"我的" image:@"tabbar_2" selectedImage:@"tabbar_2hl"];
    
    NSArray *temp = @[vc0, vc1, vc2];
    
    
    NSMutableArray *navArr = @[].mutableCopy;
    for (UIViewController *v in temp) {
        AWRootNavigationController *nav = [[AWRootNavigationController alloc] initWithRootViewController:v];
        [navArr addObject:nav];
    }
    
    [self setViewControllers:navArr animated:NO];
    
    
    
    self.delegate = self;
    
    UITabBar.appearance.tintColor = _selectedTextColor;
    if (@available(iOS 10.0, *)) {
        UITabBar.appearance.unselectedItemTintColor = _normalTextColor;
    }
    
    
    // 去掉tabbar上方线
    //    self.tabBar.shadowImage = [UIImage jk_imageWithColor:kColorNaviLineGray];
    //    self.tabBar.backgroundImage = [UIImage jk_imageWithColor:[UIColor whiteColor]];
    
    //    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -2)];
}



- (void)resetChildViewControllers
{
    [self setViewControllers:nil animated:NO];
    [self setupChildViewControllers];
}


- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    BOOL flag = YES;
    //    if (selectedIndex == 1 || selectedIndex == 2 || selectedIndex == 4) {
    //        flag = [[AWUserManager sharedAWUserManager] isUserLogined];
    //        [[AppTools sharedTools] forceLoginAnimated:YES];
    //    }
    
    if (flag) {
        [super setSelectedIndex:selectedIndex];
    }
}

#pragma mark- UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    //    NSUInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    BOOL flag = YES;
    //    if (index == 1 || index == 2 || index == 4) {
    //        flag = [[AWUserManager sharedAWUserManager] isUserLogined];
    //        [[AppTools sharedTools] forceLoginAnimated:YES];
    //    }
    
    
    //    UIViewController *thirdVC = [tabBarController.viewControllers objectAtIndex:2];
    //    if (viewController == thirdVC) {
    //        PublishViewController *vc = [PublishViewController new];
    //        AWNavigationController *nav = [[AWNavigationController alloc] initWithRootViewController:vc];
    //        [self presentViewController:nav animated:YES completion:nil];
    //        return NO;
    //    }
    return flag;
}


#pragma mark- Helper
- (void)setupChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    if (kSystemVersion >= 7.0) {
        childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = kRGBColor(123, 123, 123);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = kColorWithHex(0x26ab28);
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
}

@end
