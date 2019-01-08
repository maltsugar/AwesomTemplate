//
//  UIBarButtonItem+Extension.m
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
/**
 *  创建一个item
 *  
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage imageEdgeInsets:(UIEdgeInsets)insets
{
    UIButton *btn = [self buttonWithTarget:target action:action image:image highImage:highImage btnSize:CGSizeMake(40, 40) imageEdgeInsets:insets];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage itemSize:(CGSize)size imageEdgeInsets:(UIEdgeInsets)insets
{
    UIButton *btn = [self buttonWithTarget:target action:action image:image highImage:highImage btnSize:size imageEdgeInsets:insets];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIButton *)buttonWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage btnSize:(CGSize)size imageEdgeInsets:(UIEdgeInsets)insets
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 设置尺寸
    btn.size = size;
    btn.imageEdgeInsets = insets;
    return btn;
}


@end
