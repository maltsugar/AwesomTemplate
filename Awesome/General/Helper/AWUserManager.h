//
//  AWUserManager.h
//  TruckCreditStaff
//
//  Created by qm on 2017/11/16.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "LoginData.h"

@interface AWUserManager : NSObject
singleton_interface(AWUserManager);

@property (nonatomic,   copy) NSString *account; // 账户
@property (nonatomic,   copy) NSString *customerId;
@property (nonatomic,   copy) NSString *token;
//@property (nonatomic, strong) LoginData *loginData;

// 用户是否已登录
- (BOOL)isUserLogined;

- (void)saveUserInfo;

- (void)clearUserInfo;

@end
