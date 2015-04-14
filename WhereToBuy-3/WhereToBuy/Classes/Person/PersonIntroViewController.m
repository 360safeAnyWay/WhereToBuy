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
<<<<<<< HEAD
=======
    [super viewDidLoad];
>>>>>>> parent of e1f60e4... d大是大非上的
    self.title = @"个人简介";
    UIButton *itemBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(17, 5, 10.5, 18)];
    [itemBtn4 setBackgroundImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [itemBtn4 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:itemBtn4];
    self.navigationItem.leftBarButtonItem= back;
    
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
