//
//  UIImage+Compress.h
//  CRM
//
//  Created by mac on 2019/5/23.
//  Copyright © 2019 翼点网络. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Compress)

// 压缩图片到指定大小(单位KB)
+ (NSData *)resetSizeOfImageData:(UIImage *)sourceImage maxSize:(NSInteger)maxSize;

// 调整图片分辨率/尺寸（等比例缩放）
+ (UIImage *)newSizeImage:(CGSize)size image:(UIImage *)sourceImage;


@end

NS_ASSUME_NONNULL_END
