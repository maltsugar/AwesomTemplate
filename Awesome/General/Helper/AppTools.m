//
//  AppTools.m
//  Awesome
//
//  Created by qm on 2017/10/11.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "AppTools.h"
#import "AWNavigationController.h"
#import "LoginViewController.h"
#import "AWTabBarController.h"

BOOL isIPhoneX(void) {
    if ([UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        return CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size);
    }else{
        return NO;
    }
}

char *formattedLogDate(void)
{
    time_t rawtime;
    struct tm *timeinfo;
    static char buffer [128];
    time (&rawtime);
    timeinfo = localtime (&rawtime);
    strftime (buffer,sizeof(buffer),"%Y-%m-%d %H:%M:%S",timeinfo);
    return buffer;
}


@interface AppTools ()

@property (nonatomic, strong) AWTabBarController *tabBarController;
@property (nonatomic, strong) AWNavigationController *loginNav;

@end

@implementation AppTools
singleton_implementation(AppTools);


- (void)startApp
{
    _tabBarController = [AWTabBarController new];
    kAppDelegate.window.rootViewController = _tabBarController;
    
    
    // 没有获取本地存储的 用户id 用户token
    if (YES) {
        [_tabBarController presentViewController:self.loginNav animated:NO completion:nil];
    }
}



- (void)afterLoginSucceed
{
    // 保存用户id  token等
    
    
    [self.loginNav dismissViewControllerAnimated:YES completion:nil];
    self.loginNav = nil;
}

- (void)userLogoutSucceed
{
    // 清空用户id token等
    
    
    [_tabBarController presentViewController:self.loginNav animated:NO completion:nil];
}

- (AWNavigationController *)loginNav
{
    if (nil == _loginNav) {
        _loginNav = [[AWNavigationController alloc]initWithRootViewController: [LoginViewController new]];
        
    }
    return _loginNav;
}


@end
