//
//  NSAttributedString+QMUILite.m
//  Awesome
//
//  Created by mac on 2019/4/11.
//  Copyright © 2019 zgy. All rights reserved.
//

#import "NSAttributedString+QMUILite.h"

@implementation NSAttributedString (QMUILite)


+ (instancetype)qmui_attributedStringWithImage:(UIImage *)image {
    return [self qmui_attributedStringWithImage:image baselineOffset:0 leftMargin:0 rightMargin:0];
}

+ (instancetype)qmui_attributedStringWithImage:(UIImage *)image baselineOffset:(CGFloat)offset leftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin {
    if (!image) {
        return nil;
    }
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = image;
    attachment.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    NSMutableAttributedString *string = [[NSAttributedString attributedStringWithAttachment:attachment] mutableCopy];
    [string addAttribute:NSBaselineOffsetAttributeName value:@(offset) range:NSMakeRange(0, string.length)];
    if (leftMargin > 0) {
        [string insertAttributedString:[self qmui_attributedStringWithFixedSpace:leftMargin] atIndex:0];
    }
    if (rightMargin > 0) {
        [string appendAttributedString:[self qmui_attributedStringWithFixedSpace:rightMargin]];
    }
    return string;
}

+ (instancetype)qmui_attributedStringWithFixedSpace:(CGFloat)width {
    UIGraphicsBeginImageContext(CGSizeMake(width, 1));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [self qmui_attributedStringWithImage:image];
}



@end
