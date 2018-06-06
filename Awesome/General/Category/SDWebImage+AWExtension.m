//
//  SDWebImage+AWExtension.m
//  CamionFriends
//
//  Created by qm on 2018/6/5.
//  Copyright © 2018年 zgy. All rights reserved.
//

#import "SDWebImage+AWExtension.h"

//#import <UIImageView+WebCache.h>
//#import <UIButton+WebCache.h>

#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"


static SDWebImageOptions __sdImageOptions = SDWebImageAllowInvalidSSLCertificates;


@implementation UIImageView (AWExtension)

- (void)aw_setImageWithURL:(nullable NSURL *)url
{
    [self aw_setImageWithURL:url placeholderImage:nil];
}

- (void)aw_setImageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder
{
    [self sd_setImageWithURL:url placeholderImage:placeholder options:__sdImageOptions];
}

- (void)aw_setImageWithURL:(nullable NSURL *)url
          placeholderImage:(nullable UIImage *)placeholder
                  progress:(nullable SDWebImageDownloaderProgressBlock)progressBlock
                 completed:(nullable SDExternalCompletionBlock)completedBlock
{
    [self sd_setImageWithURL:url
            placeholderImage:placeholder
                     options:__sdImageOptions
                    progress:progressBlock
                   completed:completedBlock];
}

@end





@implementation UIButton (AWExtension)

- (void)aw_setImageWithURL:(nullable NSURL *)url forState:(UIControlState)state
{
    [self aw_setImageWithURL:url forState:state placeholderImage:nil];
}
- (void)aw_setImageWithURL:(nullable NSURL *)url forState:(UIControlState)state placeholderImage:(nullable UIImage *)placeholder
{
    [self sd_setImageWithURL:url forState:state placeholderImage:placeholder options:__sdImageOptions];
}


// BackgroundImage
- (void)aw_setBackgroundImageWithURL:(nullable NSURL *)url forState:(UIControlState)state
{
    [self aw_setBackgroundImageWithURL:url forState:state placeholderImage:nil];
}
- (void)aw_setBackgroundImageWithURL:(nullable NSURL *)url forState:(UIControlState)state placeholderImage:(nullable UIImage *)placeholder
{
    [self sd_setBackgroundImageWithURL:url forState:state placeholderImage:placeholder options:__sdImageOptions];
}

@end
