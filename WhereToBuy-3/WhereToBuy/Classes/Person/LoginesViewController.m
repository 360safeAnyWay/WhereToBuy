//
//  LoginesViewController.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/30.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "LoginesViewController.h"
#import "PhoneLonginViewController.h"
#import "MBProgressHUD.h"
@interface LoginesViewController ()

@end

@implementation LoginesViewController
- (void)viewWillAppear:(BOOL)animated
{
<<<<<<< HEAD
=======
    [super viewWillAppear:animated];
>>>>>>> parent of e1f60e4... d大是大非上的
    self.phoneText.text = @"";

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"手机输入";
    UIButton *itemBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(17, 5, 10.5, 18)];
    [itemBtn4 setBackgroundImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [itemBtn4 addTarget:self action:@selector(backPhone) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:itemBtn4];
    self.navigationItem.leftBarButtonItem= back;
    [self.nextButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)backPhone
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)btnClick:(UIButton *)btn
{
    if ([self validateNumber:self.phoneText.text] == NO)
    {
        SHOWALERT(@"手机号不正确");
    }else{
        [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
        [[ServiceManage shareInstance] DidRequestToken:@{@"tel":self.phoneText.text} completion:^(ERROR_CODE code, id obj) {
            NSLog(@"%@",self.phoneText.text);
            NSLog(@"发送请求");
            [MBProgressHUD  hideHUDForView:[UIApplication sharedApplication].delegate.window animated:YES];
            [self pushPhoneLongin];
        }];
       
    }
}
- (void)pushPhoneLongin
{
    PhoneLonginViewController* pl = [[PhoneLonginViewController alloc]init];
    pl.phone = self.phoneText.text;
    [self.navigationController pushViewController:pl animated:YES];
}
-(BOOL)validateNumber:(NSString *)textString
{
    NSString * number = @"^1[3|4|5|7|8|][0-9]\\d{8}$";
    NSPredicate * numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",number];
    return [numberPre evaluateWithObject:textString];
}

@end
