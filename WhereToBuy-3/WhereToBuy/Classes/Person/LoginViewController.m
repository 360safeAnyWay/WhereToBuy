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
#import "LoginesViewController.h"
#import "PersonForgetPassViewController.h"
<<<<<<< HEAD
=======
#import "LoginesViewController.h"
>>>>>>> parent of e1f60e4... d大是大非上的

@interface LoginViewController ()<UITextFieldDelegate>
{
    NSInteger _seconds;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.parentViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:[[DataCenter instance] getStringForKey:@"registerNow"] style:UIBarButtonItemStyleBordered target:self action:@selector(registerUser)];
<<<<<<< HEAD
    [self addUI];
}

=======
    UIButton *itemBtn5 = [[UIButton alloc] initWithFrame:CGRectMake(17, 5, 10.5, 18)];
    [itemBtn5 setBackgroundImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [itemBtn5 addTarget:self action:@selector(backPhone) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *isBuy = [[UIBarButtonItem alloc] initWithCustomView:itemBtn5];
    self.navigationItem.leftBarButtonItem =isBuy;
    UIButton *itemBtn3 = [[UIButton alloc] initWithFrame:CGRectMake(22, 5, 40, 17)];
    [itemBtn3 setTitle:@"注册" forState:UIControlStateNormal];
    [itemBtn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [itemBtn3 addTarget:self action:@selector(goRegister) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *isBuyes = [[UIBarButtonItem alloc] initWithCustomView:itemBtn3];
    self.navigationItem.rightBarButtonItem = isBuyes;

    [self addUI];
}
-(void)backPhone
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)goRegister
{
    LoginesViewController *lvc = [[LoginesViewController alloc]init];
    [self.navigationController pushViewController:lvc animated:YES];
}
>>>>>>> parent of e1f60e4... d大是大非上的
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
<<<<<<< HEAD
    NSLog(@"%@-----%@",phoneNum,secretStr);
    [[ServiceManage shareInstance] DidLogin:@{@"username":phoneNum,@"password":secretStr} completion:^(ERROR_CODE code, id obj) {
        if (code == ERROR_CODE_NONE) {
            [DataCenter instance].user = [[UserDao alloc] init];
            NSDictionary *dic = obj[@"data"];
            [DataCenter instance].user.token = dic[@"sessionval"];
            [self.delegate removeSelfFromSuperView];
        }else
        {
            [Tools showAlertView:obj[@"message"]];
        }
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
=======
    [[ServiceManage shareInstance] DidLogin:@{@"username":phoneNum,@"password":secretStr} completion:^(ERROR_CODE code, id obj) {
        if (code == ERROR_CODE_NONE) {
            NSDictionary *dic = obj[@"data"];
            [DataCenter instance].user = [[UserDao alloc] init];
            NSString * token = [dic  objectForKey:@"sessionval"];
            NSString * uid    = [dic objectForKey:@"uid"];
            [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"token"];
            [[NSUserDefaults standardUserDefaults] setObject:uid forKey:@"uid"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [DataCenter instance].user.token = dic[@"sessionval"];
            [self.delegate removeSelfFromSuperView];
            [self.navigationController popViewControllerAnimated:YES];
        }else
        {
            if (obj[@"message"] == nil)
            {
                SHOWALERT(@"网络请求失败,请查看网络状态!")
                [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                return ;
            }
            [Tools showAlertView:obj[@"message"]];
        }
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];

>>>>>>> parent of e1f60e4... d大是大非上的
    }];
}

//注册
- (void)registerUser{
    LoginesViewController * logines = [[LoginesViewController alloc]init];
    [self.navigationController pushViewController:logines animated:YES];
}

//重新找回密码
- (void)refindSecret
{
    PersonForgetPassViewController *forgetPass = [[PersonForgetPassViewController alloc] init];
    [self.navigationController pushViewController:forgetPass animated:YES];
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
