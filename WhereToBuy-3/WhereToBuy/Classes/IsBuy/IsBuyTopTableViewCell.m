//
//  IsBuyTopTableViewCell.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/9.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "IsBuyTopTableViewCell.h"
@implementation IsBuyTopTableViewCell

- (void)awakeFromNib {

   
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
         _markString1 = @"#当代旭辉墅";
        CGRect rect = self.frame;
        rect.size.height = 200;
        self.frame = rect;
        //     创建视图
        NSLog(@"%f",self.frame.size.height);
        [self createView];
        
    }
    return self;
}
-(void)createView
{
//    底部的间隔
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-10, [UIScreen mainScreen].applicationFrame.size.width, 10)];
    [view setBackgroundColor:[Tools colorWithRed:240 angGreen:240 andBlue:240]];
    [self addSubview:view];
    UIButton *imageView = [[UIButton alloc] initWithFrame:CGRectMake(13, 15, 40, 40)];
    [Tools setUIViewLine:imageView cornerRadius:20 with:1 color:[UIColor whiteColor]];
    [imageView setBackgroundImage:[UIImage imageNamed:@"avatar.png"] forState:UIControlStateNormal];
    [imageView setUserInteractionEnabled:NO];
    imageView.clipsToBounds = YES;
    self.imageHead = imageView;
    [self addSubview:imageView];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x+imageView.frame.size.width-15,imageView.frame.origin.y , 93, 12)];
    [nameLabel setText:@"小二呆"];
    [nameLabel setTextColor:[UIColor blackColor]];
    [nameLabel setFont:[UIFont systemFontOfSize:14]];
    [nameLabel setTextAlignment:NSTextAlignmentCenter];
    self.nameLabel = nameLabel;
    [self addSubview:nameLabel];
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(nameLabel.frame.origin.x-25,nameLabel.frame.origin.y+15 , 200, 12)];
    [dateLabel setText:@"2015/3/9 14:21"];
    [dateLabel setTextColor:[UIColor darkGrayColor]];
    [dateLabel setFont:[UIFont systemFontOfSize:14]];
    [dateLabel setTextAlignment:NSTextAlignmentCenter];
    self.dateLabel = dateLabel;
    [self addSubview:dateLabel];
    UIButton *mark1 = [[UIButton alloc] initWithFrame:CGRectMake(nameLabel.frame.origin.x+25, dateLabel.frame.origin.y + dateLabel.frame.size.height + 5, 80, 26)];
    [Tools setUIViewLine:mark1 cornerRadius:4 with:1 color:[UIColor clearColor]];
    [mark1 setBackgroundColor:[Tools colorWithRed:253 angGreen:134 andBlue:40]];
    [mark1 setTitle:_markString1 forState:UIControlStateNormal];
    [mark1 setUserInteractionEnabled:NO];
    [mark1.titleLabel setFont:[UIFont systemFontOfSize:13]];
    self.mark1 = mark1;
    [self addSubview:mark1];
//    UIButton *mark2 = [[UIButton alloc] initWithFrame:CGRectMake(mark1.frame.origin.x + mark1.frame.size.width + 5, mark1.frame.origin.y, 80, 26)];
//    [Tools setUIViewLine:mark2 cornerRadius:4 with:1 color:[UIColor clearColor]];
//    [mark2 setBackgroundColor:[Tools colorWithRed:253 angGreen:134 andBlue:40]];
//    [mark2 setTitle:_markString2 forState:UIControlStateNormal];
//    [mark2 setUserInteractionEnabled:NO];
//    [mark2.titleLabel setFont:[UIFont systemFontOfSize:13]];
//    self.mark2 = mark2;
//    [self addSubview:mark2];
    _tStr = @"点燃全北京得别墅,当代旭辉墅很牛！呵呵--------__________________________________________";
    CGRect rect1 = [_tStr boundingRectWithSize:CGSizeMake(210, 0) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(10, mark1.frame.origin.y+10, [UIScreen mainScreen].bounds.size.width, rect1.size.height)];
    title.backgroundColor = [UIColor redColor];
    title.text  = _tStr;
    [self addSubview:title];
    
    
}
-(CGRect)cellHight:(NSString *)cellText Size:(CGSize)size
{
    CGRect rect = [cellText boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|
                   NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    return rect;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
