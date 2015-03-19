//
//  PersonIntroViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-6.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "PersonIntroViewController.h"

@implementation PersonIntroViewController

- (void)viewDidLoad
{
    self.title = @"个人简介";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交简介" style:UIBarButtonItemStylePlain target:self action:@selector(submitIntro)];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self addUI];
}

- (void)addUI
{
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 0, self.view.frame.size.width - 40, self.view.frame.size.height)];
    [textView setText:@"请输入简介内容"];
    [textView setFont:[UIFont systemFontOfSize:16]];
    [textView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:textView];
    [textView becomeFirstResponder];
    _text = textView;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_text resignFirstResponder];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)submitIntro
{
    NSLog(@"提交注册");
}

@end
