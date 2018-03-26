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

@class PopOverVieConfiguration;

@interface AppTools : NSObject
singleton_interface(AppTools);


- (void)startApp;

- (void)afterLoginSucceed;

// 未登录时强制登录
- (void)forceUserLoginAnimated:(BOOL)animated;

- (void)dismissLoginVC;

- (void)userLogoutSucceed;

+ (void)showTipWithError:(NSError *)error;

@end



// 公用函数
BOOL isIPhoneX(void);
char *formattedLogDate(void);


// 弹出视图配置（用不到可删除）
//PopOverVieConfiguration *defaultGrayBgConfig();


// 一些常量
extern NSString *const kInterfaceBizKey;
extern NSString *const kUserIDKey;
extern NSString *const kUserTokenKey;





// "我的"页面，table的区高 行高
extern float const AMSectionHeight;
extern float const AMRowHeight;





