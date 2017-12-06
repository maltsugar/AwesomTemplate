//
//  AWConfigManager.m
//  Awesome
//
//  Created by qm on 2017/11/14.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "AWConfigManager.h"

@implementation AWConfigManager
singleton_implementation(AWConfigManager);


- (NSString *)baseURL
{
    if (nil == _baseURL) {
#if defined kConfigEnv_DEBUG
        _baseURL = @"http://192.168.0.1:8080";
#else
        _baseURL = @"http://www.xxxx.com";
#endif
    }
    return _baseURL;
}

- (NSString *)path
{
    if (nil == _path) {
#if defined kConfigEnv_DEBUG
         _path = @"demo/path";
#else
         _path = @"demo/path";
#endif
    }
    return _path;
}

@end
