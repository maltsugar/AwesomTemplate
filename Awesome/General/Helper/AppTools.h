//
//  AppTools.h
//  Awesome
//
//  Created by qm on 2017/10/11.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Singleton.h"

BOOL isIPhoneX(void);
char *formattedLogDate(void);


@interface AppTools : NSObject
singleton_interface(AppTools);


- (void)startApp;

- (void)afterLoginSucceed;

- (void)userLogoutSucceed;

@end
