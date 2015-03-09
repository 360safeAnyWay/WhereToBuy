//
//  VipEvaluteCell.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-11.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VipEvaluteCell : UITableViewCell

@property (weak, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) UIView *progress;
@property (weak, nonatomic) UILabel *point;
@property (weak, nonatomic) UILabel *myEvalute;//我的评论

- (void)cellInitWithCell:(NSArray *)arr andIndex:(NSInteger) row;

@end
