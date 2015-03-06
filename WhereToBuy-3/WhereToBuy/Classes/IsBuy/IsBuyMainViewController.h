//
//  IsBuyMainViewController.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-4.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "BaseViewController.h"
#import "CLLRefreshHeadController.h"

@interface IsBuyMainViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate,CLLRefreshHeadControllerDelegate>

@property (nonatomic, strong) NSMutableArray *dataArr;
@property (weak, nonatomic) UITableView *tableView;

@end
