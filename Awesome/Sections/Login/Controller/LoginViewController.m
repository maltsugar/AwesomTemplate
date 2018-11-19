//
//  LoginViewController.m
//  Awesome
//
//  Created by zgy on 2017/9/22.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_table;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"test log");
//
//    _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
//    _table.delegate = self;
//    _table.dataSource = self;
//    [self.view addSubview:_table];
//
//    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(UIEdgeInsetsMake(64+30, 0, 0, 0));
//    }];
//
//#ifdef __IPHONE_11_0
//    if ([_table respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
//        if (@available(iOS 11.0, *)) {
//            _table.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
//        } else {
//            // Fallback on earlier versions
//        }
//    }
//#endif
//
//    _table.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
//    _table.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
//
//
//    NSString *url = @"http://180.168.79.84/api/service";
//    NSDictionary *param = @{
//                            @"appName": @"qm",
//                            @"appVersion": @"IOS5.0.2",
//                            @"bizType": @"M090",
//                            @"customerId": @"100000432036",
//                            @"requestTime": @"20170927105013",
//                            @"token": @"506affe5-465f-411a-813f-ec3db97189af",
//                            @"version": @"4.0"
//                            };
//
//
//    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
//        request.server = url;
//        request.parameters = param;
//        request.requestSerializerType = kXMRequestSerializerJSON;
//    } onSuccess:^(id  _Nullable responseObject) {
//
//    } onFailure:^(NSError * _Nullable error) {
//
//    }];

}





- (void)headerRefresh
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_table.mj_header endRefreshing];
    });
}

- (void)footerRefresh
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_table.mj_footer endRefreshing];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.contentView.backgroundColor = kRandomColor;
    }
    return cell;
}

#pragma mark- IBActions

- (IBAction)handleLoginAction
{
    [MBProgressHUD showSuccess:@"登录中"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 模拟网络延迟
        [MBProgressHUD hideHUD];
        [[AppTools sharedAppTools] afterLoginSucceed];
    });
}




@end
