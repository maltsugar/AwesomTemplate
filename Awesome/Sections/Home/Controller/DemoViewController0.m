//
//  DemoViewController0.m
//  Awesome
//
//  Created by qm on 2017/11/13.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "DemoViewController0.h"

#import "ViewController1.h"
#import "ViewController2.h"


// test
#import "NSString+Tools.h"
#import "UIImage+JKColor.h"

@interface DemoViewController0 ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;



@end

@implementation DemoViewController0

- (void)viewDidLoad {
    [super viewDidLoad];
//    
//    
//    NSLog(@"%@", [NSString chineseWithInteger:1232321]);
//    
//    if ([NSString isEmptyString:@"null"]) {
//        NSLog(@"空");
//    }else
//    {
//        NSLog(@"字符串不为空");
//    }
//    
//    
//    UIImage *img = _imgView.image;
//    _imgView.image = [img tintedImageWithColor:[UIColor yellowColor]];
//    
//    NSLog(@"  ---%f  %f", kBottomSafeHeight , kTabBarHeight)
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
                    
  
    
    NSLog(@"%@    %@", self.navigationController, self.navigationController.viewControllers);
}


- (IBAction)pushNext {
    
    ViewController1 *vc1 = [ViewController1 new];
    ViewController2 *vc2 = [ViewController2 new];
    
    

    [self.navigationController pushViewController:vc1 animated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:vc2 animated:YES];
    });
   
    
}


- (void)dealloc
{
    NSLog(@"释放");
}

@end
