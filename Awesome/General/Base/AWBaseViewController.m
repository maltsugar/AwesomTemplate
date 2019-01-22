//
//  AWBaseViewController.m
//  Awesome
//
//  Created by mac on 2019/1/16.
//  Copyright © 2019 zgy. All rights reserved.
//

/**
 使用RTRootNavigationController时，要使用BaseViewContrller 统一定制导航
 
 */
#import "AWBaseViewController.h"



#define kAWNavBackImgName @"navigationbar_back"
//#define kAWBackIndicatorImage @"navi_back"

@interface AWBaseViewController ()

@end

@implementation AWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar *navBar = self.navigationController.navigationBar;
    
    // 这里定制统一的导航样式
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
   
    navBar.barTintColor = [UIColor redColor];
    navBar.tintColor = [UIColor whiteColor];
    navBar.translucent = YES;
    [navBar setTitleTextAttributes:dict];
    
}

- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action
{
//    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Back", nil)
//                                            style:UIBarButtonItemStylePlain
//                                           target:target
//                                           action:action];
    
    UIBarButtonItem *barBtnItem = [[UIBarButtonItem alloc] initWithImage:kImageNamed(kAWNavBackImgName) style:UIBarButtonItemStylePlain target:target action:action];
    
    return barBtnItem;
}




@end
