//
//  NSString+Tools.m
//  Awesome
//
//  Created by qm on 2017/11/9.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "NSString+Tools.h"

@implementation NSString (Tools)


+ (BOOL)judgeNotEmptyFor:(NSString *)str
{
    if (![str isKindOfClass:[NSString class]]) {
        NSLog(@"⚠️⚠️⚠️判断的对象不是字符串⚠️⚠️⚠️");
        return NO;
    }else
    {
        if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
            return NO;
        }else if ([str isEqualToString:@"(null)"] ||
                  [str isEqualToString:@"null"] ||
                  [str isEqualToString:@"<null>"]
                  ) {
            return NO;
        }
    }
    
    return YES;
}

//+ (BOOL)judgeNotEmptyFor:(NSString *)str
//{
//    if (nil == str) {
//        return NO;
//    }else{
//        if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
//            return NO;
//        }else if ([str isEqualToString:@"(null)"] ||
//                  [str isEqualToString:@"null"] ||
//                  [str isEqualToString:@"<null>"]
//                  ) {
//            return NO;
//        }else
//        {
//            if ([[str class] isKindOfClass:[NSNumber class]] || [[str class] isKindOfClass:[NSNull class]]) {
//                return NO;
//            }
//
//        }
//    }
//
//
//
//    return YES;
//}

+ (BOOL)isEmptyString:(NSString *)str
{
    BOOL flag = [self judgeNotEmptyFor:str];
    return !flag;
}


+ (NSString *)formatDateWithTimeStamp:(NSTimeInterval)timestamp format:(NSString *)format
{
    if ([[NSString stringWithFormat:@"%.0f", timestamp] length] > 10) {
        timestamp = timestamp/1000;
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    return [formatter stringFromDate:date];
}

+ (NSString *)transferDateString:(NSString *)dateStr originFormat:(NSString *)ofmt toFormat:(NSString *)nfmt
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = ofmt;
    NSDate *date = [formatter dateFromString:dateStr];
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    formatter2.dateFormat = nfmt;
    return [formatter2 stringFromDate:date];
}

- (BOOL)isPhoneNumber
{
    NSString * regex = @"^1\\d{10}$";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
    
}

+ (NSString *)chineseWithInteger:(NSInteger)integer
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterRoundHalfDown;
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh_Hans"];
    NSString *string = [formatter stringFromNumber:@(integer)];
    return string;
}

@end
