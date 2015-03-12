//
//  MoreReplyViewController.h
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/12.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreReplyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,retain)UITableView * myTableView;
@property (weak, nonatomic) UIButton        * imageHead;//头像
@property (weak, nonatomic) UILabel         * nameLabel;//姓名
@property (weak, nonatomic) UILabel         * dateLabel;//姓名
@property (nonatomic,copy) NSString         * LcStr;
- (instancetype)initWithstr:(NSString *)str WithFlot:(CGFloat)PFlot number:(NSString *)number;

@end
