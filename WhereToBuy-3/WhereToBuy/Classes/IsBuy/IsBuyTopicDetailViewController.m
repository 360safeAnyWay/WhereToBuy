//
//  IsBuyTopicDetailViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-27.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "IsBuyTopicDetailViewController.h"
#import "NavBackButton.h"

@implementation IsBuyTopicDetailViewController

- (void)viewDidLoad
{
    NavBackButton *backBtn = [[NavBackButton alloc] initWithFrame:CGRectMake(0, 0, 105, 26)];
    [backBtn setImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [backBtn setTitle:@"主题内容" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

//返回
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
