//
//  MyRemindRViewController.h
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/13.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyRemindRViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,copy)NSString * infoStr;
@property (nonatomic,copy)NSString * CellType;
@end
