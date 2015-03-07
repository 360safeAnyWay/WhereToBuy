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

@interface WhereBuyMainVIewController()<SelectCityDelegate>

@end

@implementation WhereBuyMainVIewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [[DataCenter instance] getStringForKey:@"whereBuyMainNavTitle"];
    [self addUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSString *cityName = [[NSUserDefaults standardUserDefaults] objectForKey:@"city"];//每次在搜索视图或者搜索详情视图中选择的城市，在主界面再次启动的时候设置为该城市
    [self.navigationItem.leftBarButtonItems[1] setTitle:cityName];
}

- (void)addUI
{
    UIImageView *imageView = [[UIImageView alloc] init];//459是iphoone5得iamge高度
    [imageView setFrame:CGRectMake(0, 65, self.view.frame.size.width, [UIScreen mainScreen].applicationFrame.size.height - 88)];//设置对应手机的高度
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
    
    //左侧切换城市状态按钮
    UIBarButtonItem *itemLeftPic = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"location.png"] style:UIBarButtonItemStylePlain target:self action:@selector(setLocation)];
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"city"];
    UIBarButtonItem *itemLeftTitle = [[UIBarButtonItem alloc] initWithTitle:str style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItems = @[itemLeftPic,itemLeftTitle];
    
    //右侧切换图片的按钮
    UIButton *itemBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 5, 22, 22)];
    [itemBtn setBackgroundImage:[UIImage imageNamed:@"skin.png"] forState:UIControlStateNormal];
    [itemBtn addTarget:self action:@selector(changePicture) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *itemRight = [[UIBarButtonItem alloc] initWithCustomView:itemBtn];
    self.navigationItem.rightBarButtonItem = itemRight;
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
    SelectCityViewController *selectCity = [[SelectCityViewController alloc] init];
    selectCity.delegate = self;
    [self.navigationController pushViewController:selectCity animated:YES];
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
