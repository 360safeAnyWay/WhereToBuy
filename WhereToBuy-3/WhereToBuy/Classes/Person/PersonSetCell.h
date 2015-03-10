//
//  PersonSetCell.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-5.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonSetCell : UITableViewCell

@property (weak, nonatomic) UILabel *nameLabel;//标题
@property (weak, nonatomic) UITextField *detailLabel;//详细内容
@property (weak, nonatomic) UIImageView *icon;//小图标

- (void)cellInitWithCell:(NSArray *)arr andIndex:(NSInteger) row;

@end
