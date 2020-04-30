//
//  DemoViewController2.m
//  Awesome
//
//  Created by qm on 2017/11/13.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "DemoViewController2.h"

@interface DemoViewController2 ()

@end

@implementation DemoViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [AppTools sharedTools].resetTabbarChildVCs = YES;

    [[AppTools sharedTools] userLogoutSucceedWithTip:@"退出登录" clearAll:YES presentLogin:YES];
}
    


@end
