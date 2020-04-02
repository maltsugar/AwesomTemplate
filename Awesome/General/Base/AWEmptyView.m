//
//  AWEmptyView.m
//  Pods
//
//  Created by zgy on 2020/4/2.
//

#import "AWEmptyView.h"

@implementation AWEmptyView

+ (instancetype)emptyViewView
{
    NSBundle *bd = [NSBundle mainBundle];
    NSArray *arr = [bd loadNibNamed:NSStringFromClass(self) owner:nil options:nil];
    return [arr lastObject];
}
@end
