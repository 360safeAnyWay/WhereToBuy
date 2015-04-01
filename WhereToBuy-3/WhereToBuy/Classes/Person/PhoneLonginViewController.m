//
//  PhoneLonginViewController.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/30.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "PhoneLonginViewController.h"
#import "DataCenter.h"
#import "UIButton+WJ.h"
#import "MBProgressHUD.h"
#import "UserNameViewController.h"
#import "MBProgressHUD.h"
@interface PhoneLonginViewController ()
{
    NSInteger _seconds;
    NSInteger _token;//验证码
    UIButton *_itemBtn4;


}

@end

@implementation PhoneLonginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"手机验证";
    [self.nextBtn addTarget:self action:@selector(nextBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self createBtn];

}

- (void)createBtn
{
    _itemBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(17, 5, 10.5, 18)];
    [_itemBtn4 setBackgroundImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [_itemBtn4 addTarget:self action:@selector(backPhone) forControlEvents:UIControlEventTouchUpInside];
    _itemBtn4.hidden = YES;
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:_itemBtn4];
    self.navigationItem.leftBarButtonItem= back;
    _seconds = 60;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(210,125, 91, 28)];
    [btn setTitle:[[DataCenter instance] getStringForKey:@"getTokenNum"] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [btn setBackgroundImage:@"yanzhengma.png"];
    btn.tag = 4;
    [btn addTarget:self action:@selector(requestToken) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [self updateSecondes];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    if (buttonIndex == 0)
    {
#warning 网络请求----------
        _seconds = 60;
        [self updateSecondes];
      //  [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//        [[ServiceManage shareInstance] DidRequestToken:@{@"tel":((UITextField *)[self.view viewWithTag:1]).text} completion:^(ERROR_CODE code, id obj) {
//            if (code == ERROR_CODE_NONE) {
//                NSLog(@"验证码－－－－－%@",obj[@"message"]);
//                _token = [obj[@"message"] intValue];
//                [Tools showAlertView:[[DataCenter instance] getStringForKey:@"successGetToken"]];
//            }else
//            {
//                [Tools showAlertView:obj[@"message"]];
//            }
//            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
       // }];

    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)backPhone
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)requestToken
{
    NSString * str = [NSString stringWithFormat:@"确认手机号是否正确\n%@",_phone];
    UIAlertView * alv = [[UIAlertView alloc]initWithTitle:@"小白提醒" message:str delegate:self cancelButtonTitle:@"正确" otherButtonTitles:@"错误,进行修改", nil];
    [alv show];
    
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
-(void)nextBtn:(id)btn
{
    [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
    [[ServiceManage  shareInstance]DidRerequestToken:@{@"tel":self.phone,@"code":self.codePhone.text} completion:^(ERROR_CODE code, id obj) {
        [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].delegate.window animated:YES];
        UserNameViewController * unv= [[UserNameViewController alloc]init];
        [self.navigationController pushViewController:unv animated:YES];
    }];
    
}

@end
