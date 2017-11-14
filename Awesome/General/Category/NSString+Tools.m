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
    BOOL flag = YES;
    if ([[str class] isKindOfClass:[NSString class]]) {
        
        if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
            flag = NO;
        }else
        {
            if ([str isEqualToString:@"(null)"] ||
                [str isEqualToString:@"null"] ||
                [str isEqualToString:@"<null>"]
                ) {
                flag = NO;
            }
        }
    }else
    {
        flag = NO;
        if (nil == str || NULL == str){
            flag = NO;
        }else if ([str isKindOfClass:[NSNull class]]) {
            flag = NO;
        }else
        {
#if DEBUG
            NSAssert([[str class] isKindOfClass:[NSString class]], @"你根本不是string类");
#endif
        }
        
    }
    
    return flag;
}

- (NSString *)formatDateWithTimeStamp:(NSTimeInterval)timestamp format:(NSString *)format
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    return [formatter stringFromDate:date];
}

- (NSString *)transferDateString:(NSString *)dateStr originFormat:(NSString *)ofmt toFormat:(NSString *)nfmt
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = ofmt;
    NSDate *date = [formatter dateFromString:dateStr];
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    formatter2.dateFormat = nfmt;
    return [formatter2 stringFromDate:date];
}


@end
