//
//  UserNameViewController.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/30.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "UserNameViewController.h"
#import "Tools.h"
#import "ServiceManage.h"

@interface UserNameViewController ()

@end

@implementation UserNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"资料填写";
    UIButton *itemBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(17, 5, 10.5, 18)];
    [itemBtn4 setBackgroundImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
  //  [itemBtn4 addTarget:self action:@selector(backPhone) forControlEvents:UIControlEventTouchUpInside];
    itemBtn4.hidden = YES;
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:itemBtn4];
    self.navigationItem.leftBarButtonItem= back;
    [self.registers addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

//注册
- (void)btnClick
{
    if (self.userName.text.length == 0) {
        [Tools showAlertView:@"用户名不能为空"];
        return;
    }
    if (![self.passwd.text isEqualToString:self.notarizePasswd.text]) {
        [Tools showAlertView:@"密码不一致"];
        return;
    }
    if (self.passwd.text.length == 0 || self.notarizePasswd.text.length == 0) {
        [Tools showAlertView:@"密码不能为空"];
        return;
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
    [[ServiceManage shareInstance] DidRegister:@{@"tel":self.phoneNum,@"username":self.userName.text,@"password":self.passwd.text} completion:^(ERROR_CODE code, id obj) {
        NSLog(@"%@",obj);
    }];
}

//- (void)backPhone
//{
//    [self.navigationController popToRootViewControllerAnimated:YES];
//}

@end
