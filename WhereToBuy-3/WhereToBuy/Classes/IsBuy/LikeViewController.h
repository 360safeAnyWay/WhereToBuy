//
//  LikeViewController.h
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/14.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LikeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArr1;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (weak, nonatomic) UITableView *tableView1;
@end
