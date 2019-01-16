//
//  AppTools.m
//  Awesome
//
//  Created by qm on 2017/10/11.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "AppTools.h"
#import "AWRootNavigationController.h"
#import "LoginViewController.h"
#import "AWTabBarController.h"
#import "AWUserManager.h"
#import "XCFileManager.h"
#import "GYIntroductionView.h"
#import "Reachability.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@interface AppTools ()

@property (nonatomic, strong) AWTabBarController *tabBarController;
@property (nonatomic, strong) AWRootNavigationController *loginNav;
@property (nonatomic, strong) GYIntroductionView *introductionView;

@end

@implementation AppTools
singleton_implementation(AppTools);


- (void)startApp
{
    _tabBarController = [AWTabBarController new];
    kAppDelegate.window.rootViewController = _tabBarController;    
}



- (void)afterLoginSucceed
{
    // 保存用户id  token等
    [[AWUserManager sharedAWUserManager] saveUserInfo];
    
    [self dismissLoginVC];
}


- (void)forceUserLoginAnimated:(BOOL)animated
{
    // 没有获取本地存储的 用户id 用户token
    BOOL flag = [[AWUserManager sharedAWUserManager] isUserLogined];
    UIViewController *parentVC = _tabBarController;
    if (parentVC.presentedViewController) parentVC = parentVC.presentedViewController;
    
    if (!flag) {
        [parentVC presentViewController:self.loginNav animated:animated completion:nil];
    }
}

- (void)dismissLoginVC
{
    [self.loginNav dismissViewControllerAnimated:YES completion:nil];
    self.loginNav = nil;
}


- (void)userLogoutSucceedWithTip:(NSString *)showTip presentLogin:(BOOL)login
{
    // 清空用户id token等
    [[AWUserManager sharedAWUserManager] clearUserInfo];
    
    self.tabBarController.selectedIndex = 0;
    
    if (showTip.length) {
        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
        [window jk_makeToast:showTip duration:0.5 position:JKToastPositionCenter];
    }
    if (login) {
        [self forceUserLoginAnimated:YES];
    }
}


// 处理请求通用的情况
- (void)manageBaseResponseModle:(BaseResonseModel *)model
{
    if ([model.responseCode isEqualToString:kResponseLoginverdueCode]){
        [self userLogoutSucceedWithTip:nil presentLogin:YES];
    }else
    {
        // 统一提示接口返回错误信息
        if (![model.responseCode isEqualToString:kResponseSuccessCode] && model.responseMsg) {
            UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
            [window jk_makeToast:model.responseMsg duration:0.5 position:JKToastPositionCenter];
        }
    }
}


// 切换tab
- (void)switchTabbarControllerIndex:(NSUInteger)index
{
    [_tabBarController setSelectedIndex:index];
}


// 显示引导页
- (void)showIntrolductionPages;
{
    UIWindow *window = kAppDelegate.window;
    
    
    
    NSArray *imgNames = @[@"img_index_01bg", @"img_index_02bg", @"img_index_03bg"];
    GYIntroductionView *introductionView = [[GYIntroductionView alloc] initWithImgNames:imgNames bgImgNames:nil];
    [window addSubview:introductionView];
    self.introductionView = introductionView;
    
    
    UIButton *enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    enterButton.backgroundColor = [UIColor orangeColor];
    [enterButton setTitle:@"立即进入" forState:UIControlStateNormal];
    enterButton.bounds = CGRectMake(0, 0, 200, 60);
    enterButton.center = CGPointMake(kScreenWidth * 0.5, kScreenHeight - 160);
    introductionView.enterButton = enterButton;
    
    kWeakSelf(self);
    [introductionView setEnterBlock:^{
        kStrongSelf(self);
        [self.introductionView removeFromSuperview];
        self.introductionView = nil;
        
        NSString *lastIntrolVersion = [kAppVersion copy];
        [kUserDefaults setObject:lastIntrolVersion forKey:kLastShowIntrolductionVersionKey];
        [kUserDefaults synchronize];
    }];
    
}




- (AWRootNavigationController *)loginNav
{
    if (nil == _loginNav) {
        LoginViewController *loginVC = [LoginViewController new];
        _loginNav = [[AWRootNavigationController alloc]initWithRootViewController:loginVC];
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

/**
 缓存包括以下几个地方
 1. Cache 文件夹下的所有文件
 2. 不用获取了 SD 的图片缓存 (/Library/Caches/default/com.hackemist.SDWebImageCache.default)
 3. 请求缓存
 
 */
+ (void)getAllCacheSize:(GetCacheSizeComplete)block
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSUInteger totalSize = 0;
        
        NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        NSNumber *num = [XCFileManager sizeOfDirectoryAtPath:cachePath];
        totalSize += num.unsignedLongLongValue;
        // 请求的缓存 totalSize += 请求的缓存;
        
        
        // 计算完成回调
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            if (block) {
                block(totalSize);
            }
        });
    });
    
}

+ (void)clearAllCache:(void(^)())completion
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [XCFileManager clearCachesDirectory];
        // 清理请求的缓存
        
        if (completion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion();
            });
        }
    });
}



+ (NSString *)getNetconnTypeIsDetail:(BOOL)detail
{
    NSString *netconnType = @"";
    
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:// 没有网络
        {
            
            netconnType = @"no network";
        }
            break;
            
        case ReachableViaWiFi:// WIFI
        {
            netconnType = @"WIFI";
        }
            break;
            
        case ReachableViaWWAN:// 手机自带网络
        {
            if (detail) {
                // 获取手机网络类型
                CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
                
                NSString *currentStatus = info.currentRadioAccessTechnology;
                
                if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyGPRS"]) {
                    
                    netconnType = @"GPRS";
                }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyEdge"]) {
                    
                    netconnType = @"2.75G EDGE";
                }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyWCDMA"]){
                    
                    netconnType = @"3G";
                }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyHSDPA"]){
                    
                    netconnType = @"3.5G HSDPA";
                }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyHSUPA"]){
                    
                    netconnType = @"3.5G HSUPA";
                }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMA1x"]){
                    
                    netconnType = @"2G";
                }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORev0"]){
                    
                    netconnType = @"3G";
                }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORevA"]){
                    
                    netconnType = @"3G";
                }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORevB"]){
                    
                    netconnType = @"3G";
                }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyeHRPD"]){
                    
                    netconnType = @"HRPD";
                }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyLTE"]){
                    
                    netconnType = @"4G";
                }
            }else
            {
                netconnType = @"WWAN";
            }
        }
            break;
            
        default:
            break;
    }
    
    return netconnType;
}



@end



// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>公用配置<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


// 一些常量
NSString *const kInterfaceBizKey        = @"bizType";
NSString *const kUserIDKey              = @"TCS_USERID";
NSString *const kUserTokenKey           = @"TCS_USERTOKEN";
NSString *const kBadNetworkTip          = @"请求失败，请稍后重试";


BOOL isIPhoneX(void) {
    BOOL iPhoneX = NO;
    /// 先判断设备是否是iPhone/iPod
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return iPhoneX;
    }
    
    if (@available(iOS 11.0, *)) {
        /// 利用safeAreaInsets.bottom > 0.0来判断是否是iPhone X。
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            iPhoneX = YES;
        }
    }
    
    return iPhoneX;
}

CGFloat bottomSafeHeight(void)
{
    CGFloat safe = 0;
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        safe = mainWindow.safeAreaInsets.bottom;
    }
    return safe;
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

