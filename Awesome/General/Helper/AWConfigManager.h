//
//  AWConfigManager.h
//  Awesome
//
//  Created by qm on 2017/11/14.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface AWConfigManager : NSObject
singleton_interface(AWConfigManager);


@property (nonatomic,   copy) NSString *baseURL;
@property (nonatomic,   copy) NSString *path;

@end
