//
//  VerticalButton.m
//  NationalWealth
//
//  Created by qm on 2017/11/2.
//  Copyright © 2017年 欣亨. All rights reserved.
//

#import "VerticalButton.h"

@implementation VerticalButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType
{
    VerticalButton *btn = [super buttonWithType:buttonType];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    return btn;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect titleRect = self.titleLabel.bounds;
    titleRect.size.width = self.bounds.size.width;
    self.titleLabel.bounds = titleRect;
    
    CGFloat midX = self.frame.size.width / 2;
    CGFloat midY = self.frame.size.height/ 2 ;
    self.titleLabel.center = CGPointMake(midX, midY + 20);
    self.imageView.center = CGPointMake(midX, midY - 15);
    
    
}


@end
