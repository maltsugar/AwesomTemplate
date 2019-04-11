//
//  NSAttributedString+QMUILite.h
//  Awesome
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019 zgy. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (QMUILite)


/**
 * @brief 创建一个包含图片的 attributedString
 * @param image 要用的图片
 */
+ (instancetype)qmui_attributedStringWithImage:(UIImage *)image;

/**
 * @brief 创建一个包含图片的 attributedString
 * @param image 要用的图片
 * @param offset 图片相对基线的垂直偏移（当 offset > 0 时，图片会向上偏移）
 * @param leftMargin 图片距离左侧内容的间距
 * @param rightMargin 图片距离右侧内容的间距
 * @note leftMargin 和 rightMargin 必须大于或等于 0
 */
+ (instancetype)qmui_attributedStringWithImage:(UIImage *)image baselineOffset:(CGFloat)offset leftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin;

/**
 * @brief 创建一个用来占位的空白 attributedString
 * @param width 空白占位符的宽度
 */
+ (instancetype)qmui_attributedStringWithFixedSpace:(CGFloat)width;


@end

NS_ASSUME_NONNULL_END
