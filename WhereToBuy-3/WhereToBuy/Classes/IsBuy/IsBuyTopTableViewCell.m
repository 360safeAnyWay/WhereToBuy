//
//  IsBuyTopTableViewCell.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/9.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "IsBuyTopTableViewCell.h"
@implementation IsBuyTopTableViewCell
{
    CGRect  Inforect;
}
- (void)awakeFromNib {

   
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
         _markString1 = @"#当代旭辉墅";
        _markString2 = @"#德州烤鸡";
<<<<<<< HEAD
        _infoStr     =  @"1、做英语阅读的感觉： 我们知道贤鏛是在生活中很重要的。比如在鼙蛮和贎胡里，有彃燊在罅鸡那里蘩墝，之前他们链滼鞷蕻贱鬡鴊雫宽裤湾旷隗谡坚镊蠵恒闳嘑傡彚槩滼鞷蕻贱鬡艐倏雫宽裤湾旷隗谡坚镊蠵。 1，鞷 在文中的意思？ 2，给这篇文章起个标题？ 3，作者想告诉我们什么？2、学渣滴考试心得：语文考试时觉得自己是外国人，英语考试时又觉得自己变回中国人了，数学考试时发现试卷上都是外星文。3、一天下课我问同桌：“咱俩谁爹谁儿子？”同桌想了半天来一句：“我爹你儿子。”随后我说：“好孙子。。。”4、我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。1、做英语阅读的感觉： 我们知道贤鏛是在生活中很重要的。比如在鼙蛮和贎胡里，有彃燊在罅鸡那里蘩墝，之前他们链滼鞷蕻贱鬡鴊雫宽裤湾旷隗谡坚镊蠵恒闳嘑傡彚槩滼鞷蕻贱鬡艐倏雫宽裤湾旷隗谡坚镊蠵。 1，鞷 在文中的意思？ 2，给这篇文章起个标题？ 3，作者想告诉我们什么？2、学渣滴考试心得：语文考试时觉得自己是外国人，英语考试时又觉得自己变回中国人了，数学考试时发现试卷上都是外星文。3、一天下课我问同桌：“咱俩谁爹谁儿子？”同桌想了半天来一句：“我爹你儿子。”随后我说：“好孙子。。。”4、我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。1、做英语阅读的感觉： 我们知道贤鏛是在生活中很重要的。比如在鼙蛮和贎胡里，有彃燊在罅鸡那里蘩墝，之前他们链滼鞷蕻贱鬡鴊雫宽裤湾旷隗谡坚镊蠵恒闳嘑傡彚槩滼鞷蕻贱鬡艐倏雫宽裤湾旷隗谡坚镊蠵。 1，鞷 在文中的意思？ 2，给这篇文章起个标题？ 3，作者想告诉我们什么？2、学渣滴考试心得：语文考试时觉得自己是外国人，英语考试时又觉得自己变回中国人了，数学考试时发现试卷上都是外星文。3、一天下课我问同桌：“咱俩谁爹谁儿子？”同桌想了半天来一句：“我爹你儿子。”随后我说：“好孙子。。。”4、我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。1、做英语阅读的感觉： 我们知道贤鏛是在生活中很重要的。比如在鼙蛮和贎胡里，有彃燊在罅鸡那里蘩墝，之前他们链滼鞷蕻贱鬡鴊雫宽裤湾旷隗谡坚镊蠵恒闳嘑傡彚槩滼鞷蕻贱鬡艐倏雫宽裤湾旷隗谡坚镊蠵。 1，鞷 在文中的意思？ 2，给这篇文章起个标题？ 3，作者想告诉我们什么？2、学渣滴考试心得：语文考试时觉得自己是外国人，英语考试时又觉得自己变回中国人了，数学考试时发现试卷上都是外星文。3、一天下课我问同桌：“咱俩谁爹谁儿子？”同桌想了半天来一句：“我爹你儿子。”随后我说：“好孙子。。。”4、我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。";
        Inforect = [self  cellHight:_infoStr Size:CGSizeMake(210, 0)];
        CGRect rect = self.frame;
        rect.size.height = 200+Inforect.size.height;
        self.frame = rect;
        //     创建视图
        [self createView];
        [self createPointLikes];
=======
        _infoStr     =  @"我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。";
        if (IPhone5||IPhone4)
        {
            Inforect = [self  cellHight:_infoStr Size:CGSizeMake(300, 0)];
        }else{
            
            Inforect = [self  cellHight:_infoStr Size:CGSizeMake([UIScreen mainScreen].bounds.size.width-30, 0)];
    }
//        if(IPhone4||IPhone5){
//            Inforect = [self  cellHight:_infoStr Size:CGSizeMake(210, 0)];
//            CGRect rect = self.frame;
//            rect.size.height = 200+Inforect.size.height;
//            self.frame = rect;
//        }else if(IPhone6){
//            Inforect = [self  cellHight:_infoStr Size:CGSizeMake(210, 0)];
//            NSLog(@"%f",Inforect.size.height);
//            CGRect rect = self.frame;
//            rect.size.height = 280+Inforect.size.height;
//            self.frame = rect;
//        }else{
//            Inforect = [self  cellHight:_infoStr Size:CGSizeMake(210, 0)];
//            CGRect rect = self.frame;
//            rect.size.height = 200+Inforect.size.height;
//            self.frame = rect;
//        }
        
        //     创建视图
        [self createView];
>>>>>>> parent of e1f60e4... d大是大非上的
        
    }
    return self;
}
<<<<<<< HEAD
//点赞按钮
-(void)createPointLikes
{
    _pl = [[PointLike alloc]initWithString:@"33652"];
    _pl.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-110, self.frame.size.height-45, 100, 25);
    [self.contentView addSubview:_pl];
}
-(void)createView
{
//    底部的间隔
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-10, [UIScreen mainScreen].applicationFrame.size.width, 10)];
    [view setBackgroundColor:[Tools colorWithRed:240 angGreen:240 andBlue:240]];

    [self addSubview:view];
=======
-(void)createView
{
>>>>>>> parent of e1f60e4... d大是大非上的
    UIButton *imageView = [[UIButton alloc] initWithFrame:CGRectMake(13, 15, 40, 40)];
    [Tools setUIViewLine:imageView cornerRadius:20 with:1 color:[UIColor whiteColor]];
    [imageView setBackgroundImage:[UIImage imageNamed:@"avatar.png"] forState:UIControlStateNormal];
    [imageView setUserInteractionEnabled:NO];
    imageView.clipsToBounds = YES;
    self.imageHead = imageView;
    [self addSubview:imageView];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x+imageView.frame.size.width,imageView.frame.origin.y , 93, 12)];
    [nameLabel setText:@"小二呆"];
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
    UIButton *mark1 = [[UIButton alloc] initWithFrame:CGRectMake(imageView.frame.size.width+15, dateLabel.frame.origin.y + dateLabel.frame.size.height + 5, 80, 26)];
    [Tools setUIViewLine:mark1 cornerRadius:4 with:1 color:[UIColor clearColor]];
    [mark1 setBackgroundColor:kMainColor];
    [mark1 setTitle:_markString1 forState:UIControlStateNormal];
    [mark1 setUserInteractionEnabled:NO];
    [mark1.titleLabel setFont:[UIFont systemFontOfSize:13]];
    self.mark1 = mark1;
    [self addSubview:mark1];
    UIButton *mark2 = [[UIButton alloc] initWithFrame:CGRectMake(mark1.frame.origin.x + mark1.frame.size.width + 5, mark1.frame.origin.y, 80, 26)];
    [Tools setUIViewLine:mark2 cornerRadius:4 with:1 color:[UIColor clearColor]];
    [mark2 setBackgroundColor:kMainColor];
    [mark2 setTitle:_markString2 forState:UIControlStateNormal];
    [mark2 setUserInteractionEnabled:NO];
    [mark2.titleLabel setFont:[UIFont systemFontOfSize:13]];
    self.mark2 = mark2;
    [self addSubview:mark2];
    _tStr = @"点燃全北京得别墅,当代旭辉墅很牛!";
    CGRect rect1 = [_tStr boundingRectWithSize:CGSizeMake(210, 0) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(10, mark1.frame.origin.y+20, [UIScreen mainScreen].bounds.size.width, rect1.size.height)];
    title.numberOfLines = 0;
    title.lineBreakMode = NSLineBreakByWordWrapping;
    title.text  = _tStr;
    [self addSubview:title];
//    分割线
    UIView *viewDown = [[UIView alloc] initWithFrame:CGRectMake(0, title.frame.origin.y+title.frame.size.height, [UIScreen mainScreen].applicationFrame.size.width, 1)];
    [viewDown setBackgroundColor:kMainColor];
    [self addSubview:viewDown];
    [self createInfoStr:viewDown.frame.origin.y+10];
    
    
<<<<<<< HEAD
=======
    
>>>>>>> parent of e1f60e4... d大是大非上的
}
-(void)createInfoStr:(CGFloat)y
{
    UILabel * infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, y, [UIScreen mainScreen].bounds.size.width-20, Inforect.size.height)];
    infoLabel.numberOfLines = 0;
    infoLabel.lineBreakMode = NSLineBreakByWordWrapping;
<<<<<<< HEAD
    infoLabel.font = [UIFont systemFontOfSize:14];
    infoLabel.text = _infoStr;
    infoLabel.textColor = [UIColor darkGrayColor];
    infoLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:infoLabel];
    [self resetContent:infoLabel];
=======
    infoLabel.font = [UIFont systemFontOfSize:12];
    infoLabel.text = _infoStr;
    infoLabel.backgroundColor = [UIColor redColor];
    infoLabel.textColor = [UIColor darkGrayColor];
    infoLabel.adjustsFontSizeToFitWidth = YES;
    infoLabel.lineBreakMode=NSLineBreakByCharWrapping;
    [self addSubview:infoLabel];
    [self resetContent:infoLabel];
    _pl = [[PointLike alloc]initWithString:@"33652"];
    _pl.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-110, infoLabel.frame.origin.y+infoLabel.frame.size.height+10, 100, 25);
    [self.contentView addSubview:_pl];
    //    底部的间隔
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, _pl.frame.origin.y+_pl.frame.size.height+10, [UIScreen mainScreen].applicationFrame.size.width, 10)];
    [view setBackgroundColor:[Tools colorWithRed:240 angGreen:240 andBlue:240]];
    [self addSubview:view];

>>>>>>> parent of e1f60e4... d大是大非上的
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
<<<<<<< HEAD
                   NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil];
=======
                   NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
>>>>>>> parent of e1f60e4... d大是大非上的
    return rect;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
