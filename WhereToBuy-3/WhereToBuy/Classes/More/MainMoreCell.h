//
//  MainMoreCell.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-3-3.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMoreCell : UITableViewCell

@property (weak, nonatomic) UIImageView *icon;
@property (weak, nonatomic) UILabel *detailLabel;//功能cell
@property (weak, nonatomic) UIView *bottomView;
@property (weak, nonatomic) UILabel *titleLabel;//标题cell

//通过传递一个数组来进行初始化
- (void)cellInitWithCell:(NSArray *)arr andIndex:(NSInteger) row;

@end
