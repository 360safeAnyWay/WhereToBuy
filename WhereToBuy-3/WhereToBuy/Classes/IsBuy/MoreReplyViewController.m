//
//  MoreReplyViewController.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/12.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "MoreReplyViewController.h"

@interface MoreReplyViewController ()

@end

@implementation MoreReplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"回复楼主";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交回复" style:UIBarButtonItemStylePlain target:self action:@selector(submitIntro)];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    UIView * view = [[UIApplication sharedApplication].delegate.window viewWithTag:1975];
    view.alpha = 1;
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
