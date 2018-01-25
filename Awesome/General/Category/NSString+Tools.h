//
//  NSString+Tools.h
//  Awesome
//
//  Created by qm on 2017/11/9.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Tools)

+ (BOOL)judgeNotEmptyFor:(NSString *)str;

- (NSString *)formatDateWithTimeStamp:(NSTimeInterval)timestamp format:(NSString *)format;

- (NSString *)transferDateString:(NSString *)dateStr originFormat:(NSString *)ofmt toFormat:(NSString *)nfmt;

- (BOOL)isPhoneNumber;

@end
