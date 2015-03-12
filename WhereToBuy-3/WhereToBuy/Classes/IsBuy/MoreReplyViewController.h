//
//  MoreReplyViewController.h
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/12.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YcKeyBoardView.h"
@interface MoreReplyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,YcKeyBoardViewDelegate>
@property (nonatomic,strong)YcKeyBoardView *key;
@property (nonatomic,assign) CGFloat keyBoardHeight;
@property (nonatomic,assign) CGRect originalKey;
@property (nonatomic,assign) CGRect originalText;
@property (nonatomic,retain)UITableView * myTableView;
@property (weak, nonatomic) UIButton        * imageHead;//头像
@property (weak, nonatomic) UILabel         * nameLabel;//姓名
@property (weak, nonatomic) UILabel         * dateLabel;//姓名
@property (nonatomic,copy) NSString         * LcStr;
@property (nonatomic,strong) NSMutableArray * dataArray;
- (instancetype)initWithstr:(NSString *)str WithFlot:(CGFloat)PFlot number:(NSString *)number;

@end
