//
//  IsBuySendTopicViewController.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-28.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//
typedef void(^SPECIALISTNAME)(NSString * name);
#import "BaseViewController.h"

@interface IsBuySendTopicViewController : BaseViewController
-(void)SpecialistNameWithindex:(NSIndexPath *)indexPath tableView:(UITableView *)tableView block:(SPECIALISTNAME)block;

@end
