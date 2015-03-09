//
//  IsBuySendTopicViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-28.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "IsBuySendTopicViewController.h"
#import "NavBackButton.h"
#import "Tools.h"
#import "IsBuySearchViewController.h"

@interface IsBuySendTopicViewController()<UITextFieldDelegate, IsBuySearchViewControllerDelegate>

@property (weak, nonatomic) UITextField *titleTextfiled;
@property (weak, nonatomic)UITextView *contentView;//发表的内容
@property (weak, nonatomic) UILabel *numLabel;//剩余得字数
@property (assign, nonatomic) NSInteger tag;//表示是哪一个标签

@end

@implementation IsBuySendTopicViewController

- (void)viewDidLoad
{
    NavBackButton *backBtn = [[NavBackButton alloc] initWithFrame:CGRectMake(0, 0, 105, 26)];
    [backBtn setImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [backBtn setTitle:@"发表主题" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
    UIButton *itemBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(235, 5, 70, 30)];
    [itemBtn1 setTitle:@"提交内容" forState:UIControlStateNormal];
    [itemBtn1.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [itemBtn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [itemBtn1 addTarget:self action:@selector(sendTitle) forControlEvents:UIControlEventTouchUpInside];
    [Tools setUIViewLine:itemBtn1 cornerRadius:5 with:1 color:[Tools colorWithRed:209 angGreen:209 andBlue:209]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:itemBtn1];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self addUI];
    
    [self.titleTextfiled becomeFirstResponder];
}

- (void)addUI
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, 40)];
    [titleView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:titleView];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 39, self.view.frame.size.width, 1)];
    [lineView setBackgroundColor:[Tools colorWithRed:211 angGreen:211 andBlue:211]];
    [titleView addSubview:lineView];
    
    //textField输入框
    UITextField *titleTextfield = [[UITextField alloc] initWithFrame:CGRectMake(17, 11, 255, 18)];
    [titleTextfield setPlaceholder:@"标题:请输入标题"];
    [titleTextfield setTextColor:[Tools colorWithRed:195 angGreen:195 andBlue:195]];
    [titleTextfield addTarget:self action:@selector(autoTips:) forControlEvents:UIControlEventEditingChanged];
    [titleTextfield setDelegate:self];
    [titleView addSubview:titleTextfield];
    self.titleTextfiled = titleTextfield;
    
    //剩余的字数
    UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleTextfield.frame.origin.x + titleTextfield.frame.size.width, titleTextfield.frame.origin.y, 40, 15)];
    [numLabel setText:@"20字"];
    [numLabel setTextColor:[UIColor blackColor]];
    [titleView addSubview:numLabel];
    self.numLabel = numLabel;
    
    UIView *titleView2 = [[UIView alloc] initWithFrame:CGRectMake(0, titleView.frame.origin.y + titleView.frame.size.height, self.view.frame.size.width, 40)];
    [titleView2 setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:titleView2];
    
    //两个按钮
    UIButton *tokenBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [tokenBtn setFrame:CGRectMake(10, 8.5, 120, 25)];
    tokenBtn.tag = 1;
    [tokenBtn setTitle:@"#请选择标签" forState:UIControlStateNormal];
    [tokenBtn addTarget:self action:@selector(choseTokenLabel:) forControlEvents:UIControlEventTouchUpInside];
    [tokenBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [tokenBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 10)];
    [tokenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tokenBtn setBackgroundColor:[Tools colorWithRed:195 angGreen:195 andBlue:195]];
    [Tools setUIViewLine:tokenBtn cornerRadius:5 with:1 color:[Tools colorWithRed:195 angGreen:195 andBlue:195]];
    [titleView2 addSubview:tokenBtn];
    
    //两个按钮
    UIButton *tokenBtn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [tokenBtn2 setFrame:CGRectMake(tokenBtn.frame.origin.x + tokenBtn.frame.size.width + 10, 8.5, 120, 25)];
    tokenBtn2.tag = 2;
    [tokenBtn2 setTitle:@"#请选择标签" forState:UIControlStateNormal];
    [tokenBtn2 addTarget:self action:@selector(choseTokenLabel:) forControlEvents:UIControlEventTouchUpInside];
    [tokenBtn2.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [tokenBtn2 setTitleEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 10)];
    [tokenBtn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [tokenBtn2 setBackgroundColor:[Tools colorWithRed:195 angGreen:195 andBlue:195]];
    [Tools setUIViewLine:tokenBtn2 cornerRadius:5 with:1 color:[Tools colorWithRed:195 angGreen:195 andBlue:195]];
    [titleView2 addSubview:tokenBtn2];
    
    UITextView *contentView = [[UITextView alloc] initWithFrame:CGRectMake(0, titleView2.frame.origin.y + titleView2.frame.size.height, self.view.frame.size.width, 210)];
    [contentView setText:@"请输入内容"];
    [contentView setFont:[UIFont systemFontOfSize:14]];
    [contentView setTextColor:[Tools colorWithRed:195 angGreen:195 andBlue:195]];
    [self.view addSubview:contentView];
    self.contentView = contentView;
}

// 返回按钮
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

//发表主题
- (void)sendTitle
{
    
}
#warning 数据测试会出问题吗?--------------------------------------------------------
//统计字数
- (void)autoTips:(id)sender
{
    NSInteger count = 0;
    if (self.titleTextfiled.text.length > 0) {
        for (NSInteger i = 0; i<self.titleTextfiled.text.length; i++) {
            unichar c = [self.titleTextfiled.text characterAtIndex:i];
            if (c >=0x4E00 && c <=0x9FA5)
            {
                count++;
                [self.numLabel setText:[NSString stringWithFormat:@"%ld字",(long)20 - count]];
            }
        }
    }
}

//选择标签
- (void)choseTokenLabel:(UIButton *)sender
{
    _tag = sender.tag;
    IsBuySearchViewController *searchToken = [[IsBuySearchViewController alloc] init];
    searchToken.flag = 1;
    searchToken.delegate = self;
    [self.navigationController pushViewController:searchToken animated:YES];
}

//删除标签
- (void)deleteToken:(UIButton *)sender
{
    [((UIButton *)sender.superview) setTitle:@"#请选择标签" forState:UIControlStateNormal];
    [((UIButton *)sender.superview) setBackgroundColor:[Tools colorWithRed:195 angGreen:195 andBlue:195]];
    //将自己删除出去
    [sender removeFromSuperview];
}

//IsBuySearchViewController代理方法
- (void)pushTagValue:(NSString *)str
{
    [((UIButton *)[self.view viewWithTag:_tag]) setTitle:str forState:UIControlStateNormal];
    [((UIButton *)[self.view viewWithTag:_tag]) setBackgroundColor:[UIColor orangeColor]];
    //小叉叉
    UIButton *xxBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [xxBtn setFrame:CGRectMake(90, 0, 33, 20)];
    [xxBtn setTitle:@"x" forState:UIControlStateNormal];
    [xxBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [xxBtn addTarget:self action:@selector(deleteToken:) forControlEvents:UIControlEventTouchUpInside];
    [[self.view viewWithTag:_tag] addSubview:xxBtn];
    
}

@end
