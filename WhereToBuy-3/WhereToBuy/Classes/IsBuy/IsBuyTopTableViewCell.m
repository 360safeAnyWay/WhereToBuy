//
//  IsBuyTopTableViewCell.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/9.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "IsBuyTopTableViewCell.h"
@implementation IsBuyTopTableViewCell

- (void)awakeFromNib {

    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = self.frame;
        rect.size.height = 200;
        self.frame = rect;
        //     创建视图
        NSLog(@"%f",self.frame.size.height);
        [self createView];
    }
    return self;
}
-(void)createView
{
   
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
