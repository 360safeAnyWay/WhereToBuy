//
//  ExpertEvaluteDetailViewController.m
//  WhereToBuy
//
//  Created by ywj on 15-3-13.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "ExpertEvaluteDetailViewController.h"

@interface ExpertEvaluteDetailViewController ()

@end

@implementation ExpertEvaluteDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
}

//返回
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
