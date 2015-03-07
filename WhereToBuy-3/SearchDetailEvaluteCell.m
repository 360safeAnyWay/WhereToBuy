//
//  SearchDetailEvaluteCell.m
//  WhereToBuy
//
//  Created by ywj on 15-3-7.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "SearchDetailEvaluteCell.h"
#import "Tools.h"

//tag＝1 内行点评进度条底部view      2  大众点评进度条底部view
//     3 内行点评得颜色view         4  大众点评得颜色view

@implementation SearchDetailEvaluteCell

- (void)awakeFromNib {
    for (NSInteger i = 1; i < 3; i++) {
        [Tools setUIViewLine:[self.contentView viewWithTag:i] cornerRadius:5 with:0 color:[UIColor whiteColor]];
        [self.contentView viewWithTag:i].clipsToBounds = YES;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
