//
//  AWConfigManager.m
//  Awesome
//
//  Created by qm on 2017/11/14.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "AWConfigManager.h"
#import "AWUserManager.h"

@implementation AWConfigManager
singleton_implementation(AWConfigManager);


- (NSString *)baseURL
{
    if (nil == _baseURL) {
#if defined kConfigEnv_DEBUG
        _baseURL = @"http://192.168.1.48";
        //        _baseURL = @"http://192.168.2.114:8080";
#endif
        
#if defined kConfigEnv_RELEASE
        _baseURL = @"https://op.51huochedai.com";
#endif
    }
    return _baseURL;
}

- (NSString *)path
{
    if (nil == _path) {
#if defined kConfigEnv_DEBUG
        _path = @"api/service";
#endif
        
#if defined kConfigEnv_RELEASE
        _path = @"api/service";
#endif
    }
    return _path;
}

- (NSString *)OSSPolicyPath
{
    if (nil == _OSSPolicyPath) {
#if defined kConfigEnv_DEBUG
        _OSSPolicyPath = @"op/oss/ossapptoken";
#endif
        
#if defined kConfigEnv_RELEASE
        _OSSPolicyPath = @"op/oss/ossapptoken";
#endif
    }
    return _OSSPolicyPath;
}

- (NSString *)OSSPolicyBaseURL
{
    if (nil == _OSSPolicyBaseURL) {
#if defined kConfigEnv_DEBUG
        _OSSPolicyBaseURL = self.baseURL;
#endif
        
#if defined kConfigEnv_RELEASE
        _OSSPolicyBaseURL = self.baseURL;
#endif
    }
    return _OSSPolicyBaseURL;
}


- (NSString *)apiVersion
{
    return @"1.0";
}


+ (NSDictionary *)convertToPublicParam:(NSDictionary *)orignParam
{
    // 公共报文
    NSMutableDictionary *newParam = @{}.mutableCopy;
    
    NSMutableDictionary *paramCopy = [NSMutableDictionary dictionaryWithDictionary:orignParam];
    for (NSString *key in paramCopy.allKeys) {
        if ([key isEqualToString:kInterfaceBizKey]) {
            [paramCopy removeObjectForKey:key];
        }
    }
    
    NSString *version = kAppVersion;
    NSDateFormatter *dateFmt = [NSDateFormatter new];
    dateFmt.dateFormat = @"yyyyMMddHHmmss";
    NSString *time = [dateFmt stringFromDate:[NSDate date]];
    
    
    newParam[@"appName"] = @"qm";
    newParam[@"version"] = [AWConfigManager sharedAWConfigManager].apiVersion;
    newParam[@"appVersion"] = [NSString stringWithFormat:@"iOS%@",version];
    newParam[@"requestTime"] = time;
    newParam[kInterfaceBizKey] = orignParam[kInterfaceBizKey];
    newParam[@"data"] = paramCopy;
    
    NSString *customerId = [AWUserManager sharedAWUserManager].customerId;
    NSString *token = [AWUserManager sharedAWUserManager].token;
    if (customerId) {
        newParam[@"customerId"] = customerId;
    }
    if (token) {
        newParam[@"token"] = token;
    }
    
    return newParam;
}


@end
