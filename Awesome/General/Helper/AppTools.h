//
//  AppTools.h
//  Awesome
//
//  Created by qm on 2017/10/11.
//  Copyright © 2017年 zgy. All rights reserved.
//  App管理类，包括弹出登录，取消登录，退出，保存用户信息

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class CPShowStyle, BaseResponseModel;

typedef void(^GetCacheSizeComplete)(NSUInteger size);
typedef void(^EmptyBlock)(void);




@interface AppTools : NSObject


@property (nonatomic,   copy) EmptyBlock loginSucceedBlock;
@property (nonatomic,   copy) EmptyBlock logoutSucceedBlock;
@property (nonatomic, strong) RTRootNavigationController *rooNav;


+ (instancetype)sharedTools;

- (void)startAppWithLoginPage:(BOOL)flag;

- (void)afterLoginSucceed;
 
    
/**
 判断是否需要强制登录

 @param animated 弹出登录页面是否需要动画
 @param removeTabbarController 是否移除TabbarController，YES则登录成功后全部重新加载
 @return 是否需要强制登录
 */
- (BOOL)forceLoginAnimated:(BOOL)animated removeTabbarController:(BOOL)removeTabbarController;



/// 退出登录
/// @param showTip 展示的提示
/// @param clearAll 是否清楚所有用户相关的信息，NO表示只清除内存中（适合有其他较安全的登录方式，比如 生物识别）
/// @param login 是否弹登录页
- (void)userLogoutSucceedWithTip:(NSString *)showTip clearAll:(BOOL)clearAll presentLogin:(BOOL)login removeTabbarController:(BOOL)removeTabbarController;

// 处理请求通用的情况
- (void)manageBaseResponseModle:(BaseResponseModel *)model;


// 切换tab
- (void)switchTabbarControllerIndex:(NSUInteger)index;

- (void)modifyTabBarHidden:(BOOL)hidden;


// 显示引导页
- (void)showIntrolductionPages;


+ (void)showTipWithError:(NSError *)error;


// 缓存相关 单位：byte
+ (void)getAllCacheSize:(GetCacheSizeComplete)block;
+ (void)clearAllCache:(void(^)())completion;

// 获取网络类型
+ (NSString *)getNetconnTypeIsDetail:(BOOL)detail;


@end



// 公用函数
BOOL isIPhoneX(void);
CGFloat bottomSafeHeight(void);

/// 设备安全区域
UIEdgeInsets deviceSafeInsets(void);

/// 处理过的安全区域，适合需要顶部适配刘海屏的情况
UIEdgeInsets deviceBanlancedSafeInsets(void);

char *formattedLogDate(void);




// 弹出视图配置（用不到可删除）
//CPShowStyle *defaultStyle();


// 一些常量
extern NSString *const kInterfaceBizKey;
extern NSString *const kUserIDKey;
extern NSString *const kUserTokenKey;
extern NSString *const kBadNetworkTip;




// "我的"页面，table的区高 行高
extern float const AMSectionHeight;
extern float const AMRowHeight;





