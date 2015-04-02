//
//  PersonChangePassViewController.h
//  WhereToBuy
//
//  Created by ywj on 15-4-2.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "BaseViewController.h"

@interface PersonChangePassViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *oldPassword;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *surePassword;
@property (weak, nonatomic) IBOutlet UIButton *changePassBtn;

@end
