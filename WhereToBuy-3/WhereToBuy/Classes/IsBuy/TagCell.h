//
//  TagCell.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-3-1.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TagCell : UITableViewCell

@property (weak, nonatomic) UILabel *tagName;

//通过传递一个数组来进行初始化
- (void)cellInitWithCell:(NSArray *)arr andIndex:(NSInteger) row;

@end
