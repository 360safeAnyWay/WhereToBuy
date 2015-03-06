//
//  PeronTipsViewController.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-26.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "BaseViewController.h"
#import "CLLRefreshHeadController.h"

@interface PeronTipsViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate,CLLRefreshHeadControllerDelegate>

@property (nonatomic, strong) NSMutableArray *dataArr;
@property (weak, nonatomic) UITableView *tableView;

@end
