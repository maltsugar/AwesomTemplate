//
//  DemoViewController0.m
//  Awesome
//
//  Created by qm on 2017/11/13.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "DemoViewController0.h"


// test
#import "NSString+Tools.h"
#import "UIImage+JKColor.h"

@interface DemoViewController0 ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;



@end

@implementation DemoViewController0

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"%@", [NSString chineseWithInteger:1232321]);
    
    if ([NSString isEmptyString:@"null"]) {
        NSLog(@"空");
    }else
    {
        NSLog(@"字符串不为空");
    }
    
    
    UIImage *img = _imgView.image;
    _imgView.image = [img tintedImageWithColor:[UIColor yellowColor]];
    
    NSLog(@"  ---%f  %f", kBottomSafeHeight , kTabBarHeight)
}


- (IBAction)pushNext {
    UIViewController *vc = [AWBaseViewController new];
    
    
//    [self.rt_navigationController pushViewController:vc animated:YES];
    
    
    
    UIViewController *vc1 = [AWBaseViewController new];
    

    NSMutableArray *temp = [self.navigationController.viewControllers mutableCopy];
    [temp addObject:vc];
    [temp addObject:vc1];
    
    [self.navigationController setViewControllers:temp animated:YES];
    
    
    
    
    vc.view.backgroundColor = kRandomColor;
    vc.title = @"第二个页面";
    
    vc1.view.backgroundColor = kRandomColor;
    vc1.title = @"第3个页面";
    
    NSLog(@"%@   %@", self.navigationController, self.rt_navigationController);
}


- (void)dealloc
{
    NSLog(@"释放");
}

@end
