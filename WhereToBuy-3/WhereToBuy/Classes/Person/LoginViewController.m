//
//  LoginViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-26.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "LoginViewController.h"
#import "DataCenter.h"
#import "UIButton+WJ.h"
#import "ServiceManage.h"
#import "MBProgressHUD.h"
#import "Tools.h"
#import "UserDao.h"

@interface LoginViewController ()<UITextFieldDelegate>
{
    NSInteger _seconds;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.parentViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:[[DataCenter instance] getStringForKey:@"registerNow"] style:UIBarButtonItemStyleBordered target:self action:@selector(refindSecret)];
    [self addUI];
}

- (void) addUI
{
    UIView *loginView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 370)];
    [loginView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:loginView];
    _loginView = loginView;
    //logoImageView
    UIImage *image = [UIImage imageNamed:@"logocaise.png"];
    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - image.size.width)/2, 85, 115, 60)];
    [logoView setImage:image];
    [loginView addSubview:logoView];
    
    //两个TextField
    for (int i = 1; i <= 2; i++) {
        UITextField *text = [[UITextField alloc] initWithFrame:CGRectMake(20, logoView.frame.origin.y + logoView.frame.size.height + 20 + (i - 1)*52, self.view.frame.size.width - 40, 37)];
        text.tag = i;
        [Tools setUIViewLine:text cornerRadius:8 with:1 color:[Tools colorWithRed:207 angGreen:207 andBlue:207]];
        [loginView addSubview:text];
        if(i == 1)
        {
            text.placeholder = [[DataCenter instance] getStringForKey:@"insertPhoneNumTip"];
            text.keyboardType = UIKeyboardTypeNumberPad;
            text.returnKeyType = UIReturnKeyNext;
        }else
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
    [btn setFrame:CGRectMake(20, [self.view viewWithTag:2].frame.origin.y + [self.view viewWithTag:2].frame.size.height + 15, self.view.frame.size.width - 40, 45)];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:@"aniublank.png"];
    [loginView addSubview:btn];
    
    //忘记密码按钮
    UIImage *imageForget = [UIImage imageNamed:@"forget.png"];
    UIButton *forgetSecret = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetSecret setFrame:CGRectMake(0, 0, imageForget.size.width, imageForget.size.height)];
    [forgetSecret setCenter:CGPointMake(btn.center.x, btn.center.y + btn.frame.size.height / 2 + 22)];
    [forgetSecret setImage:imageForget forState:UIControlStateNormal];
    [forgetSecret setImage:imageForget forState:UIControlStateHighlighted];
    [forgetSecret setBackgroundColor:[UIColor whiteColor]];
    [forgetSecret addTarget:self action:@selector(refindSecret) forControlEvents:UIControlEventTouchUpInside];
    [loginView addSubview:forgetSecret];
    
    
    
    
    
    //忘记密码和注册得试图
    UIView *forgetView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.height, 370)];
    [forgetView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:forgetView];
    _forgetView = forgetView;
    
    //两个TextField
    for (int i = 1; i <= 3; i++) {
        UITextField *text = [[UITextField alloc] initWithFrame:CGRectMake(20, 85 + (i-1)*52, self.view.frame.size.width - 40, 38)];
        text.tag = i + 10;
        [Tools setUIViewLine:text cornerRadius:8 with:1 color:[Tools colorWithRed:207 angGreen:207 andBlue:207]];
        [forgetView addSubview:text];
        if(i == 1)
        {
            text.placeholder = [[DataCenter instance] getStringForKey:@"insertPhoneNumTip"];
            text.keyboardType = UIKeyboardTypeNumberPad;
            text.returnKeyType = UIReturnKeyNext;
        }else if(i == 2)
        {
            text.placeholder = [[DataCenter instance] getStringForKey:@"tokenNumWrong"];
            text.keyboardType = UIKeyboardTypeNumberPad;
            text.returnKeyType = UIReturnKeyNext;
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setFrame:CGRectMake(180, 5, 91, 28)];
            [btn setTitle:[[DataCenter instance] getStringForKey:@"getTokenNum"] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            [btn setBackgroundImage:@"yanzhengma.png"];
            btn.tag = 4;
            [btn addTarget:self action:@selector(requestToken) forControlEvents:UIControlEventTouchUpInside];
            [text addSubview:btn];
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
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setFrame:CGRectMake(20, [self.view viewWithTag:13].frame.origin.y + [self.view viewWithTag:13].frame.size.height + 15, self.view.frame.size.width - 40, 45)];
    [btn1 setTitle:@"确定" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(refindSecret) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setBackgroundImage:@"aniublank.png"];
    [forgetView addSubview:btn1];
    
}

//登录方法
- (void) login
{
    NSString *phoneNum = ((UITextField *)[self.view viewWithTag:1]).text;
    //先去除密码的空格，将用户的错误降低
    NSString *secretStr = ((UITextField *)[self.view viewWithTag:2]).text;
    secretStr = [secretStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (phoneNum.length != 11) {
        [Tools showAlertView:[[DataCenter instance] getStringForKey:@"phoneNumWrong"]];
        return;
    }
    if (secretStr.length == 0) {
        [Tools showAlertView:[[DataCenter instance] getStringForKey:@"secretCantNull"]];
        return;
    }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSLog(@"%@-----%@",phoneNum,secretStr);
    [[ServiceManage shareInstance] DidLogin:@{@"username":phoneNum,@"password":secretStr} completion:^(ERROR_CODE code, id obj) {
        if (code == ERROR_CODE_NONE) {
            [DataCenter instance].user = [[UserDao alloc] init];
            [self.delegate removeSelfFromSuperView];
        }else
        {
            [Tools showAlertView:obj[@"message"]];
        }
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];
//    if ([phoneNum isEqualToString:@"13812345678"] && [secretStr isEqualToString:@"123456"]) {
//        [DataCenter instance].user = [[UserDao alloc] init];
//        [self.delegate removeSelfFromSuperView];
//    }else
//    {
//        [Tools showAlertView:@"用户名或者密码错误！"];
//    }
}

//从忘记密码中返回
- (void)back
{
    self.parentViewController.navigationItem.leftBarButtonItem = nil;
    [UIView animateWithDuration:1.0f animations:^{
        [self.view bringSubviewToFront:_loginView];
        [_loginView setCenter:CGPointMake(_loginView.center.x + self.view.frame.size.width, _loginView.center.y)];
    } completion:^(BOOL finished) {
        [_forgetView setCenter:CGPointMake(_forgetView.center.x + self.view.frame.size.width, _forgetView.center.y)];
        self.parentViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:[[DataCenter instance] getStringForKey:@"registerNow"] style:UIBarButtonItemStyleBordered target:self action:@selector(refindSecret)];
    }];
}

- (void)refindSecret
{
    NSLog(@"找回密码");
    self.parentViewController.navigationItem.rightBarButtonItem = nil;
    [UIView animateWithDuration:1.0f animations:^{
        [self.view bringSubviewToFront:_forgetView];
        [_forgetView setCenter:CGPointMake(_forgetView.center.x - self.view.frame.size.width, _forgetView.center.y)];
    } completion:^(BOOL finished) {
        NSLog(@"结束了");
        [_loginView setCenter:CGPointMake(_loginView.center.x - self.view.frame.size.width, _loginView.center.y)];
        UIButton *itemBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(17, 5, 10.5, 18)];
        [itemBtn4 setBackgroundImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
        [itemBtn4 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:itemBtn4];
        self.parentViewController.navigationItem.leftBarButtonItem= back;
    }];
}

////现在去注册，push方式推入
//- (void)goRegister
//{
//    //    RegisterViewController *goRegister = [[RegisterViewController alloc] init];
//    //    [self.navigationController pushViewController:goRegister animated:YES];
//    LoginViewController *loginViewController = self.childViewControllers[0];
//    [UIView animateWithDuration:1.0f animations:^{
//        [loginViewController.view bringSubviewToFront:loginViewController.forgetView];
//        [loginViewController.forgetView setCenter:CGPointMake(loginViewController.forgetView.center.x - self.view.frame.size.width, loginViewController.forgetView.center.y)];
//    } completion:^(BOOL finished) {
//        NSLog(@"结束了");
//        [loginViewController.loginView setCenter:CGPointMake(loginViewController.loginView.center.x - self.view.frame.size.width, loginViewController.loginView.center.y)];
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
//        self.navigationItem.rightBarButtonItem = nil;
//    }];
//}

//获取验证码
- (void)requestToken
{
    _seconds = 60;
    if (((UITextField *)[self.view viewWithTag:1]).text.length != 11) {
        [Tools showAlertView:[[DataCenter instance] getStringForKey:@"insertPhoneNumTip"]];
        return;
    }
    [self updateSecondes];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
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
}

//当用户点击申请验证码的时候，60秒后可以再次申请，期间秒数下降，时间到后恢复汉字，并且可以点击
-(void)updateSecondes{
    if (_seconds < 0)
    {
        [((UIButton *)[self.view viewWithTag:4]) setTitle:[[DataCenter instance] getStringForKey:@"getTokenNum"] forState:UIControlStateNormal];//停止
        [((UIButton *)[self.view viewWithTag:4]) setBackgroundImage:@"aniublank.png"];
        ((UIButton *)[self.view viewWithTag:4]).userInteractionEnabled = YES;
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

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
