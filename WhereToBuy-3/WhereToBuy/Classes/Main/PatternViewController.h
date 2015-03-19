//
//  PatternViewController.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-10.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPLockScreen.h"

typedef enum {
    InfoStatusFirstTimeSetting = 0,
    InfoStatusConfirmSetting,
    InfoStatusFailedConfirm,
    InfoStatusNormal,
    InfoStatusFailedMatch,
    InfoStatusSuccessMatch
}	InfoStatus;

@interface PatternViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *infoLabel;
@property (strong, nonatomic) IBOutlet SPLockScreen *lockScreenView;
@property (nonatomic) InfoStatus infoLabelStatus;
@property (weak, nonatomic) UIImageView *headImage;//头像

@end
