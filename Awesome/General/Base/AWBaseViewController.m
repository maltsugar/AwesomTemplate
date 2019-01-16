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

@interface AWBaseViewController ()

@end

@implementation AWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 这里定制统一的导航样式
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
   
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
    
}

- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action
{
    return [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Back", nil)
                                            style:UIBarButtonItemStylePlain
                                           target:target
                                           action:action];
}

@end
