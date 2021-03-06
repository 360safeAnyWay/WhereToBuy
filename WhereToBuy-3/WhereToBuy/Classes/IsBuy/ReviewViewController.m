//
//  ReviewViewController.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/11.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "ReviewViewController.h"

@interface ReviewViewController ()
{
    UILabel * _labelView;
}

@end

@implementation ReviewViewController

- (void)viewDidLoad
{
    self.title = @"回复楼主";
    UIButton *itemBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(17, 5, 10.5, 18)];
    [itemBtn4 setBackgroundImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [itemBtn4 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:itemBtn4];
    self.navigationItem.leftBarButtonItem= back;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交回复" style:UIBarButtonItemStylePlain target:self action:@selector(submitIntro)];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self addUI];
    _labelView = [[UILabel alloc]initWithFrame:CGRectMake(20, 75, 150, 30)];
    _labelView.text = @"请输入回复内容";
    _labelView.textColor = [UIColor grayColor];
    [self.view addSubview:_labelView];

}

- (void)addUI
{
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20,10, self.view.frame.size.width - 40, 250)];
    [textView setFont:[UIFont systemFontOfSize:16]];
    textView.delegate = self;
    [self.view addSubview:textView];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    UIView * view = [[UIApplication sharedApplication].delegate.window viewWithTag:1975];
    view.alpha = 1;
}

- (void)submitIntro
{
    NSLog(@"提交回复");
}
#pragma mark-  开始输入
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;
{
    [_labelView removeFromSuperview];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
