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


- (void)clearUserInfo
{
    self.token = nil;
//    self.loginData = nil;
}

@end
