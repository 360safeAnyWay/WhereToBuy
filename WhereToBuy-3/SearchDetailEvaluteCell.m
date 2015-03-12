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
        UIView *view = [self.contentView viewWithTag:i];
        [Tools setUIViewLine:view cornerRadius:5 with:0 color:[UIColor whiteColor]];
        view.clipsToBounds = YES;
    }
    [UIView animateWithDuration:1.0f animations:^{
        [[self.contentView viewWithTag:3] setFrame:CGRectMake(0, 0, arc4random_uniform(205), 10)];
        [[self.contentView viewWithTag:4] setFrame:CGRectMake(0, 0, arc4random_uniform(205), 10)];
    } completion:nil];
}

@end
