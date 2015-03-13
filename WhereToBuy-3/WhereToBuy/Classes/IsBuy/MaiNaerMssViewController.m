//
//  MaiNaerMssViewController.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/13.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "MaiNaerMssViewController.h"

@interface MaiNaerMssViewController ()
{
    BOOL _isTop;
}

@end

@implementation MaiNaerMssViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于买哪儿";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    _isTop = YES;

    [self AddUI];
}
-(void)AddUI
{
    UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-([UIScreen mainScreen].bounds.size.width+50)/2, 90, [UIScreen mainScreen].bounds.size.width+50, 130)];
    image.image = [UIImage imageNamed:@"y3关于买哪儿logo.png"];
    [self.view addSubview:image];
    UIView *viewDown = [[UIView alloc] initWithFrame:CGRectMake(10,image.frame.origin.y+image.frame.size.height+30, [UIScreen mainScreen].applicationFrame.size.width-20, 1)];
    [viewDown setBackgroundColor:[Tools colorWithRed:236 angGreen:236 andBlue:236]];
    [self.view addSubview:viewDown];
    UILabel * lab = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-80, viewDown.frame.origin.y+15, 100, 30)];
    lab.text = @"当前版本";
    lab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lab];
    UILabel * IDLabel = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2+15, viewDown.frame.origin.y+15, 50, 30)];
    IDLabel.text = @"V1.0";
    IDLabel.textColor = [Tools colorWithRed:67 angGreen:210 andBlue:97];
    [self.view addSubview:IDLabel];
    UIView *viewLDown = [[UIView alloc] initWithFrame:CGRectMake(10,viewDown.frame.origin.y+60, [UIScreen mainScreen].applicationFrame.size.width-20, 1)];
    [viewLDown setBackgroundColor:[Tools colorWithRed:236 angGreen:236 andBlue:236]];
    [self.view addSubview:viewLDown];
    UIButton * btn  =[UIButton  buttonWithType:UIButtonTypeCustom];
    btn.frame =CGRectMake(15, viewLDown.frame.origin.y+15, [UIScreen mainScreen].bounds.size.width-30, 50);
    if (_isTop == NO)
    {
        [btn setTitle:@"暂  无  更  新" forState:UIControlStateNormal];
        btn.layer.cornerRadius = 5;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.backgroundColor = [Tools colorWithRed:206 angGreen:206 andBlue:206];

    }else{
        [btn setTitle:@"下  载  更  新" forState:UIControlStateNormal];
        btn.layer.cornerRadius = 5;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.backgroundColor = [Tools colorWithRed:67 angGreen:210 andBlue:97];
    }
        [self.view addSubview:btn];
    
}
-(void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
