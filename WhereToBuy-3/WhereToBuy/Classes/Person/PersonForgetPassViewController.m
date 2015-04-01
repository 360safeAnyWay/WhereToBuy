//
//  PersonForgetPassViewController.m
//  WhereToBuy
//
//  Created by ywj on 15-4-1.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "PersonForgetPassViewController.h"

@interface PersonForgetPassViewController ()

@end

@implementation PersonForgetPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"修改密码";
    UIButton *itemBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(17, 5, 10.5, 18)];
    [itemBtn4 setBackgroundImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [itemBtn4 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:itemBtn4];
    self.navigationItem.leftBarButtonItem = back;
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
