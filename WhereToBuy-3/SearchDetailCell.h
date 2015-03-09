//
//  SearchDetailCell.h
//  WhereToBuy
//
//  Created by ywj on 15-3-7.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchDetailCell : UITableViewCell

- (void)cellInitWithCell:(NSArray *)arr andIndex:(NSInteger) row;

//显示评价
- (IBAction)showEvalute:(id)sender;

@end