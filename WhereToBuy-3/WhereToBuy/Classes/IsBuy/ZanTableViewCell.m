//
//  ZanTableViewCell.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/13.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "ZanTableViewCell.h"

@implementation ZanTableViewCell

- (void)awakeFromNib {
    _ZTView.layer.cornerRadius = 10;
    _TxButton.layer.cornerRadius = 25;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
