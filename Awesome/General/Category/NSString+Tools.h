//
//  NSString+Tools.h
//  Awesome
//
//  Created by qm on 2017/11/9.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Tools)

// 判断是否  非空
+ (BOOL)judgeNotEmptyFor:(NSString *)str;

// 判断是否  为空
+ (BOOL)isEmptyString:(NSString *)str;

// 将时间戳转成指定格式的日期字符串
+ (NSString *)formatDateWithTimeStamp:(NSTimeInterval)timestamp format:(NSString *)format;

// 将一种日期格式转为另一种格式，如：20180101   2018-01-01
+ (NSString *)transferDateString:(NSString *)dateStr originFormat:(NSString *)ofmt toFormat:(NSString *)nfmt;

// 是否是手机号码（宽松判断：1开头+10位数字）
- (BOOL)isPhoneNumber;

// 数字转中文
+ (NSString *)chineseWithInteger:(NSInteger)integer;
@end
