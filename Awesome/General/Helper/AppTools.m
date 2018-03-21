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
    
    
//    // 没有获取本地存储的 用户id 用户token
//    if (YES) {
//        [_tabBarController presentViewController:self.loginNav animated:NO completion:nil];
//    }
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
        LoginViewController *loginVC = [LoginViewController new];
        _loginNav = [[AWNavigationController alloc]initWithRootViewController:loginVC];
        loginVC.navigationController.navigationBarHidden = YES;
        
    }
    return _loginNav;
}




+ (void)showTipWithError:(NSError *)error
{
    if (error.code && error.localizedDescription.length) {
        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
        NSString *tip = [NSString stringWithFormat:@"错误码：%ld\n%@", (long)error.code, error.localizedDescription];
        [window jk_makeToast:tip duration:1 position:@"center"];
        
        if (@available(iOS 10.0, *)){
            if (error.code == -1009) {
                NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
                NSString *netTip = [NSString stringWithFormat:@"您好像未打开联网权限,\n请到'设置'->'%@'->开启'无线数据'", appName];
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:netTip preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *setting = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                }];
                UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:setting];
                [alert addAction:cancel];
                
                UIViewController *vc = window.rootViewController;
                if (window.rootViewController.presentedViewController) {
                    vc = window.rootViewController.presentedViewController;
                }
                [vc presentViewController:alert animated:YES completion:nil];
            }
        }
        
    }
}


@end



// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>公用配置<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


// 一些常量
NSString *const kInterfaceBizKey        = @"bizType";
NSString *const kUserIDKey              = @"TCS_USERID";
NSString *const kUserTokenKey           = @"TCS_USERTOKEN";


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

//PopOverVieConfiguration *defaultGrayBgConfig()
//{
//    PopOverVieConfiguration *config = [PopOverVieConfiguration new];
//    config.triAngelHeight = 0;
//    config.triAngelWidth = 0;
//    config.containerViewCornerRadius = 0;
//    config.roundMargin = 0;
//    config.isNeedAnimate = NO;
//    return config;
//}



float const AMSectionHeight = 12.f;
float const AMRowHeight = 60.f;

