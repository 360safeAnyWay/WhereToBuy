//
//  MoreRRTableViewCell.h
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/23.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreRRTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *LC;
@property (weak, nonatomic) IBOutlet UILabel *infoMessage;
@property (weak, nonatomic) IBOutlet UIImageView *nameT;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIButton *reviewButton;

@end
