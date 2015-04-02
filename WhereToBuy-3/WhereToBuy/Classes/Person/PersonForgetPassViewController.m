//
//  PersonForgetPassViewController.m
//  WhereToBuy
//
//  Created by ywj on 15-4-1.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "PersonForgetPassViewController.h"
#import "DataCenter.h"
#import "UIButton+WJ.h"
@interface PersonForgetPassViewController ()
{
    NSInteger _seconds;
    NSInteger _token;//验证码
    UIButton *_itemBtn4;
}

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
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(220,95, 91, 28)];
    [btn setTitle:[[DataCenter instance] getStringForKey:@"getTokenNum"] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [btn setBackgroundImage:@"yanzhengma.png"];
    btn.tag = 4;
    [btn addTarget:self action:@selector(sendCode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [self.UpdataPasswd addTarget:self action:@selector(passwd:) forControlEvents:UIControlEventTouchUpInside];

}
-(void)sendCode:(UIButton *)btn
{
    if([self validateNumber:self.phoneText.text] == YES){    [[ServiceManage shareInstance]DidRequestTokenForget:@{@"tel":self.phoneText.text} completion:^(ERROR_CODE status, id obj) {
        _seconds = 60;
        if (status == ERROR_CODE_NONE) {
          [self updateSecondes];
           
        }else
        {
            [Tools showAlertView:obj[@"message"]];
        }

    }];
    }else{
        [Tools showAlertView:@"请输入正确的手机号"];
    }

}
-(void)updateSecondes{
    if (_seconds < 0)
    {
        [((UIButton *)[self.view viewWithTag:4]) setTitle:[[DataCenter instance] getStringForKey:@"getTokenNum"] forState:UIControlStateNormal];//停止
        [((UIButton *)[self.view viewWithTag:4]) setBackgroundImage:@"aniublank.png"];
        ((UIButton *)[self.view viewWithTag:4]).userInteractionEnabled = YES;
        _itemBtn4.hidden = NO;
    }else
    {
        [((UIButton *)[self.view viewWithTag:4]) setTitle:[NSString stringWithFormat:@"%lds后请求",(long)_seconds] forState:UIControlStateNormal];
        [((UIButton *)[self.view viewWithTag:4]) setBackgroundImage:nil];
        [((UIButton *)[self.view viewWithTag:4]) setBackgroundColor:[UIColor lightGrayColor]];
        [self performSelector:@selector(updateSecondes) withObject:nil afterDelay:1];
        ((UIButton *)[self.view viewWithTag:4]).userInteractionEnabled = NO;
    }
    _seconds--;
    
}
#pragma mark- 这是修改密码填写完成
- (void)passwd:(UIButton *)btn
{
    if ([self validateNumber:self.phoneText.text] == NO)
    {
        [Tools showAlertView:@"手机号错误"];
        return;
    }
    if ([self.passwd.text isEqualToString:@""]|| [self.notarizePasswd.text isEqualToString:@""]||[self.phoneText.text isEqualToString:@""]||[self.codePhone.text isEqualToString:@""])
    {
        [Tools showAlertView:@"手机号验证码密码都不能为空"];
        
        return;
        
    }else if (![self.notarizePasswd.text isEqualToString:self.passwd.text]){
        
        [Tools showAlertView:@"两次密码不一致"];
        
        return;
    }else
    {
    [[ServiceManage shareInstance]DidTokenForgetPasswd:@{@"tel":self.phoneText.text,@"code":self.codePhone.text,@"password":self.passwd.text} completion:^(ERROR_CODE status, id obj) {
        if (status == ERROR_CODE_NONE)
        {
            
            SHOWALERT(@"密码修改完成前去登陆");
        }else{
              [Tools showAlertView:obj[@"message"]];
             }

    }];
    }
}
//匹配手机号
-(BOOL)validateNumber:(NSString *)textString
{
    NSString * number = @"^1[3|4|5|7|8|][0-9]\\d{8}$";
    NSPredicate * numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",number];
    return [numberPre evaluateWithObject:textString];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
