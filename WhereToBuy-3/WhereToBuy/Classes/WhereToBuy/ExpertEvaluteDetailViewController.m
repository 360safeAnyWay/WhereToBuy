//
//  ExpertEvaluteDetailViewController.m
//  WhereToBuy
//
//  Created by ywj on 15-3-13.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "ExpertEvaluteDetailViewController.h"
#import "NavBackButton.h"
#import "ExpertDetailViewCell.h"

@interface ExpertEvaluteDetailViewController ()

@end

@implementation ExpertEvaluteDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NavBackButton *backBtn = [[NavBackButton alloc] initWithFrame:CGRectMake(0, 0, 105, 26)];
    [backBtn setImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [backBtn setTitle:self.name forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

//返回
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
