//
//  AWUserManager.m
//  TruckCreditStaff
//
//  Created by qm on 2017/11/16.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "AWUserManager.h"
#import "Singleton.h"

@implementation AWUserManager
singleton_implementation(AWUserManager);


// 用户是否已登录
- (BOOL)isUserLogined
{
    // 获取用户token等
    
    return NO;
}


- (void)saveUserInfo
{
    // 保存用户信息
}

- (void)clearUserInfo
{
    self.token = nil;
//    self.loginData = nil;
}

@end
