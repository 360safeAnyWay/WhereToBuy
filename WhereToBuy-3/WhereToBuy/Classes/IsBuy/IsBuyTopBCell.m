//
//  IsBuyTopBCell.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/10.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "IsBuyTopBCell.h"

@implementation IsBuyTopBCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect rect = self.frame;
        rect.size.height = 200;
        self.frame = rect;
        [self createUI];
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

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
