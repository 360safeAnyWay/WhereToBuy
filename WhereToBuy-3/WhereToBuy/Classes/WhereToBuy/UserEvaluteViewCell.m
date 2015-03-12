//
//  UserEvaluteViewCell.m
//  WhereToBuy
//
//  Created by ywj on 15-3-12.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "UserEvaluteViewCell.h"
#import "Tools.h"

@implementation UserEvaluteViewCell
//tag＝1 头像image     2  姓名
//    3  日期          4  血量条底部
//    5  血量条颜色     6  分数
//    7  评论

- (void)awakeFromNib {
    // Initialization code
    [Tools setUIViewLine:[self.contentView viewWithTag:1] cornerRadius:30 with:0 color:[UIColor whiteColor]];
    [self.contentView viewWithTag:1].clipsToBounds = YES;
    NSInteger i = arc4random_uniform(100);
    [UIView animateWithDuration:10.0f animations:^{
        [_bloodView setFrame:CGRectMake(0, 0, i, 10)];
        [_bloodView setBackgroundColor:[UIColor orangeColor]];
        NSLog(@"之后%f",_bloodView.frame.size.width);
    } completion:nil];
    i = i / 10;
    [((UILabel *)[self.contentView viewWithTag:6]) setText:[NSString stringWithFormat:@"%ld分",(long)i]];
}

@end
