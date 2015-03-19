//
//  FeedbackViewController.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/13.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()
{
    UILabel * _labelView;

}
@end

@implementation FeedbackViewController

- (void)viewDidLoad
{
    self.title = @"意见反馈";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交反馈" style:UIBarButtonItemStylePlain target:self action:@selector(submitIntro)];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self addUI];
    _labelView = [[UILabel alloc]initWithFrame:CGRectMake(20, 75, 150, 30)];
    _labelView.text = @"请输入反馈内容";
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
