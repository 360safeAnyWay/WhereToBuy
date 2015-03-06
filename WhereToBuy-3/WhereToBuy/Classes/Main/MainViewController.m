//
//  MainViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-26.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//



//测试github  是否成功   成功请你回答    孟凡杰  第二次测试  看看刻有



#import "MainViewController.h"
#import "WhereBuyMainViewController.h"
#import "PersonMainViewController.h"
#import "IsBuyMainViewController.h"
#import "WBNavigationController.h"
#import "SearchViewController.h"
#import "Dock.h"
#import "Tools.h"
#import "Constants.h"
#import "DDMenuController.h"
#import "MainMoreViewController.h"

@interface MainViewController ()<UINavigationControllerDelegate>

@end

@implementation MainViewController

- (id)init {
    if (self = [super init])
        [self setTitle:@"KYCircleMenu"];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    //1.导入其他控制器的view
    [self addAllChildViewControllers];
    //2.初始化Dock
    [self addDocks];
    for (UIButton * button in [self.menu subviews])
        [button setAlpha:.95f];
}

#pragma mark - KYCircleMenu Button Action
- (void)runButtonActions:(id)sender {//点击按钮跳转到对应的控制器当中去
    [super runButtonActions:sender];
    
    switch ([sender tag]) {
        case 1:
        {
            SearchViewController *search = [[SearchViewController alloc] init];
            [self pushViewController:search];
        }
            break;
        case 2:
        {
            IsBuyMainViewController *isBuy = [[IsBuyMainViewController alloc] init];
            [self pushViewController:isBuy];
        }
            break;
        case 3:
        {
            PersonMainViewController *person = [[PersonMainViewController alloc] init];
            [self pushViewController:person];
        }
            break;
        default:
            break;
    }
    
}

//初始化所有的控制器
- (void) addAllChildViewControllers
{
    //买否控制器
    IsBuyMainViewController *isBuy = [[IsBuyMainViewController alloc] init];
        WBNavigationController *isBuyNav = [[WBNavigationController alloc] initWithRootViewController:isBuy];
    isBuyNav.delegate = self;
//    [self addChildViewController:isBuyNav];
    DDMenuController *menu = [[DDMenuController alloc] initWithRootViewController:isBuyNav];
    MainMoreViewController *right = [[MainMoreViewController alloc] init];
    [menu setRightViewController:right];
    [self addChildViewController:menu];
    
    //买哪儿控制器
    WhereBuyMainVIewController *whereBuy = [[WhereBuyMainVIewController alloc] init];
        WBNavigationController *whereBuyNav = [[WBNavigationController alloc] initWithRootViewController:whereBuy];
    whereBuyNav.delegate = self;
    [self addChildViewController:whereBuyNav];
    
    //会员中心控制器
    PersonMainViewController *person = [[PersonMainViewController alloc] init];
        WBNavigationController *personNav = [[WBNavigationController alloc] initWithRootViewController:person];
    personNav.delegate = self;
    [self addChildViewController:personNav];
}

//初始化Dock
- (void) addDocks
{
    //2.往dock里面填充内容
    [self.dock addItemWithIcon:@"isBuy.png" andTitle:@"买否"];
    [self.dock addItemWithIcon:@"search.png" andTitle:@"搜索"];
    [self.dock addItemWithIcon:@"person.png" andTitle:@"个人"];
    UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    [viewLine setBackgroundColor:[Tools colorWithRed:221 angGreen:221 andBlue:221]];
    [self.dock addSubview:viewLine];
    [self.dock itemClick:self.dock.subviews[1]];
}

#pragma mark 实现导航控制器代理方法
// 导航控制器即将显示新的控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 1.获得当期导航控制器的根控制器
    UIViewController *root = navigationController.viewControllers[0];
    if (root != viewController) { // 不是根控制器
        [self.centerButton setAlpha:0.0f];//如果不是根控制器，就将滚动按钮进行影藏
        self.dock.alpha = 0.0f;//在切换到下一个控制器的的时候隐藏dock
        NSLog(@"不是跟控制器");
        // {0, 20}, {320, 460}
        // 2.拉长导航控制器的view
        CGRect frame = navigationController.view.frame;
        frame.size.height = [UIScreen mainScreen].applicationFrame.size.height + 20;
        navigationController.view.frame = frame;
        
        // 3.添加Dock到根控制器的view上面
        [self.dock removeFromSuperview];
        CGRect dockFrame = self.dock.frame;
        dockFrame.origin.y = root.view.frame.size.height - self.dock.frame.size.height;
        if ([root.view isKindOfClass:[UIScrollView class]]) { // 根控制器的view是能滚动
            UIScrollView *scroll = (UIScrollView *)root.view;
            dockFrame.origin.y += scroll.contentOffset.y;
        }
        self.dock.frame = dockFrame;
        [root.view addSubview:self.dock];
        
        // 4.添加左上角的返回按钮
//        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_back.png" highlightedIcon:@"navigationbar_back_highlighted.png" target:self action:@selector(back)];
    }
    if (viewController == root) {
        NSLog(@"是跟控制器");
        [self.centerButton setAlpha:1.0f];//如果是根控制器，则不进行影藏
        self.dock.alpha = 1.0f;//如果是跟控制器就显示_dock
        // 1.让导航控制器view的高度还原
        CGRect frame = navigationController.view.frame;
        frame.size.height = [UIScreen mainScreen].applicationFrame.size.height - self.dock.frame.size.height + 20;
        navigationController.view.frame = frame;
        
        // 2.添加Dock到mainView上面
        [self.dock removeFromSuperview];
        CGRect dockFrame = self.dock.frame;
        // 调整dock的y值
        dockFrame.origin.y = self.view.frame.size.height - self.dock.frame.size.height;
        self.dock.frame = dockFrame;
        [self.view addSubview:self.dock];
    }
}

- (void)back
{
    [self.childViewControllers[self.dock.selectedIndex] popViewControllerAnimated:YES];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    UIViewController *root = navigationController.viewControllers[0];
    
}

//person的代理方法
- (void)goToTheMainView
{
    NSLog(@"跳转");
    [self.dock itemClick:self.dock.subviews[1]];
}

@end
