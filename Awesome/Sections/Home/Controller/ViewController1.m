//
//  ViewController1.m
//  Awesome
//
//  Created by zgy on 2021/7/14.
//  Copyright © 2021 zgy. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
    self.title = @"第2个页面";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"%@    %@", self.navigationController, self.navigationController.viewControllers);
}


- (void)dealloc
{
    NSLog(@"222");
}

@end
