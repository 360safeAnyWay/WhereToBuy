//
//  UserNameViewController.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/30.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "UserNameViewController.h"
@interface UserNameViewController ()

@end

@implementation UserNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"资料填写";
    UIButton *itemBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(17, 5, 10.5, 18)];
    [itemBtn4 setBackgroundImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [itemBtn4 addTarget:self action:@selector(backPhone) forControlEvents:UIControlEventTouchUpInside];
    itemBtn4.hidden = YES;
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:itemBtn4];
    self.navigationItem.leftBarButtonItem= back;
    [self.registers addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}
- (void)btnClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)backPhone
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
