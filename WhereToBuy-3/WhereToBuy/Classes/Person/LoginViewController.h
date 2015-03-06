//
//  LoginViewController.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-26.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "BaseViewController.h"
@protocol loginDelegate;

@interface LoginViewController : BaseViewController

@property (weak, nonatomic) UIView *loginView;
@property (weak, nonatomic) UIView *forgetView;
@property (weak, nonatomic) id<loginDelegate>delegate;

@end

@protocol loginDelegate <NSObject>

- (void) removeSelfFromSuperView;

@end