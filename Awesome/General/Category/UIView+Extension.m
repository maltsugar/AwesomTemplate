//
//  UIView+Extension.m
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "UIView+Extension.h"
#import <objc/runtime.h>
#import "AWEmptyView.h"


@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}


- (void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius>0;
}

- (CGFloat)cornerRadius{
    return self.layer.cornerRadius;
}

- (void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor{
    
    return [UIColor colorWithCGColor:self.layer.borderColor];
}


- (void)setBorderWidth:(CGFloat)borderWidth{
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth{
    return self.layer.borderWidth;
}

- (UIView *)emptyView
{
    UIView *v = objc_getAssociatedObject(self, _cmd);
    if (nil == v) {
        v = [AWEmptyView emptyView];
        self.emptyView = v;
    }
    return v;
}

- (void)setEmptyView:(UIView *)emptyView
{
    UIView *v = objc_getAssociatedObject(self, _cmd);
    if (v == emptyView) return;
    objc_setAssociatedObject(self,
                             @selector(emptyView),
                             emptyView,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)setCorners:(UIRectCorner)corners radius:(CGFloat)radi
{
    if (@available(iOS 11.0, *)) {
        CACornerMask _coner = 0;
        if (corners & UIRectCornerTopLeft) {
            _coner = (_coner | kCALayerMinXMinYCorner);
        }
        
        if (corners & UIRectCornerTopRight) {
            _coner = (_coner | kCALayerMaxXMinYCorner);
        }
        
        if (corners & UIRectCornerBottomLeft) {
            _coner = (_coner | kCALayerMinXMaxYCorner);
        }
        
        if (corners & UIRectCornerBottomRight) {
            _coner = (_coner | kCALayerMaxXMaxYCorner);
        }
        
        self.layer.cornerRadius = radi;
        self.layer.maskedCorners = _coner;
        
    } else {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radi, radi)];
        CAShapeLayer *mask = [CAShapeLayer layer];
        mask.frame = self.bounds;
        mask.path = path.CGPath;
        self.layer.mask = mask;
    }
    
}


- (void)setShadow:(UIColor *)color offset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius
{
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.bounds];
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
    self.layer.shadowPath = shadowPath.CGPath;
}

- (void)showEmptyView
{
    [self addSubview:self.emptyView];
    [self.emptyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
- (void)hideEmptyView
{
    [self.emptyView removeFromSuperview];
}




@end
