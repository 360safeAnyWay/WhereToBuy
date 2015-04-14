//
//  RemindTableViewCell.h
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/13.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface RemindTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *Review;
- (IBAction)review:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
- (IBAction)TXButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *TxButton;
@property (weak, nonatomic) IBOutlet UIView *isEq;
@property (weak, nonatomic) IBOutlet UILabel *ZTLabel;

@end
