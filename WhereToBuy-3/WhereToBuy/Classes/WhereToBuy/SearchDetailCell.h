//
//  SearchDetailCell.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-3-4.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchDetailCell : UITableViewCell

//通过传递一个数组来进行初始化
- (void)cellInitWithArr:(NSArray *)arr atIndex:(NSInteger) index;

@end
