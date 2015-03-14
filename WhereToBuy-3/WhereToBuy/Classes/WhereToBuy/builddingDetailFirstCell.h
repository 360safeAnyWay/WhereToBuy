//
//  builddingDetailFirstCell.h
//  WhereToBuy
//
//  Created by ywj on 15-3-10.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface builddingDetailFirstCell : UITableViewCell

//通过传递一个数组来进行初始化
- (void)cellInitWithCell:(NSArray *)arr andIndex:(NSInteger) row;

@end
