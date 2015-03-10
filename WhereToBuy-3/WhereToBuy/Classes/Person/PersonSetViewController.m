//
//  PersonSetViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-2.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "PersonSetViewController.h"
#import "Tools.h"
#import "DataCenter.h"
#import "PersonSetCell.h"
#import "RegisterViewController.h"
#import "PersonIntroViewController.h"

@interface PersonSetViewController()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSInteger _seconds;
    NSArray *_arr;
    BOOL _flag;//控制切换输入法键盘反复弹起
}

@property (weak, nonatomic) UITableView *table;

@end

@implementation PersonSetViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    self.title = @"个人设置";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideKeyBorard:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showKeyBorard:) name:UIKeyboardWillShowNotification object:nil];
    _flag = YES;
    _arr = @[@[@"昵称",@"真实姓名",@"性别",@"生日",@"账户密码",@"手势密码",@"个人简介"],@[@"Aladin",@"王麻子",@"男",@"1990-12-12",@"",@"",@"从事房地产多年,熟悉相关..."]];
    [self addUI];
}

- (void) addUI
{
    //个人头像
    UIButton *imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageBtn setFrame:CGRectMake(97.5, 83, 125, 125)];
    [imageBtn setTitle:@"上传头像" forState:UIControlStateNormal];
    [imageBtn setTitleEdgeInsets:UIEdgeInsetsMake(70, 0, 0, 0)];
    [imageBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [imageBtn setBackgroundImage:[UIImage imageNamed:@"moren.png"] forState:UIControlStateNormal];
    [imageBtn setBackgroundImage:[UIImage imageNamed:@"moren.png"] forState:UIControlStateHighlighted];
    imageBtn.clipsToBounds = YES;
    [Tools setUIViewLine:imageBtn cornerRadius:125 / 2.0f with:1 color:[UIColor lightGrayColor]];
    [self.view addSubview:imageBtn];
    
    //绑定手机标签
    UILabel *phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(13, imageBtn.frame.origin.y + imageBtn.frame.size.height + 13, 70, 40)];
    [phoneLabel setText:@"绑定手机"];
    [phoneLabel setFont:[UIFont systemFontOfSize:14]];
    [phoneLabel setTextColor:[UIColor lightGrayColor]];
    [self.view addSubview:phoneLabel];
    
    //手机号码输入框
    UITextField *phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(phoneLabel.frame.origin.x + phoneLabel.frame.size.width + 10, phoneLabel.frame.origin.y, 140, 40)];
    [phoneTextField setText:@"13812345678"];
    phoneTextField.delegate = self;
    [self.view addSubview:phoneTextField];
    
    //获取验证码按钮
    UIButton *getTokenBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [getTokenBtn setFrame:CGRectMake(phoneTextField.frame.origin.x + phoneTextField.frame.size.width, phoneTextField.frame.origin.y, 75, 40)];
    [getTokenBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [getTokenBtn setTitleColor:[Tools colorWithRed:53 angGreen:115 andBlue:254] forState:UIControlStateNormal];
    [getTokenBtn addTarget:self action:@selector(getTokenNum) forControlEvents:UIControlEventTouchUpInside];
    getTokenBtn.tag = 40;
    [self.view addSubview:getTokenBtn];
    
    //输入验证码的textField
    UITextField *tokenTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(phoneTextField.frame.origin.x, phoneTextField.frame.origin.y + phoneTextField.frame.size.height, phoneTextField.frame.size.width, phoneTextField.frame.size.height)];
    [tokenTextFiled setPlaceholder:@"请输入验证码"];
    tokenTextFiled.delegate = self;
    [self.view addSubview:tokenTextFiled];
    
    //提交按钮
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setFrame:CGRectMake(getTokenBtn.frame.origin.x, getTokenBtn.frame.origin.y+getTokenBtn.frame.size.height + 5, getTokenBtn.frame.size.width, getTokenBtn.frame.size.height - 10)];
    [submitBtn setTitle:@"确认" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitBtn setBackgroundImage:[UIImage imageNamed:@"1dian.png"] forState:UIControlStateNormal];
    [submitBtn setBackgroundImage:[UIImage imageNamed:@"red.png"] forState:UIControlStateHighlighted];
    [submitBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitBtn];
    
    //两个短的下划线
    for (NSInteger i = 0; i <= 1; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(phoneTextField.frame.origin.x, phoneTextField.frame.origin.y + phoneTextField.frame.size.height + i * 40, phoneTextField.frame.size.width + getTokenBtn.frame.size.width, 1)];
        [view setBackgroundColor:[UIColor lightGrayColor]];
        [self.view addSubview:view];
    }
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(10, tokenTextFiled.frame.origin.y + tokenTextFiled.frame.size.height - 40 + 1, 300, 280) style:UITableViewStylePlain];
    table.rowHeight = 40.0f;
    table.dataSource = self;
    table.delegate = self;
    table.scrollEnabled = NO;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table];
    _table = table;
}

//返回
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)getTokenNum
{
    _seconds = 60;
    [self updateSecondes];
    [UIView animateWithDuration:0.3 animations:^{
        [self.table setCenter:CGPointMake(self.table.center.x, self.table.center.y + 40)];
    }];
    NSLog(@"获取验证码");
}

//当用户点击申请验证码的时候，60秒后可以再次申请，期间秒数下降，时间到后恢复汉字，并且可以点击
-(void)updateSecondes{
    if (_seconds < 0)
    {
        [((UIButton *)[self.view viewWithTag:40]) setTitle:@"获取验证码" forState:UIControlStateNormal];//停止
        [((UIButton *)[self.view viewWithTag:40])  setTitleColor:[Tools colorWithRed:53 angGreen:115 andBlue:254] forState:UIControlStateNormal];
        [((UIButton *)[self.view viewWithTag:40]) setBackgroundColor:[UIColor whiteColor]];
        ((UIButton *)[self.view viewWithTag:40]).userInteractionEnabled = YES;
    }else
    {
        [((UIButton *)[self.view viewWithTag:40]) setTitle:[NSString stringWithFormat:@"%lds后请求",(long)_seconds] forState:UIControlStateNormal];
        [((UIButton *)[self.view viewWithTag:40]) setBackgroundColor:[UIColor whiteColor]];
        [self performSelector:@selector(updateSecondes) withObject:nil afterDelay:1];
        ((UIButton *)[self.view viewWithTag:40]).userInteractionEnabled = NO;
    }
    _seconds--;
}

//用户提交验证码，只要成功收起
- (void)submit
{
    _seconds = -1;//停止循环函数条件
    [UIView animateWithDuration:0.3 animations:^{
        [self.table setCenter:CGPointMake(self.table.center.x, self.table.center.y - 40)];
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cellID";
    PersonSetCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[PersonSetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell cellInitWithCell:_arr andIndex:indexPath.row];
    }
    if (indexPath.row == 4 || indexPath.row == 5 || indexPath.row == 6) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.tag = indexPath.row + 1;
    
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 4) {
        RegisterViewController *forgetSecret = [[RegisterViewController alloc] init];
        [self.navigationController pushViewController:forgetSecret animated:YES];
    }
    if(indexPath.row == 6)
    {
        PersonIntroViewController *personIntro = [[PersonIntroViewController alloc] init];
        [self.navigationController pushViewController:personIntro animated:YES];
    }
}

- (void)showKeyBorard:(NSNotification *)noti{
    if (_flag) {
        [UIView animateWithDuration:0.3 animations:^{
            [self.view setCenter:CGPointMake(self.view.center.x, self.view.center.y - 110)];
        }];
        _flag = NO;
    }
}

- (void)hideKeyBorard:(NSNotification *)noti{
    if (!_flag) {
        [UIView animateWithDuration:0.3 animations:^{
            [self.view setCenter:CGPointMake(self.view.center.x, self.view.center.y + 110)];
        }];
        _flag = YES;
    }
}

@end





