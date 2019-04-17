//
//  AWNotificationManager.m
//  Awesome
//
//  Created by mac on 2019/4/17.
//  Copyright © 2019 zgy. All rights reserved.
//

#import "AWNotificationManager.h"

@implementation AWNotificationManager


static AWNotificationManager *_instance;
+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    
    return _instance;
}

+ (instancetype)shared
{
    if (_instance == nil) {
        _instance = [[AWNotificationManager alloc] init];
    }
    
    return _instance;
}


- (void)setUP
{
    
}




@end
