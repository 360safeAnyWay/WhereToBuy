//
//  MainMoreCell.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-3-3.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "MainMoreCell.h"
#import "Tools.h"

@implementation MainMoreCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(45, 10, 20, 20)];
        [self.contentView addSubview:icon];
        self.icon = icon;
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(icon.frame.origin.x + icon.frame.size.width + 5, icon.frame.origin.y, 120, 20)];
        [detailLabel setFont:[UIFont systemFontOfSize:14]];
        [detailLabel setTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:detailLabel];
        self.detailLabel = detailLabel;
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(45, 5, self.contentView.frame.size.width - 5, 35)];
        [self.contentView insertSubview:bottomView atIndex:0];
        self.bottomView = bottomView;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 13, 100, 20)];
        [titleLabel setFont:[UIFont systemFontOfSize:13]];
        [titleLabel setTextColor:[Tools colorWithRed:147 angGreen:147 andBlue:147]];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(45, 39, self.contentView.frame.size.width - 45, 1)];
        [line setBackgroundColor:[Tools colorWithRed:63 angGreen:63 andBlue:63]];
        [self.contentView addSubview:line];
    }
    return self;
}

//通过传递一个数组来进行初始化
- (void)cellInitWithCell:(NSArray *)arr andIndex:(NSInteger) row
{
    if (row == 0 || row == 4 || row == 8) {
        [Tools colorWithRed:63 angGreen:63 andBlue:63];
        [self.titleLabel setText:arr[row]];
        [self.bottomView setBackgroundColor:[Tools colorWithRed:63 angGreen:63 andBlue:63]];
    }else
    {
        [self.icon setImage:[UIImage imageNamed:[NSString stringWithFormat:@"isBuy_%ld.png",(long)row]]];
        [self.detailLabel setText:arr[row]];
        if (row == 0) {
            UIImageView *image = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
            [image setImage:[UIImage imageNamed:@"mainMoreCell.png"]];
            [self.contentView insertSubview:image atIndex:0];
        }
    }
}

@end
