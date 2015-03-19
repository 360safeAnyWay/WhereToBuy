//
//  EvaluteCell.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-9.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "EvaluteCell.h"
#import "AttributedLabel.h"
#import "Tools.h"

@implementation EvaluteCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //楼盘头像
        UIImageView *buildingView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 75, 75)];
        [buildingView setBackgroundColor:[UIColor redColor]];
        [self.contentView addSubview:buildingView];
        
        //楼盘名
        UILabel *buildingName = [[UILabel alloc] initWithFrame:CGRectMake(buildingView.frame.origin.x + buildingView.frame.size.width + 5, buildingView.frame.origin.y, 110, 24)];
        [buildingName setText:@"万裕龙庭水岸"];
        [buildingName setFont:[UIFont systemFontOfSize:14]];
        [buildingName setTextAlignment:NSTextAlignmentLeft];
        [self.contentView addSubview:buildingName];
        
        AttributedLabel *price = [[AttributedLabel alloc] initWithFrame:CGRectMake(buildingName.frame.origin.x, buildingName.frame.origin.y + buildingName.frame.size.height, 110, 20)];
        [price setText:@"20000元/平方"];
        [price setFont:[UIFont systemFontOfSize:16] fromIndex:0 length:6];
        [price setFont:[UIFont systemFontOfSize:14] fromIndex:6 length:3];
        [price setColor:[Tools colorWithRed:251 angGreen:79 andBlue:0] fromIndex:0 length:9];
        [self.contentView addSubview:price];
        
        //房型
        UILabel *buildingType = [[UILabel alloc] initWithFrame:CGRectMake(price.frame.origin.x, price.frame.origin.y + price.frame.size.height, 110, 16)];
        [buildingType setText:@"41平米 | 1室1厅"];
        [buildingType setFont:[UIFont systemFontOfSize:12]];
        [buildingType setTextColor:[Tools colorWithRed:151 angGreen:151 andBlue:151]];
        [self.contentView addSubview:buildingType];
        
        //地址
        UILabel *buildingAddress = [[UILabel alloc] initWithFrame:CGRectMake(buildingType.frame.origin.x, buildingType.frame.origin.y + buildingType.frame.size.height, 200, 16)];
        [buildingAddress setText:@"鼓楼-龙江 长安西街1号"];
        [buildingAddress setFont:[UIFont systemFontOfSize:12]];
        [buildingAddress setTextColor:[Tools colorWithRed:151 angGreen:151 andBlue:151]];
        [self.contentView addSubview:buildingAddress];
        
        //进入评价页面
        UIImageView *goImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width - 33, 50, 33, 30)];
        [goImageView setImage:[UIImage imageNamed:@"goDetail.png"]];
        [self.contentView addSubview:goImageView];
        
        
        
        
        //底部的区分颜色
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 95, self.contentView.frame.size.width * 2, 5)];
        [bottomView setBackgroundColor:[Tools colorWithRed:241 angGreen:241 andBlue:241]];
        [self.contentView addSubview:bottomView];
        
        
        
        
//        //楼盘头像
//        UIImageView *buildingView2 = [[UIImageView alloc] initWithFrame:CGRectMake(5 + self.contentView.frame.size.width, 5, 75, 75)];
//        [buildingView2 setBackgroundColor:[UIColor redColor]];
//        [self.contentView addSubview:buildingView2];
//        
//        //楼盘名
//        UILabel *buildingName2 = [[UILabel alloc] initWithFrame:CGRectMake(buildingView2.frame.origin.x + buildingView2.frame.size.width + 5, buildingView2.frame.origin.y, 110, 24)];
//        [buildingName2 setText:@"万裕龙庭水岸"];
//        [buildingName2 setFont:[UIFont systemFontOfSize:14]];
//        [buildingName2 setTextAlignment:NSTextAlignmentLeft];
//        [self.contentView addSubview:buildingName2];
//        
//        AttributedLabel *price2 = [[AttributedLabel alloc] initWithFrame:CGRectMake(buildingName2.frame.origin.x, buildingName2.frame.origin.y + buildingName2.frame.size.height, 110, 20)];
//        [price2 setText:@"20000元/平方"];
//        [price2 setFont:[UIFont systemFontOfSize:16] fromIndex:0 length:6];
//        [price2 setFont:[UIFont systemFontOfSize:14] fromIndex:6 length:3];
//        [price2 setColor:[Tools colorWithRed:251 angGreen:79 andBlue:0] fromIndex:0 length:9];
//        [self.contentView addSubview:price2];
//        
//        //房型
//        UILabel *buildingType2 = [[UILabel alloc] initWithFrame:CGRectMake(price2.frame.origin.x, price2.frame.origin.y + price2.frame.size.height, 110, 16)];
//        [buildingType2 setText:@"41平米 | 1室1厅"];
//        [buildingType2 setFont:[UIFont systemFontOfSize:12]];
//        [buildingType2 setTextColor:[Tools colorWithRed:151 angGreen:151 andBlue:151]];
//        [self.contentView addSubview:buildingType2];
//        
//        //地址
//        UILabel *buildingAddress2 = [[UILabel alloc] initWithFrame:CGRectMake(buildingType2.frame.origin.x, buildingType2.frame.origin.y + buildingType2.frame.size.height, 200, 16)];
//        [buildingAddress2 setText:@"鼓楼-龙江 长安西街1号"];
//        [buildingAddress2 setFont:[UIFont systemFontOfSize:12]];
//        [buildingAddress2 setTextColor:[Tools colorWithRed:151 angGreen:151 andBlue:151]];
//        [self.contentView addSubview:buildingAddress2];
//        
//        //已验证图片
//        UIImageView *didToken = [[UIImageView alloc] initWithFrame:CGRectMake(215 + self.contentView.frame.size.width, 20, 79, 48.5)];
//        [didToken setImage:[UIImage imageNamed:@"yipingjia.png"]];
//        [self.contentView addSubview:didToken];
//        
//        //进入评价页面
//        UIImageView *goImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width * 2 - 33, 50, 33, 30)];
//        [goImageView2 setImage:[UIImage imageNamed:@"goDetail.png"]];
//        [self.contentView addSubview:goImageView2];
    }
    
    return self;
}

- (void)cellInitWithCell:(NSArray *)arr andIndex:(NSInteger) row
{
    //已验证图片
    UIImageView *didToken = [[UIImageView alloc] initWithFrame:CGRectMake(215, 20, 79, 48.5)];
    [didToken setImage:[UIImage imageNamed:@"yipingjia.png"]];
    [self.contentView addSubview:didToken];
}

@end
