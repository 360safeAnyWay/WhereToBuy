//
//  SearchDetailCell.m
//  WhereToBuy
//
//  Created by ywj on 15-3-7.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "SearchDetailCell.h"

//tag＝1 标题加价格的label     2  房屋图片的imageView
//     3 房屋详细信息label     4  点赞数label
//     5 浏览数label          6  评论数label  7显示专家点评得BUTTON

@implementation SearchDetailCell

- (void)awakeFromNib {
    
}

- (IBAction)pushDetail:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pushDetail" object:@"jl"];
}

@end
