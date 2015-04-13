//
//  IsBuyTopesTableViewCell.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/4/7.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "IsBuyTopesTableViewCell.h"

@implementation IsBuyTopesTableViewCell

- (void)awakeFromNib {
    self.TXButton.layer.cornerRadius = 25;
    self.Text.layer .cornerRadius = 3;
    self.TextOne.layer.cornerRadius = 3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
