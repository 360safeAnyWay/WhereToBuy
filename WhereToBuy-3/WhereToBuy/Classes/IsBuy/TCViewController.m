//
//  TCViewController.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/18.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "TCViewController.h"

@interface TCViewController ()

@end

@implementation TCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    view.backgroundColor = [UIColor grayColor];
    view.alpha = 0.3;
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
