//
//  SearchDetailCell.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-3-4.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "SearchDetailCell.h"
#import "AttributedLabel.h"

@interface SearchDetailCell()

@property (weak, nonatomic) UILabel *namelabel;//楼盘名称
@property (weak, nonatomic) AttributedLabel *pricelabel;//价格文本   cell的高度是113
@property (weak, nonatomic) UIImageView *builddingImage;//楼盘图像
@property (weak, nonatomic) UILabel *detailLabel;//楼盘详细资料
@property (weak, nonatomic) UIImageView *visit;//几个浏览量
@property (weak, nonatomic) UIImageView *comment;//几个评论
@property (weak, nonatomic) UIImageView *scores;//得分
@property (weak, nonatomic) UILabel *zanLabel;
@property (weak, nonatomic) UILabel *visitLabel;
@property (weak, nonatomic) UILabel *commentLabel;
@property (weak, nonatomic) UILabel *manyLabel;//多少人打分
@property (weak, nonatomic) UILabel *scoreLabel;//打分label


@end

@implementation SearchDetailCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

//通过传递一个数组来进行初始化
- (void)cellInitWithArr:(NSArray *)arr atIndex:(NSInteger) index
{
    
}

@end
