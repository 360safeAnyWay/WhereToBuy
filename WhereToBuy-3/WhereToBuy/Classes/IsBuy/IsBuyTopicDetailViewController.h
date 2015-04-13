//
//  IsBuyTopicDetailViewController.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-27.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "BaseViewController.h"

@interface IsBuyTopicDetailViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource,ISSShareViewDelegate>
@property (nonatomic, copy) NSString * infoStr;
@property (nonatomic, copy) NSString * infoStrs;

@property (nonatomic,retain)NSMutableArray  * reviewArray;



@end
