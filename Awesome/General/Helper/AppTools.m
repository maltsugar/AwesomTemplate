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




@implementation AppTools
singleton_implementation(AppTools);


+ (void)startApp
{
    AWNavigationController *nav = [[AWNavigationController alloc]initWithRootViewController: [LoginViewController new]];
    [self switchWindowRootViewController:nav];
}

+ (void)switchWindowRootViewController:(UIViewController *)rootVC
{
    kAppDelegate.window.rootViewController = rootVC;
}

+ (void)afterLoginSucceed
{
    // 保存用户id  token等
    
    AWTabBarController *tab = [AWTabBarController new];
    [self switchWindowRootViewController:tab];
}

+ (void)userLogoutSucceed
{
    // 清空用户id token等
    
}


@end
