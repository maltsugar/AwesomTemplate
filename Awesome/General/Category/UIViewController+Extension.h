//
//  UIViewController+Extension.h
//  NationalWealth
//
//  Created by qm on 2017/11/16.
//  Copyright © 2017年 欣亨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)

// 在底部添加一个空白视图，挡住上拉加载
- (void)addEmptyViewAdaptIPhoneX;

- (void)setNaviBarAlpha:(CGFloat)alpha;


- (void)setNaviBarTitleHidenAlpha:(CGFloat)alpha title:(NSString *)title;

// 重置为系统默认状态
- (void)resetSystemNavibar;

@end
