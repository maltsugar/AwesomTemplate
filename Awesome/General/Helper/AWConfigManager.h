//
//  AWConfigManager.h
//  Awesome
//
//  Created by qm on 2017/11/14.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, XMNetworkErrorCode) {
    kXMSuccessCode = 0,      //!< 接口请求成功
    kXMErrorCode = 1,        //!< 接口请求失败
    kXMUnknownCode = -1,     //!< 未知错误
};




#define kConfigEnv_DEBUG
//#define kConfigEnv_RELEASE





@interface AWConfigManager : NSObject


@property (nonatomic,   copy) NSString *baseURL;
@property (nonatomic,   copy) NSString *path;

@property (nonatomic,   copy) NSString *OSSPolicyBaseURL;
@property (nonatomic,   copy) NSString *OSSPolicyPath;

// 接口版本
@property (readonly, copy) NSString *apiVersion;



+ (instancetype)sharedConfigManager;

// 公共参数
+ (NSDictionary *)convertToPublicParam:(NSDictionary *)orignParam;


@end
