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
    UILabel                 * _labelView;
    CGFloat                   _deltaY;


}
@end

@implementation FeedbackViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.modalPresentationCapturesStatusBarAppearance = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.title = @"意见反馈";
    UIButton *itemBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(17, 5, 10.5, 18)];
    [itemBtn4 setBackgroundImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [itemBtn4 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:itemBtn4];
    self.navigationItem.leftBarButtonItem= back;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交反馈" style:UIBarButtonItemStylePlain target:self action:@selector(submitIntro)];
    [self.view setBackgroundColor:[UIColor grayColor]];
    [self addUI];
    _labelView = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 150, 30)];
    _labelView.text = @"请输入反馈内容";
    _labelView.textColor = [UIColor darkGrayColor];
    [self.view addSubview:_labelView];
}

- (void)addUI
{
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20,5, self.view.frame.size.width - 40, 150)];
    [textView setFont:[UIFont systemFontOfSize:16]];
    textView.backgroundColor = [UIColor whiteColor];
    textView.delegate = self;
    textView.layer.cornerRadius = 10;
    [self.view addSubview:textView];
    UITextField * tf = [[UITextField alloc]initWithFrame:CGRectMake(20, textView.frame.origin.y+textView.frame.size.height+10, self.view.frame.size.width-40, 40)];
    [tf setTextColor:kMainColor];
    tf.backgroundColor = [UIColor whiteColor];
    tf.layer.cornerRadius = 10;
    tf.placeholder = @"请输入联系方式";
    tf.delegate  = self;
    [self.view addSubview:tf];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField;           // became first responder
{
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
