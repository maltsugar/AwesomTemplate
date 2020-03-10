//
//  BaseResponseModel.h
//  qm
//
//  Created by zgy on 2017/11/23.
//  Copyright © 2017年 zgy. All rights reserved.
//  接口响应基类

#import <Foundation/Foundation.h>

// 接口响应code
extern NSString *const kResponseSuccessCode;
extern NSString *const kResponseLoginverdueCode; // 登录过期（未登录）
extern NSString *const kResponseLoginPswErrorCode;
extern NSString *const kResponseTradePswErrorCode;
extern NSString *const kResponseFreezeCode;
extern NSString *const kResponseInvestTooMuchCode;


@interface BaseResponseModel : NSObject

@property (nonatomic,   copy) NSString *responseCode;
@property (nonatomic,   copy) NSString *responseMsg;
@property (nonatomic,   copy) NSString *responseTime;
@property (nonatomic,   copy) NSString *bizType;
@property (nonatomic,   copy) NSString *appName;

@end
