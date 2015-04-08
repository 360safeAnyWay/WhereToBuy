//
//  PersonMainViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-29.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "PersonMainViewController.h"
#import "LoginViewController.h"
#import "DataCenter.h"
#import "PersonCenterViewController.h"

@interface PersonMainViewController()<loginDelegate>

@end

@implementation PersonMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = @"个人中心";
    LoginViewController *login = [[LoginViewController alloc] init];
    login.delegate = self;
    [self addChildViewController:login];
    PersonCenterViewController *personCenter = [[PersonCenterViewController alloc] init];
    [self addChildViewController:personCenter];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
     [self judgeLogin];

}

//判断是否需要进行登录
- (void) judgeLogin
{
    UIViewController *personCenter = self.childViewControllers[1];
        if (TOKEN==nil) {
            NSLog(@"加载登录试图");
            UIViewController *login = self.childViewControllers[0];
            if ([self.view.subviews count] == 0 || ![login.view isEqual:self.view.subviews[0]]) {
                self.title = [[DataCenter instance] getStringForKey:@"userLogin"];
                
                [login.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
                [self.view addSubview:login.view];
            }
        }else if(TOKEN != nil)
        {
            if ([self.view.subviews count] != 0) {
                if (self.view.subviews[0] != personCenter.view) {
                    NSLog(@"加载个人中心试图");
                    UIViewController *personCenter = self.childViewControllers[1];
                    [personCenter.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
                    [self.view addSubview:personCenter.view];
                }
            }else if([self.view.subviews count] == 0)
            {
                NSLog(@"加载个人中心试图");
                UIViewController *personCenter = self.childViewControllers[1];
                [personCenter.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
                [self.view addSubview:personCenter.view];
            }
        }
}

//从忘记密码中返回
- (void)back
{
    LoginViewController *loginViewController = self.childViewControllers[0];
    [UIView animateWithDuration:1.0f animations:^{
        
        [loginViewController.view bringSubviewToFront:loginViewController.loginView];
        [loginViewController.loginView setCenter:CGPointMake(loginViewController.loginView.center.x + self.view.frame.size.width, loginViewController.loginView.center.y)];
    } completion:^(BOOL finished) {
        [loginViewController.forgetView setCenter:CGPointMake(loginViewController.forgetView.center.x + self.view.frame.size.width, loginViewController.forgetView.center.y)];
        self.navigationItem.leftBarButtonItem = nil;
       // self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc] initWithTitle:[[DataCenter instance] getStringForKey:@"registerNow"] style:UIBarButtonItemStyleBordered target:self action:@selector(goRegister)];
    }];
}

- (void)removeSelfFromSuperView
{
    //移除登录View
    UIViewController *login = self.childViewControllers[0];
    [login.view removeFromSuperview];
    
    //加入个人中心View
    UIViewController *personCenter = self.childViewControllers[1];
    [personCenter.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:personCenter.view];
    self.navigationItem.rightBarButtonItem = nil;
    self.title = @"个人中心";
    
    //先将自己移除，然后在加入进去就可以解决每次登录过后头像上移65像素的bug
    [self.parentViewController.view removeFromSuperview];
    UIViewController *person = self.parentViewController.parentViewController.childViewControllers[2];
    [self.parentViewController.parentViewController.view addSubview:person.view];
}

@end
