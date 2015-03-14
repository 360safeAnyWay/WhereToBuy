//
//  ZanTableViewCell.h
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/13.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZanTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *TxButton;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *info;
@property (weak, nonatomic) IBOutlet UILabel *ZTLabel;
@property (weak, nonatomic) IBOutlet UIView *ZTView;

@end
