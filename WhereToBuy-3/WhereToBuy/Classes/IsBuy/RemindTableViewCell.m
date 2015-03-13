//
//  RemindTableViewCell.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/13.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "RemindTableViewCell.h"

@implementation RemindTableViewCell

- (void)awakeFromNib
{
       self.TxButton.layer.cornerRadius = 25;
       self.isEq.layer.cornerRadius = 10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)review:(id)sender
{
    
}
- (IBAction)TXButton:(id)sender
{
    
}
@end
