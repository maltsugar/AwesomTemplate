//
//  ViewController2.m
//  Awesome
//
//  Created by zgy on 2021/7/14.
//  Copyright © 2021 zgy. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRandomColor;
    self.title = @"第3个页面";
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"%@   %@", self.navigationController, self.navigationController.viewControllers);
}

- (void)dealloc
{
    NSLog(@"222");
}

@end
