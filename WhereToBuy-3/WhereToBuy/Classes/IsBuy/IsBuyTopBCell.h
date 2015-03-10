//
//  IsBuyTopBCell.h
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/10.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IsBuyTopBCell : UITableViewCell
@property (weak, nonatomic) UIButton *imageHead;//头像
@property (weak, nonatomic) UILabel *nameLabel;//姓名
@property (weak, nonatomic) UILabel *dateLabel;//姓名
@property (copy, nonatomic) NSString * markString1;//标签监听数据
@property (copy, nonatomic) NSString * markString2;//标签监听数据
@end
