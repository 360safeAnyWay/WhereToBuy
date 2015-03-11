//
//  IsBuyTopBCell.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/10.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "IsBuyTopBCell.h"
@implementation IsBuyTopBCell
{
    CGRect  Inforect;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _infoStr     =  @"为德玛西亚的房价";
        Inforect = [self  cellHight:_infoStr Size:CGSizeMake(210, 0)];
        CGRect rect = self.frame;
        rect.size.height = 200+Inforect.size.height;
        self.frame = rect;
        _reviewArray = [[NSMutableArray alloc]initWithObjects:@"提莫 回复 @鸡鸡鸡 提莫露脸",@"德莱文 回复 @提莫 这不是提莫吗?",@"盲僧 回复 @德莱文 团战可以输提莫必须S", nil];
        [self createUI];
        [self createReviewView];
    }
    return self;
}
//添加控件
-(void)createUI
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-10, [UIScreen mainScreen].applicationFrame.size.width, 10)];
    [view setBackgroundColor:[Tools colorWithRed:240 angGreen:240 andBlue:240]];
    NSLog(@"%f",view.frame.origin.y);
    
    [self addSubview:view];
    UIButton *imageView = [[UIButton alloc] initWithFrame:CGRectMake(13, 15, 40, 40)];
    [Tools setUIViewLine:imageView cornerRadius:20 with:1 color:[UIColor whiteColor]];
    [imageView setBackgroundImage:[UIImage imageNamed:@"avatar.png"] forState:UIControlStateNormal];
    [imageView setUserInteractionEnabled:NO];
    imageView.clipsToBounds = YES;
    self.imageHead = imageView;
    [self addSubview:imageView];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x+imageView.frame.size.width+5,imageView.frame.origin.y+5 , 93, 12)];
    [nameLabel setText:@"鸟鸟鸟"];
    [nameLabel setTextColor:[UIColor blackColor]];
    [nameLabel setFont:[UIFont systemFontOfSize:14]];
    [nameLabel setTextAlignment:NSTextAlignmentLeft];
    self.nameLabel = nameLabel;
    [self addSubview:nameLabel];
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(5,nameLabel.frame.origin.y+15 , 200, 12)];
    [dateLabel setText:@"2015/3/9 14:21"];
    [dateLabel setTextColor:[UIColor darkGrayColor]];
    [dateLabel setFont:[UIFont systemFontOfSize:14]];
    [dateLabel setTextAlignment:NSTextAlignmentCenter];
    self.dateLabel = dateLabel;
    [self addSubview:dateLabel];
    //    分割线
    UIView *viewDown = [[UIView alloc] initWithFrame:CGRectMake(0, imageView.frame.origin.y+imageView.frame.size.height+10, [UIScreen mainScreen].applicationFrame.size.width, 1)];
    [viewDown setBackgroundColor:[Tools colorWithRed:236 angGreen:236 andBlue:236]];
    [self addSubview:viewDown];
    [self infoLabel:viewDown.frame.origin.y+10];

}
-(void)infoLabel:(CGFloat)y
{
    UILabel * infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, y, [UIScreen mainScreen].bounds.size.width-20, Inforect.size.height)];
    infoLabel.numberOfLines = 0;
    infoLabel.lineBreakMode = NSLineBreakByWordWrapping;
    infoLabel.font = [UIFont systemFontOfSize:14];
    infoLabel.text = _infoStr;
    infoLabel.textColor = [UIColor darkGrayColor];
    infoLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:infoLabel];
    [self resetContent:infoLabel];
    UIView *viewDown = [[UIView alloc] initWithFrame:CGRectMake(0, infoLabel.frame.origin.y+infoLabel.frame.size.height+40, [UIScreen mainScreen].applicationFrame.size.width, 1)];
    [viewDown setBackgroundColor:[Tools colorWithRed:236 angGreen:236 andBlue:236]];
     [self addSubview:viewDown];
    PointLike * pl = [[PointLike alloc]initWithString:@"3332"];
    pl.frame = CGRectMake(self.frame.size.width-110, viewDown.frame.origin.y-30, 25, 25);
    [self addSubview:pl];
    _LCLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, viewDown.frame.origin.y-25, 80, 25)];
    _LCLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_LCLabel];
}
-(void)createReviewView
{
    
}
- (void)resetContent:(UILabel *)lab{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:lab.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.maximumLineHeight = 60;  //最大的行高
    paragraphStyle.lineSpacing = 1.5;  //行自定义行高度
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [lab.text length])];
    lab.attributedText = attributedString;
    [lab sizeToFit];
}
-(CGRect)cellHight:(NSString *)cellText Size:(CGSize)size
{
    CGRect rect = [cellText boundingRectWithSize:size options:
                   NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil];
    return rect;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
