//
//  VipEvaluteDetailViewContrller.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-14.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "VipEvaluteDetailViewContrller.h"
#import "Tools.h"
#import "NYSliderPopover.h"
#import "NavBackButton.h"
#import "VipEvaluteViewController.h"

@interface VipEvaluteDetailViewContrller()<VipEvaluteDelegate, UITextViewDelegate>
{
    UITextView *_evaluteText;//用来保存评论的内容
    NYSliderPopover *_slider;
    NSInteger _row;//记录是第几行跳转过来的
}
@end

@implementation VipEvaluteDetailViewContrller

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交评论" style:UIBarButtonItemStyleBordered target:self action:@selector(commit)];
    [self addUI];
}

//返回
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

//提交
- (void)commit
{
    NSLog(@"提交");
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:3];
    arr[0] = [NSString stringWithFormat:@"%ld",(long)_row];
    arr[1] = [NSString stringWithFormat:@"%f",(_slider.value / 0.1)];
    arr[2] = _evaluteText.text;
    [self.delegate refreshTableViewData:arr];
    [self.navigationController popViewControllerAnimated:YES];
}

//添加UI
- (void) addUI
{
    //评价内容输入文本
    UITextView *evaluteText = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width - 20, 206)];
    [evaluteText setText:@"请输入评价内容"];
    [evaluteText setFont:[UIFont systemFontOfSize:18]];
    [evaluteText setTextColor:[Tools colorWithRed:207 angGreen:207 andBlue:207]];
    [evaluteText setDelegate:self];
    [self.view addSubview:evaluteText];
    _evaluteText = evaluteText;
    
    //底部的分割条
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(evaluteText.frame.origin.x, evaluteText.frame.origin.y + evaluteText.frame.size.height, evaluteText.frame.size.width, 1)];
    [lineView setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:lineView];
    
    //给项目进行评分的提示文本
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, evaluteText.frame.origin.y + evaluteText.frame.size.height + 20, 150, 16)];
    [tipLabel setText:@"亲,给项目评个分呗"];
    [tipLabel setTextColor:[Tools colorWithRed:137 angGreen:137 andBlue:137]];
    [tipLabel setFont:[UIFont systemFontOfSize:16]];
    [tipLabel setTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:tipLabel];
    
    //滑动条
    NYSliderPopover *slider = [[NYSliderPopover alloc] initWithFrame:CGRectMake(45, tipLabel.frame.origin.y + tipLabel.frame.size.height + 25, self.view.frame.size.width - 90, 15)];
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    _slider = slider;
    
    [self updateSliderPopoverText];
}

- (void)sliderValueChanged:(id)sender
{
    [self updateSliderPopoverText];
}

//改变slider的文字
- (void)updateSliderPopoverText
{
    _slider.popover.textLabel.text = [NSString stringWithFormat:@"%ld", (long)(_slider.value / 0.1)];
}

//vipEvalute的代理方法，用户设置返回标题
- (void)setBackButtonTitle:(NSString *)str andRow:(NSInteger)row
{
    //自定义返回按钮
    NavBackButton *backBtn = [[NavBackButton alloc] initWithFrame:CGRectMake(0, 0, 105, 26)];
    [backBtn setImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [backBtn setTitle:str forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    _row = row;
}

//当textView获得焦点时候，textView中的文字消除
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"请输入评价内容"]) {
        [textView setText:@" "];
    }
}

@end
