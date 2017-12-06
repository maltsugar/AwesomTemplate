//
//  ChangeURLViewController.m
//  TruckCreditStaff
//
//  Created by qm on 2017/12/6.
//  Copyright © 2017年 zgy. All rights reserved.
//

#import "ChangeURLViewController.h"

@interface ChangeURLViewController ()

@property (weak, nonatomic) IBOutlet UITextField *baseURLTF;
@property (weak, nonatomic) IBOutlet UITextField *pathTF;



@end

@implementation ChangeURLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AWConfigManager *config = [AWConfigManager sharedAWConfigManager];
    _baseURLTF.text = config.baseURL;
    _pathTF.text = config.path;
}


- (IBAction)handleCloseAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)handleConfirmAction
{
#ifdef DEBUG
    AWConfigManager *config = [AWConfigManager sharedAWConfigManager];
    config.baseURL = _baseURLTF.text;
    config.path = _pathTF.text;
    [HYBNetworking updateBaseUrl:[NSString stringWithFormat:@"%@/%@", config.baseURL, config.path]];
#endif
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
