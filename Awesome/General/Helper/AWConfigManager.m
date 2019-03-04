//
//  AWConfigManager.m
//  Awesome
//
//  Created by qm on 2017/11/14.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "AWConfigManager.h"
#import "AWUserManager.h"


NSString * const XMNetworkErrorDomain = @"XMNetworkErrorDomain";

static NSError * XMNetworkErrorGenerator(NSInteger code, NSString *msg) {
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: msg.length > 0 ? msg : @""};
    NSError * __autoreleasing error = [NSError errorWithDomain:XMNetworkErrorDomain code:code userInfo:userInfo];
    return error;
}



/// 是否允许修改后存本地，默认true
static BOOL _allowPersistent = YES;


// key
static NSString *_kAWConfigManagerBaseURLKey = @"kAWConfigManagerBaseURLKey";
static NSString *_kAWConfigManagerPathKey = @"kAWConfigManagerPathKey";


@implementation AWConfigManager

@synthesize baseURL = _baseURL, path = _path;

- (NSString *)baseURL
{
    if (nil == _baseURL) {
#if defined kConfigEnv_DEBUG
        _baseURL = @"http://192.168.1.48";
        //        _baseURL = @"http://192.168.2.114:8080";
        
        
        
        
        
        
        if (_allowPersistent) {
            NSString *info = [[NSUserDefaults standardUserDefaults] stringForKey:_kAWConfigManagerBaseURLKey];
            if (info.length > 0) {
                _baseURL = info;
            }
        }
        
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
        
        
        
        if (_allowPersistent) {
            NSString *info = [[NSUserDefaults standardUserDefaults] stringForKey:_kAWConfigManagerPathKey];
            if (info.length > 0) {
                _path = info;
            }
        }
        
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

#pragma mark- setters
- (void)setBaseURL:(NSString *)baseURL
{
    _baseURL = baseURL;
    if (_allowPersistent) {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:baseURL forKey:_kAWConfigManagerBaseURLKey];
        [ud synchronize];
    }
}

- (void)setPath:(NSString *)path
{
    _path = path;
    if (_allowPersistent) {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:path forKey:_kAWConfigManagerPathKey];
        [ud synchronize];
    }
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
    newParam[@"version"] = [AWConfigManager sharedConfigManager].apiVersion;
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



static AWConfigManager *_instance;
+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    
    return _instance;
}

+ (instancetype)sharedConfigManager
{
    if (_instance == nil) {
        _instance = [[AWConfigManager alloc] init];
        [_instance setup];
    }
    
    return _instance;
}

// 设置请求通用配置
- (void)setup
{
    kWeakSelf(self);
    
    // 网络请求全局配置
    [XMCenter setupConfig:^(XMConfig *config) {
        kStrongSelf(self);
        
        config.generalServer = [NSString stringWithFormat:@"%@/%@", self.baseURL, self.path];
        config.callbackQueue = dispatch_get_main_queue();
#ifdef DEBUG
        config.consoleLog = YES;
#endif
    }];
    
    // 对 app.kangzubin.com 域名下的接口做 SSL Pinning 验证
    [XMCenter addSSLPinningURL:@"https://app.kangzubin.com"];
    
    // 请求预处理插件
    [XMCenter setRequestProcessBlock:^(XMRequest *request) {
        kStrongSelf(self);
        
        // 在这里对所有的请求进行统一的预处理，如业务数据加密等
        if (self.apiVersion.length > 0) {
            NSMutableDictionary *headers = [[NSMutableDictionary alloc] initWithDictionary:request.headers];
            headers[@"version"] = self.apiVersion;
            request.headers = headers;
            request.timeoutInterval = 30;
        }
    }];
    
    // 响应后处理插件
    // 如果 Block 的返回值不为空，则 responseObject 会被替换为 Block 的返回值
    [XMCenter setResponseProcessBlock:^id(XMRequest *request, id responseObject, NSError *__autoreleasing * error) {
        // 在这里对请求的响应结果进行统一处理，如业务数据解密等
        if (![request.server isEqualToString:[NSString stringWithFormat:@"%@/%@", self.baseURL, self.path]]) {
            return nil;
        }
        if ([responseObject isKindOfClass:[NSDictionary class]] && [[responseObject allKeys] count] > 0) {
            NSInteger code = [responseObject[@"code"] integerValue];
            if (code != kXMSuccessCode) {
                // 网络请求成功，但接口返回的 Code 表示失败，这里给 *error 赋值，后续走 failureBlock 回调
                *error = XMNetworkErrorGenerator(code, responseObject[@"msg"]);
            } else {
                // 返回的 Code 表示成功，对数据进行加工过滤，返回给上层业务
                NSDictionary *resultData = responseObject[@"data"];
                return resultData;
            }
        }
        return nil;
    }];
    
    // 错误统一过滤处理
    [XMCenter setErrorProcessBlock:^(XMRequest *request, NSError *__autoreleasing * error) {
        // 比如对不同的错误码统一错误提示等
        
    }];
}

@end
