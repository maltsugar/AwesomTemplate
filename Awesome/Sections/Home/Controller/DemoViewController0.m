//
//  DemoViewController0.m
//  Awesome
//
//  Created by qm on 2017/11/13.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "DemoViewController0.h"

@interface DemoViewController0 ()

@end

@implementation DemoViewController0

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)pushNext {
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = kRandomColor;
    [self.navigationController pushViewController:vc animated:YES];
}



@end
