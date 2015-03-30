//
//  LoginesViewController.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/30.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "LoginesViewController.h"
#import "PhoneLonginViewController.h"
@interface LoginesViewController ()

@end

@implementation LoginesViewController
- (void)viewWillAppear:(BOOL)animated
{
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
#warning 发送求请求----------
        PhoneLonginViewController* pl = [[PhoneLonginViewController alloc]init];
        pl.phone = self.phoneText.text;
        [self.navigationController pushViewController:pl animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)validateNumber:(NSString *)textString
{
    NSString * number = @"^1[3|4|5|7|8|][0-9]\\d{8}$";
    NSPredicate * numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",number];
    return [numberPre evaluateWithObject:textString];
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
