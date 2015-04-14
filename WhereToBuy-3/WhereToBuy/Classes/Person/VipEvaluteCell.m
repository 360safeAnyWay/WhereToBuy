//
//  VipEvaluteCell.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-11.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "VipEvaluteCell.h"
#import "Tools.h"

@interface VipEvaluteCell()
{
    UIView *_lineView;//底部的分割线
}
@end

@implementation VipEvaluteCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {//没有展开我的评论，高度是48
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 9, 80, 30)];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleLabel setFont:[UIFont systemFontOfSize:14]];
        [self.contentView addSubview:titleLabel];
        _titleLabel = titleLabel;
        
        //310 * 34 progressView的大小,用来装底部线条和进度颜色的view
        UIView *progressView = [[UIView alloc] init];
        [progressView setFrame:CGRectMake(titleLabel.frame.origin.x + titleLabel.frame.size.width + 5, 7, 155, 17)];
        [progressView setCenter:CGPointMake(progressView.center.x, titleLabel.center.y)];
        [self addSubview:progressView];
        
        //进度条底部
        UIImageView *progressImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, progressView.frame.size.width, progressView.frame.size.height)];
        [progressImage setImage:[UIImage imageNamed:@"progressBack.png"]];
        [progressView addSubview:progressImage];
        
        //带颜色的进度条
        UIView *progress = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, progressView.frame.size.height)];
        [progress setBackgroundColor:kMainColor];
        [progressView addSubview:progress];
        progress.layer.cornerRadius = 5;
        progress.clipsToBounds = YES;
        _progress = progress;
        
        UILabel *point = [[UILabel alloc] initWithFrame:CGRectMake(progressView.frame.origin.x + progressView.frame.size.width + 5, 14, self.contentView.frame.size.width - progressView.frame.origin.x - progressView.frame.size.width - 5, 20)];
        NSString *str = @"     请评分";
        point.text = str;
        [point setTextAlignment:NSTextAlignmentCenter];
        [point setFont:[UIFont systemFontOfSize:14]];
        [point setTextColor:kMainColor];
        [self.contentView addSubview:point];
        _point = point;
        
        UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [myLabel setNumberOfLines:0];
        myLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [myLabel setFont:[UIFont systemFontOfSize:12]];
        [self.contentView addSubview:myLabel];
        self.myEvalute = myLabel;
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(titleLabel.frame.origin.x + titleLabel.frame.size.width, myLabel.frame.origin.y + myLabel.frame.size.height, 240, 1)];
        [lineView setBackgroundColor:[Tools colorWithRed:229 angGreen:229 andBlue:229]];
        [self.contentView addSubview:lineView];
        _lineView = lineView;
    }
    return self;
}

- (void)cellInitWithCell:(NSArray *)arr andIndex:(NSInteger) row
{
    NSArray *tempArr = arr[row];
        if (row == 0) {
            [_titleLabel setText:@"性 价 比"];
            
        }else if(row == 1)
        {
            [_titleLabel setText:@"户      型"];
            
        }else if (row == 2)
        {
            [_titleLabel setText:@"房屋质量"];
            
        }else if (row == 3)
        {
            [_titleLabel setText:@"物业管理"];
            
        }else if (row == 4)
        {
            [_titleLabel setText:@"交通地铁"];
            
        }else if (row == 5)
        {
            [_titleLabel setText:@"周边配套"];
            
        }else if (row == 6)
        {
            [_titleLabel setText:@"学      区"];
            
        }else if (row == 7)
        {
            [_titleLabel setText:@"绿化景观"];
            
        }else if (row == 8)
        {
            [_titleLabel setText:@"开发品牌"];
            
        }else if (row == 9)
        {
            [_titleLabel setText:@"区域发展"];
            
        }
    NSString *s = tempArr[1];//如果是空字符串，需要将字符串设置为nil，否则将会有高度产生
    if ([s isEqualToString:@""]) {
        s = nil;
    }
    NSLog(@"传递过来的数据是%@",s);
    CGSize size = CGSizeMake(_lineView.frame.size.width, 200);
    CGRect labelSize = [s boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil];//动态调整label高度
    [self.myEvalute setFrame:CGRectMake(self.titleLabel.frame.origin.x + self.titleLabel.frame.size.width, 47, labelSize.size.width, labelSize.size.height)];
    NSLog(@"动态调整的高度时－－－－－－%f",self.myEvalute.frame.size.height);
    self.myEvalute.text = tempArr[1];
    [_lineView setFrame:CGRectMake(self.titleLabel.frame.origin.x + self.titleLabel.frame.size.width, 50 + self.myEvalute.frame.size.height, 240, 1)];//重新设置lineView的位置
    NSInteger i = [tempArr[0] integerValue];
    if (i != 0) {
        [self.point setText:[NSString stringWithFormat:@"%ld分",(long)i]];
    }
    [UIView animateWithDuration:0.7f animations:^{
        [_progress setFrame:CGRectMake(0, 0, _progress.superview.frame.size.width * i / 10,_progress.superview.frame.size.height)];
    } completion:^(BOOL finished) {
        NSLog(@"动画完成");
    }];
}

@end



