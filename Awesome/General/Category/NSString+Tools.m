//
//  NSString+Tools.m
//  Awesome
//
//  Created by qm on 2017/11/9.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "NSString+Tools.h"

static BOOL __stringDebug = NO;

@implementation NSString (Tools)


+ (BOOL)judgeNotEmptyFor:(NSString *)str strict:(BOOL)isStrict
{
    if (![str isKindOfClass:[NSString class]]) {
        NSMutableString *tipInfo = @"⚠️⚠️⚠️判断的对象不是字符串⚠️⚠️⚠️".mutableCopy;
        if (nil == str) {
            [tipInfo appendString:@", 是nil"];
        }
        
        if ([str isKindOfClass:[NSNull class]]) {
            [tipInfo appendString:@", 是NSNull对象"];
        }
        
        if (__stringDebug) NSLog(@"%@", tipInfo);
        return NO;
    }else
    {
        NSUInteger length = [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length];
        if (length == 0) {
            return NO;
        }else
        {
            if (isStrict) {
                if ([str isEqualToString:@"(null)"] ||
                    [str isEqualToString:@"null"] ||
                    [str isEqualToString:@"<null>"]
                    ) {
                    return NO;
                }
            }
        }

    }
    
    return YES;
}
+ (BOOL)judgeNotEmptyFor:(NSString *)str
{
    return [self judgeNotEmptyFor:str strict:NO];
}


+ (BOOL)isEmptyString:(NSString *)str strict:(BOOL)isStrict
{
    BOOL flag = [self judgeNotEmptyFor:str strict:isStrict];
    return !flag;
}
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

+ (NSArray<NSTextCheckingResult *> *)matchRegex:(NSString *)pattern inString:(NSString *)text
{
    if (!pattern || !text) {
        return @[];
    }
    
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    
    if (error) {
        NSLog(@"Error creating regular expression: %@", error.localizedDescription);
        return @[];
    }
    
    NSArray<NSTextCheckingResult *> *matches = [regex matchesInString:text options:0 range:NSMakeRange(0, [text length])];
    return matches;
}


- (void)wirteToDocumentfileName:(NSString *)fileName
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *docPath = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    NSURL *logPath = [docPath URLByAppendingPathComponent:fileName];
    
        
    // 写入文件
    NSError *error;
    BOOL success = [self writeToURL:logPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"文件写入失败 %@", error.localizedDescription);
    } else {
        NSLog(@"文件写入成功");
    }
}


@end
