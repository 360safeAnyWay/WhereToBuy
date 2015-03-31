//
//  PhoneLonginViewController.h
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/30.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneLonginViewController : UIViewController<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *codePhone;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (nonatomic,copy)           NSString   *phone;
@property (nonatomic,copy)           NSString   *checking;
@end
