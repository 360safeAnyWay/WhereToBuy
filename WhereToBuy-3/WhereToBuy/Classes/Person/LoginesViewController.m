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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.nextButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)btnClick:(UIButton *)btn
{
    if ([self validateNumber:self.phoneText.text] == NO)
    {
        SHOWALERT(@"手机号不正确");
    }else{
#warning 发送求请求----------
        PhoneLonginViewController* pl = [[PhoneLonginViewController alloc]init];
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
