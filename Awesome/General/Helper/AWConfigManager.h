//
//  AWConfigManager.h
//  Awesome
//
//  Created by qm on 2017/11/14.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"






#define kConfigEnv_DEBUG
//#define kConfigEnv_RELEASE





@interface AWConfigManager : NSObject
singleton_interface(AWConfigManager);


@property (nonatomic,   copy) NSString *baseURL;
@property (nonatomic,   copy) NSString *path;

@property (nonatomic,   copy) NSString *OSSPolicyBaseURL;
@property (nonatomic,   copy) NSString *OSSPolicyPath;

// 接口版本
@property (readonly, copy) NSString *apiVersion;


// 公共参数
+ (NSDictionary *)convertToPublicParam:(NSDictionary *)orignParam;


@end
