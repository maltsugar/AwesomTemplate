//
//  AppDelegate.m
//  Awesome
//
//  Created by zgy on 2017/9/22.
//  Copyright © 2017年 zgy. All rights reserved.
//

/**
 用法提示
 HYBNetworking.m

 Line: 320、602  添加接口公共参数，如userID等
 Line: 371、465 附近，统一提示接口返回的错误信息

 */


#import "AppDelegate.h"
#import "AvoidCrash.h"
#import "IQKeyboardManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    // 设置根视图
    [[AppTools sharedAppTools] startApp];
    
    // 配置请求类，采用AWConfigManager不用宏 可以动态设置URL，便于调试
    AWConfigManager *config = [AWConfigManager sharedAWConfigManager];
    [HYBNetworking updateBaseUrl:[NSString stringWithFormat:@"%@/%@", config.baseURL, config.path]];
    [HYBNetworking setTimeout:30];
    [HYBNetworking enableInterfaceDebug:YES];
    
    // 设置键盘
    [[IQKeyboardManager sharedManager] setShouldResignOnTouchOutside:YES];
    
    
    
#ifdef DEBUG
#else
    // 防止崩溃
    [AvoidCrash makeAllEffective];
    NSArray *noneSelClassStrings = @[
                                     @"NSString"
                                     ];
    [AvoidCrash setupNoneSelClassStringsArr:noneSelClassStrings];
    //监听通知:AvoidCrashNotification, 获取AvoidCrash捕获的崩溃日志的详细信息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealwithCrashMessage:) name:AvoidCrashNotification object:nil];
#endif
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)dealwithCrashMessage:(NSNotification *)note {
    //注意:所有的信息都在userInfo中
    //你可以在这里收集相应的崩溃信息进行相应的处理(比如传到自己服务器)
//    NSLog(@"%@",note.userInfo);
}



@end
