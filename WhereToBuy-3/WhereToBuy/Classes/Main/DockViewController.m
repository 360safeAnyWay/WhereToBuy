//
//  DockViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-29.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "DockViewController.h"
#define kDOCKHEIGHT 49

@interface DockViewController()<DockDelegate>

@end

@implementation DockViewController

- (void)viewDidLoad {
    [super viewDidLoad];;
    //1.初始化Dock
    [self addDock];
}

//初始化Dock
- (void) addDock
{
    //创建一个dock
    //1导入Dock
    Dock *dock = [[Dock alloc] init];
    dock.frame = CGRectMake(0, self.view.frame.size.height - kDOCKHEIGHT, self.view.frame.size.width, kDOCKHEIGHT);
    dock.tag = 2000;
    dock.delegate = self;
    [self.view addSubview:dock];
    _dock = dock;
}

//dock的代理方法
- (void)dock:(Dock *)dock itemSelectedFrom:(NSInteger)from to:(NSInteger)to
{
    if (to < 0 || to >= self.childViewControllers.count) {
        return;
    }
    if (from == to) {
        return;
    }
    CATransition *transition = [CATransition animation];
    
    transition.duration = 0.5f;
    
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
//    transition.type = kCATransitionPush;
    transition.type = @"reveal";
    if (from < to) {
        transition.subtype = kCATransitionFromRight;
    }else
    {
        transition.subtype = kCATransitionFromLeft;
    }
    
    transition.delegate = self;
    
    [self.view.layer addAnimation:transition forKey:nil];
    //先取出将要显示的view
    UIViewController *oldVc = self.childViewControllers[from];
    [oldVc.view removeFromSuperview];
    
    UIViewController *newVc = self.childViewControllers[to];
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    [newVc.view setFrame:CGRectMake(0, 0, width, height)];
    [self.view insertSubview:newVc.view atIndex:0];
    
    _selectedController = newVc;
}

@end
