//
//  VipEvaluteDetailViewContrller.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-14.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "BaseViewController.h"

@protocol VipEvaluteDetailDelegate;
@interface VipEvaluteDetailViewContrller : BaseViewController

@property (weak, nonatomic) id delegate;

@end

//用于刷新专家评论的数据刷新
@protocol VipEvaluteDetailDelegate <NSObject>

- (void) refreshTableViewData:(NSArray *)arr;

@end