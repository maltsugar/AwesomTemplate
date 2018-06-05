//
//  SDWebImage+AWExtension.h
//  CamionFriends
//
//  Created by qm on 2018/6/5.
//  Copyright © 2018年 zgy. All rights reserved.
//

//#import <UIImageView+WebCache.h>
//#import <UIButton+WebCache.h>

#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"


@interface UIImageView (AWExtension)

- (void)aw_setImageWithURL:(nullable NSURL *)url;
- (void)aw_setImageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder;


@end




@interface UIButton (AWExtension)


- (void)aw_setImageWithURL:(nullable NSURL *)url forState:(UIControlState)state;
- (void)aw_setImageWithURL:(nullable NSURL *)url forState:(UIControlState)state placeholderImage:(nullable UIImage *)placeholder;


// BackgroundImage
- (void)aw_setBackgroundImageWithURL:(nullable NSURL *)url forState:(UIControlState)state;
- (void)aw_setBackgroundImageWithURL:(nullable NSURL *)url forState:(UIControlState)state placeholderImage:(nullable UIImage *)placeholder;


@end
