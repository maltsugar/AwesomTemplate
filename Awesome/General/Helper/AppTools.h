//
//  AppTools.h
//  Awesome
//
//  Created by qm on 2017/10/11.
//  Copyright © 2017年 zgy. All rights reserved.
//  App管理类，包括弹出登录，取消登录，退出，保存用户信息

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Singleton.h"

@class PopOverVieConfiguration, BaseResonseModel;

typedef void(^GetCacheSizeComplete)(NSUInteger size);

@interface AppTools : NSObject
singleton_interface(AppTools);


- (void)startApp;

- (void)afterLoginSucceed;

// 未登录时强制登录
- (void)forceUserLoginAnimated:(BOOL)animated;

- (void)dismissLoginVC;

- (void)userLogoutSucceedWithTip:(NSString *)showTip presentLogin:(BOOL)login;


// 处理请求通用的情况
- (void)manageBaseResponseModle:(BaseResonseModel *)model;


// 切换tab
- (void)switchTabbarControllerIndex:(NSUInteger)index;


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
UIEdgeInsets deviceSafeInsets(void);
char *formattedLogDate(void);




// 弹出视图配置（用不到可删除）
//PopOverVieConfiguration *defaultGrayBgConfig();


// 一些常量
extern NSString *const kInterfaceBizKey;
extern NSString *const kUserIDKey;
extern NSString *const kUserTokenKey;
extern NSString *const kBadNetworkTip;




// "我的"页面，table的区高 行高
extern float const AMSectionHeight;
extern float const AMRowHeight;





