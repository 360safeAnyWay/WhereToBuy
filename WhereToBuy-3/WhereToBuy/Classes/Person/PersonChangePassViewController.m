//
//  PersonChangePassViewController.m
//  WhereToBuy
//
//  Created by ywj on 15-4-2.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "PersonChangePassViewController.h"
#import "ServiceManage.h"
#import "Tools.h"

@interface PersonChangePassViewController ()

@end

@implementation PersonChangePassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"修改密码";
    
    UIButton *itemBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(17, 5, 10.5, 18)];
    [itemBtn4 setBackgroundImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [itemBtn4 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:itemBtn4];
    self.navigationItem.leftBarButtonItem= back;
    
    [self addUI];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addUI{
    [_changePassBtn addTarget:self action:@selector(changePassword) forControlEvents:UIControlEventTouchUpInside];
}

- (void)changePassword{
    if (_oldPassword.text.length == 0) {
        [Tools showAlertView:@"密码不能为空"];
        return;
    }
    if (![_password.text isEqualToString:_surePassword.text]) {
        [Tools showAlertView:@"输入的密码不一致"];
    }
    [[ServiceManage shareInstance] DidChangePasswd:@{@"oldpass":_oldPassword.text,@"password":_password.text} completion:^(ERROR_CODE status, id obj) {
        if (status == ERROR_CODE_NONE) {
            [self back];
        }else{
            [Tools showAlertView:obj[@"message"]];
        }
    }];
}

@end




