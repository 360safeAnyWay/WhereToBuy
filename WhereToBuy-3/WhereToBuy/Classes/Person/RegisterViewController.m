//
//  RegisterViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-26.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "RegisterViewController.h"
#import "DataCenter.h"
#import "Tools.h"
#import "UIButton+WJ.h"
#import "ServiceManage.h"
#import "MBProgressHUD.h"

@interface RegisterViewController ()<UITextFieldDelegate>
{
    int _seconds;//多少秒后可以再次获取验证码
    int _token;//验证码
}
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"修改密码";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    [self addUI];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) addUI
{
    //两个TextField
    for (int i = 1; i <= 3; i++) {
        UITextField *text = [[UITextField alloc] initWithFrame:CGRectMake(20, 85 + (i-1)*52, self.view.frame.size.width - 40, 38)];
        text.tag = i;
        [Tools setUIViewLine:text cornerRadius:8 with:1 color:[Tools colorWithRed:207 angGreen:207 andBlue:207]];
        [self.view addSubview:text];
        if(i == 1)
        {
            text.placeholder = [[DataCenter instance] getStringForKey:@"insertPhoneNumTip"];
            text.keyboardType = UIKeyboardTypeNumberPad;
            text.returnKeyType = UIReturnKeyNext;
        }else if(i == 2)
        {
            text.placeholder = [[DataCenter instance] getStringForKey:@"insertSecretNumTip"];
            text.keyboardType = UIKeyboardTypeNumberPad;
            text.returnKeyType = UIReturnKeyNext;
//            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//            [btn setFrame:CGRectMake(180, 5, 91, 28)];
//            [btn setTitle:[[DataCenter instance] getStringForKey:@"getTokenNum"] forState:UIControlStateNormal];
//            btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
//            [btn setBackgroundImage:@"yanzhengma.png"];
//            btn.tag = 4;
//            [btn addTarget:self action:@selector(requestToken) forControlEvents:UIControlEventTouchUpInside];
//            [text addSubview:btn];
        }else if (i == 3)
        {
            text.placeholder = [[DataCenter instance] getStringForKey:@"insertSecretNumTip"];
            text.keyboardType = UIKeyboardTypeAlphabet;
            text.returnKeyType = UIReturnKeyDone;
            [text setDelegate:self];
            [text setSecureTextEntry:YES];
        }
    }
    //登录按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(20, [self.view viewWithTag:3].frame.origin.y + [self.view viewWithTag:2].frame.size.height + 15, self.view.frame.size.width - 40, 45)];
    [btn setTitle:@"修改密码" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goRegister) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:@"aniublank.png"];
    [self.view addSubview:btn];
    _loginBtn = btn;
}

//修改密码
- (void) goRegister
{
    if (((UITextField *)[self.view viewWithTag:1]).text.length == 0) {
        [Tools showAlertView:[[DataCenter instance] getStringForKey:@"insertPhoneNumTip"]];
        return;
    }
    if (_token != [((UITextField *)[self.view viewWithTag:2]).text intValue]) {
        [Tools showAlertView:[[DataCenter instance] getStringForKey:@"secretCantNull"]];
        return;
    }
    if (((UITextField *)[self.view viewWithTag:3]).text.length == 0) {
        [Tools showAlertView:[[DataCenter instance] getStringForKey:@"secretCantNull"]];
        return;
    }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[ServiceManage shareInstance] DidRegister:@{@"phone":((UITextField *)[self.view viewWithTag:1]).text,@"securitycode":((UITextField *)[self.view viewWithTag:2]).text,@"password":((UITextField *)[self.view viewWithTag:3]).text} completion:^(ERROR_CODE code, id obj) {
        if (code == ERROR_CODE_NONE) {
            [self.navigationController popViewControllerAnimated:YES];
        }else
        {
            [Tools showAlertView:obj[@"message"]];
        }
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];
}

////获取验证码
//- (void)requestToken
//{
//    _seconds = 60;
//    if (((UITextField *)[self.view viewWithTag:1]).text.length != 11) {
//        [Tools showAlertView:[[DataCenter instance] getStringForKey:@"insertPhoneNumTip"]];
//        return;
//    }
//    [self updateSecondes];
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    [[ServiceManage shareInstance] DidRequestToken:@{@"tel":((UITextField *)[self.view viewWithTag:1]).text} completion:^(ERROR_CODE code, id obj) {
//        if (code == ERROR_CODE_NONE) {
//            NSLog(@"验证码－－－－－%@",obj[@"message"]);
//            _token = [obj[@"message"] intValue];
//            [Tools showAlertView:[[DataCenter instance] getStringForKey:@"successGetToken"]];
//        }else
//        {
//            [Tools showAlertView:obj[@"message"]];
//        }
//        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//    }];
//}

////当用户点击申请验证码的时候，60秒后可以再次申请，期间秒数下降，时间到后恢复汉字，并且可以点击
//-(void)updateSecondes{
//    if (_seconds < 0)
//    {
//        [((UIButton *)[self.view viewWithTag:4]) setTitle:[[DataCenter instance] getStringForKey:@"getTokenNum"] forState:UIControlStateNormal];//停止
//        [((UIButton *)[self.view viewWithTag:4]) setBackgroundImage:@"aniublank.png"];
//        ((UIButton *)[self.view viewWithTag:4]).userInteractionEnabled = YES;
//    }else
//    {
//        [((UIButton *)[self.view viewWithTag:4]) setTitle:[NSString stringWithFormat:@"%lds后请求",(long)_seconds] forState:UIControlStateNormal];
//        [((UIButton *)[self.view viewWithTag:4]) setBackgroundImage:nil];
//        [((UIButton *)[self.view viewWithTag:4]) setBackgroundColor:[UIColor lightGrayColor]];
//        [self performSelector:@selector(updateSecondes) withObject:nil afterDelay:1];
//        ((UIButton *)[self.view viewWithTag:4]).userInteractionEnabled = NO;
//    }
//    _seconds--;
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end



