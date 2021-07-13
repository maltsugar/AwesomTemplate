//
//  DemoViewController1.m
//  Awesome
//
//  Created by qm on 2017/11/13.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "DemoViewController1.h"
#import "UIView+Extension.h"

@interface DemoViewController1 ()

@end

@implementation DemoViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view showEmptyView];
}
- (void)dealloc
{
    NSLog(@"释放");
}

@end
