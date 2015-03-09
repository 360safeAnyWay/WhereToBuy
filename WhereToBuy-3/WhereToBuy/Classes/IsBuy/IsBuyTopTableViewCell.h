//
//  IsBuyTopTableViewCell.h
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/9.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IsBuyTopTableViewCell : UITableViewCell
@property (nonatomic,copy)NSString * tStr;

@property (weak, nonatomic) UIButton *imageHead;//头像
@property (weak, nonatomic) UILabel *nameLabel;//姓名
@property (weak, nonatomic) UILabel *dateLabel;//姓名
@property (weak, nonatomic) UILabel *titleLabel1;//标签
@property (weak, nonatomic) UIButton *mark1;//标签1
@property (weak, nonatomic) UIButton *mark2;//标签2
@property (weak, nonatomic) NSString * markString1;//标签监听数据
@property (weak, nonatomic) NSString * markString2;//标签监听数据
@end
