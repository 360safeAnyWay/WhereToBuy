//
//  TagCell.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-3-1.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "TagCell.h"
#import "Tools.h"

@interface TagCell()

@property (weak, nonatomic) UILabel *topicNum;//话题的数目
@property (weak, nonatomic) UIImageView *hotFlag;//是否火热的标志

@end

@implementation TagCell

- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *tagName = [[UILabel alloc] initWithFrame:CGRectZero];
        [tagName setCenter:CGPointMake(tagName.center.x, self.contentView.center.y)];
        [tagName setFont:[UIFont systemFontOfSize:16]];
        [tagName setTextColor:[UIColor orangeColor]];
        [self.contentView addSubview:tagName];
        self.tagName = tagName;
        
        UILabel *topicNum = [[UILabel alloc] initWithFrame:CGRectZero];
        [topicNum setFont:[UIFont systemFontOfSize:14]];
        [topicNum setTextColor:[Tools colorWithRed:195 angGreen:195 andBlue:195]];
        [self.contentView addSubview:topicNum];
        self.topicNum = topicNum;
        
//        UIImageView *hotFlag = [UIImageView alloc] initWithFrame:CGRectMake(280, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    }
    return self;
}

//通过传递一个字典来进行初始化
- (void)cellInitWithCell:(NSArray *)arr andIndex:(NSInteger) row
{
    NSString *tagName = [NSString stringWithFormat:@"#%@",arr[row]];
    CGSize size1 = CGSizeMake(140, 20);
    CGRect labelSize1 = [tagName boundingRectWithSize:size1 options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];//动态调整label高度
    [self.tagName setFrame:labelSize1];
    [self.tagName setCenter:CGPointMake(self.tagName.center.x + 20, self.contentView.center.y)];
    [self.tagName setText:tagName];
    
    NSString *topicNum = @"相关话题:4382";
    CGSize size2 = CGSizeMake(100, 20);
    CGRect labelSize2 = [topicNum boundingRectWithSize:size2 options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];//动态调整label高度
    [self.topicNum setFrame:labelSize2];
    [self.topicNum setCenter:CGPointMake(self.tagName.center.x + self.tagName.frame.size.width / 2 + self.topicNum.frame.size.width /2 + 5, self.tagName.center.y)];
    [self.topicNum setText:topicNum];
    
    
}

@end
