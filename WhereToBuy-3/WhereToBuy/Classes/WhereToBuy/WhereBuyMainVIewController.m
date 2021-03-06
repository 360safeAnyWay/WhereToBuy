//
//  WhereBuyMainVIewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-29.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "WhereBuyMainVIewController.h"
#import "DataCenter.h"
#import "SelectCityViewController.h"
#import "MainViewController.h"
#import "SearchViewController.h"
#import "GTCommontHeader.h"
#import "DDMenuController.h"
#import "WBNavigationController.h"
#import "MainMoreViewController.h"
#import "NavBackButton.h"
#import "ServiceManage.h"

@interface WhereBuyMainVIewController()<SelectCityDelegate>

@property (weak, nonatomic) UIButton *cityNameBtn;
@property (assign, nonatomic) BOOL isPush;//防止点击按钮，多次进行push操作

@end

@implementation WhereBuyMainVIewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [[DataCenter instance] getStringForKey:@"whereBuyMainNavTitle"];
    [self addUI];
    
    [[ServiceManage shareInstance] DidConnectServer:@{} completion:^(ERROR_CODE code, id obj) {
        
    }];
    
    //测试我的微软雅黑font字体
    UIFont *font = [UIFont fontWithName:@"wyyh" size:18];
    NSLog(@"我需要的字体是微软雅黑%@",font);
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _isPush = NO;
    NSString *cityName = [[NSUserDefaults standardUserDefaults] objectForKey:@"city"];//每次在搜索视图或者搜索详情视图中选择的城市，在主界面再次启动的时候设置为该城市
    [self.cityNameBtn setTitle:cityName forState:UIControlStateNormal];
}

- (void)addUI
{
    UIImageView *imageView = [[UIImageView alloc] init];//459是iphoone5得iamge高度
    [imageView setFrame:CGRectMake(0, 64, self.view.frame.size.width, [UIScreen mainScreen].applicationFrame.size.height - 88)];//设置对应手机的高度
    NSLog(@"gaodushi%f",imageView.frame.size.height);
    NSLog(@"originzai%f",imageView.frame.origin.y);
    NSLog(@"view de gao du %f",self.view.frame.size.height);
    [imageView setImage:[UIImage imageNamed:[[DataCenter instance] getStringForKey:@"mainBG568"]]];
    [imageView setContentMode:UIViewContentModeScaleToFill];
    [imageView setBackgroundColor:[UIColor clearColor]];
    [self.view insertSubview:imageView atIndex:0];
    
    //添加搜索按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //[btn setFrame:CGRectMake(20, 278, 279.5, 25)];
    btn.frame =GTRectMake(GTFixWidthFlaot(20), GTFix4SHeightFlaot(278), 279.5, 25);
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //左侧切换城市
    UIButton *itemBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(17, 5, 15, 21)];
    [itemBtn4 setBackgroundImage:[UIImage imageNamed:@"location.png"] forState:UIControlStateNormal];
    [itemBtn4 addTarget:self action:@selector(setLocation) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *isBuyFlag = [[UIBarButtonItem alloc] initWithCustomView:itemBtn4];
    
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"city"];
    UIButton *itemBtn5 = [[UIButton alloc] initWithFrame:CGRectMake(27, 5, 60, 17)];
    [itemBtn5 setTitle:str forState:UIControlStateNormal];
    [itemBtn5 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [itemBtn5.titleLabel setTextAlignment:NSTextAlignmentLeft];
    self.cityNameBtn = itemBtn5;
    UIBarButtonItem *isBuy = [[UIBarButtonItem alloc] initWithCustomView:itemBtn5];
    
    self.navigationItem.leftBarButtonItems = @[isBuyFlag,isBuy];
}

//搜索房源
- (void) search
{
    SearchViewController *search = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:search animated:YES];
}

//切换城市监听方法
- (void)setLocation
{
    NSLog(@"%@",self.parentViewController.parentViewController);
    //////////////跳到子页面得时候，将main中得滚动Button设置透明度为0///////////////
//    MainViewController *main = (MainViewController *)self.parentViewController.parentViewController;
//    [main.centerButton setAlpha:0.0f];
    if (!_isPush) {
        SelectCityViewController *selectCity = [[SelectCityViewController alloc] init];
        selectCity.delegate = self;
        [self.navigationController pushViewController:selectCity animated:YES];
        _isPush = YES;
    }
    
}

//切换图片监听方法
- (void)changePicture
{
    
}

//选择城市代理方法，将值传回来
- (void)pushSelectRowValueToMain:(NSString *)city
{
    [self.navigationItem.leftBarButtonItems[1] setTitle:city];
}

@end
