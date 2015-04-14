//
//  TopicCell.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-29.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "TopicCell.h"
#import "Tools.h"
#import "UIButton+WebCache.h"
#import "AnimationView.h"

@interface TopicCell()

@property (weak, nonatomic) UIButton *imageHead;//头像59
@property (weak, nonatomic) UILabel *titleLabel1;//标题label1
@property (weak, nonatomic) UILabel *titleLabel2;//标题label2
@property (weak, nonatomic) UIButton *labelingBtn;//标贴按钮
@property (weak, nonatomic) UITextView *detailTextView;//详细描述View
@property (weak, nonatomic) UILabel *nameLabel;//姓名
@property (strong, nonatomic) UIButton *plusBtn;//点赞按钮
@property (strong, nonatomic) UIButton *subBtn;//踩按钮
@property (strong, nonatomic) UILabel *zanCount;//点赞按钮
@property (weak, nonatomic) UIButton *viewCount;//浏览次数
@property (weak, nonatomic) UIButton *commentCount;//评论数
@property (weak, nonatomic) UIButton *mark1;//标签1
@property (weak, nonatomic) UIButton *mark2;//标签1
@property (weak, nonatomic) UIView *viewDown;//为了兼容发表的评论
@property (weak, nonatomic) UIImageView *zanImage;//点赞动画的哪个image

@end

@implementation TopicCell

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //底部白色分割条
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 170, [UIScreen mainScreen].applicationFrame.size.width, 10)];
        [view setBackgroundColor:[Tools colorWithRed:240 angGreen:240 andBlue:240]];
        [self addSubview:view];
        //头像
        UIButton *imageView = [[UIButton alloc] initWithFrame:CGRectMake(13, 15, 60, 60)];
        [Tools setUIViewLine:imageView cornerRadius:30 with:1 color:[UIColor whiteColor]];
        [imageView setBackgroundImage:[UIImage imageNamed:@"avatar.png"] forState:UIControlStateNormal];
        [imageView setUserInteractionEnabled:NO];
        imageView.clipsToBounds = YES;
        self.imageHead = imageView;
        [self addSubview:imageView];
        
        //用户名
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.frame.origin.y + imageView.frame.size.height + 10, 93, 12)];
        [nameLabel setText:@"好名没得取"];
        [nameLabel setTextColor:kMainTextColor];
        [nameLabel setFont:[UIFont systemFontOfSize:14]];
        [nameLabel setTextAlignment:NSTextAlignmentCenter];
        self.nameLabel = nameLabel;
        [self addSubview:nameLabel];
        
        //91  16分割线  点点
        UIImageView *imageLineV = [[UIImageView alloc] initWithFrame:CGRectMake(91, 16, 2, 111.5)];
        [imageLineV setImage:[UIImage imageNamed:@"diandian.png"]];
        [self addSubview:imageLineV];
        
        //分割线   底部长线
        UIView *viewDown = [[UIView alloc] initWithFrame:CGRectMake(0, 138, [UIScreen mainScreen].applicationFrame.size.width, 1)];
        [viewDown setBackgroundColor:kMainColor];
        [self addSubview:viewDown];
        
        //标题1
        UILabel *titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(106, 17, 140, 12)];
        [titleLabel1 setText:@"点燃全北京得别墅,"];
        [titleLabel1 setFont:[UIFont systemFontOfSize:14]];
        [titleLabel1 setTextColor:[UIColor blackColor]];
        self.titleLabel1 = titleLabel1;
        [self addSubview:titleLabel1];
        
        //标题2
        UILabel *titleLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(106, titleLabel1.frame.origin.y + titleLabel1.frame.size.height + 5, 140, 12)];
        [titleLabel2 setText:@"当代旭辉墅很牛！"];
        [titleLabel2 setFont:[UIFont systemFontOfSize:14]];
        [titleLabel2 setTextColor:[UIColor blackColor]];
        self.titleLabel2 = titleLabel2;
        [self addSubview:titleLabel2];
        
        //标签1
        UIButton *mark1 = [[UIButton alloc] initWithFrame:CGRectMake(titleLabel2.frame.origin.x, titleLabel2.frame.origin.y + titleLabel2.frame.size.height + 5, 80, 26)];
        [Tools setUIViewLine:mark1 cornerRadius:4 with:1 color:[UIColor clearColor]];
        [mark1 setBackgroundColor:kMainColor];
        [mark1 setTitle:@"＃当代旭辉墅" forState:UIControlStateNormal];
        [mark1 setUserInteractionEnabled:NO];
        [mark1.titleLabel setFont:[UIFont systemFontOfSize:13]];
        self.mark1 = mark1;
        [self addSubview:mark1];
        
        //标签1
        UIButton *mark2 = [[UIButton alloc] initWithFrame:CGRectMake(mark1.frame.origin.x + mark1.frame.size.width + 5, mark1.frame.origin.y, 80, 26)];
        [Tools setUIViewLine:mark2 cornerRadius:4 with:1 color:[UIColor clearColor]];
        [mark2 setBackgroundColor:kMainColor];
        [mark2 setTitle:@"＃当代旭辉墅" forState:UIControlStateNormal];
        [mark2 setUserInteractionEnabled:NO];
        [mark2.titleLabel setFont:[UIFont systemFontOfSize:13]];
        self.mark2 = mark2;
        [self addSubview:mark2];
        
        //detailTextView
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(mark1.frame.origin.x, mark1.frame.origin.y + mark1.frame.size.height, 200, 50)];
        [textView setText:@"我们都是什么啥意思你试试墅地方撒旦发阿三地方阿三地方撒旦发撒旦发阿三地方阿三地方阿三大发撒旦发撒aksjdfljasldfjlasjdfljsa"];
        textView.editable = NO;
        [textView setFont:kMainFont(11)];
        [textView setTextColor:kMainTextColor];
        [textView setUserInteractionEnabled:NO];
        self.detailTextView = textView;
        [self addSubview:textView];
        
        //底部显示控件得那个view
        UIView *viewFrameDown = [[UIView alloc] initWithFrame:CGRectMake(0, 139, [UIScreen mainScreen].applicationFrame.size.width, 32)];
        [viewFrameDown setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:viewFrameDown];
        self.viewDown = viewFrameDown;
        
        //点赞按钮＋1
        UIButton *plusBtn = [[UIButton alloc] initWithFrame:CGRectMake(14, 6.5, 19, 19)];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"isBuyUp.png"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"up_highlighted.png"] forState:UIControlStateSelected];
        [plusBtn addTarget:self action:@selector(zanPlusOne:) forControlEvents:UIControlEventTouchUpInside];
        [viewFrameDown addSubview:plusBtn];
        self.plusBtn = plusBtn;
        
        //点赞数
        UILabel *numZan = [[UILabel alloc] initWithFrame:CGRectMake(plusBtn.frame.origin.x + plusBtn.frame.size.width, plusBtn.frame.origin.y, 45, plusBtn.frame.size.height)];
        [numZan setText:@"33652"];
        [numZan setTextColor:kMainTextColor];
        [numZan setFont:[UIFont systemFontOfSize:12]];
        [numZan setTextAlignment:NSTextAlignmentCenter];
        [viewFrameDown addSubview:numZan];
        self.zanCount = numZan;
        
        //踩按钮－1
        UIButton *subBtn = [[UIButton alloc] initWithFrame:CGRectMake(numZan.frame.origin.x + numZan.frame.size.width, numZan.frame.origin.y, plusBtn.frame.size.width, plusBtn.frame.size.height)];
        [subBtn setBackgroundImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        [subBtn setBackgroundImage:[UIImage imageNamed:@"down_highlighted.png"] forState:UIControlStateSelected];
        [subBtn addTarget:self action:@selector(zanSubOne:) forControlEvents:UIControlEventTouchUpInside];
        [viewFrameDown addSubview:subBtn];
        self.subBtn = subBtn;
        
        //分割线 －－－ 底部view中得分割线
        UIView *viewInViewFrameD = [[UIView alloc] initWithFrame:CGRectMake(222, 6, 1, 17)];
        [viewInViewFrameD setBackgroundColor:[Tools colorWithRed:197 angGreen:187 andBlue:187]];
        [viewFrameDown addSubview:viewInViewFrameD];
        
        //浏览次数
        UIButton *viewCount = [UIButton buttonWithType:UIButtonTypeCustom];
        [viewCount setFrame:CGRectMake(126, 7, 85, 20)];
        [viewCount setTitle:@"    44256次浏览" forState:UIControlStateNormal];//一共12个数字
        [viewCount setTitleColor:kMainTextColor forState:UIControlStateNormal];
        [viewCount.titleLabel setFont:[UIFont systemFontOfSize:12]];
        self.viewCount = viewCount;
        [viewFrameDown addSubview:viewCount];
        
        //眼睛图像
        UIImageView *imageViewEye = [[UIImageView alloc] initWithFrame:CGRectMake(0, 4, 17, 10)];
        [imageViewEye setImage:[UIImage imageNamed:@"eye.png"]];
        [viewCount addSubview:imageViewEye];
        
        //评论次数
        UIButton *commentCount = [UIButton buttonWithType:UIButtonTypeCustom];
        [commentCount setFrame:CGRectMake(viewCount.frame.origin.x + viewCount.frame.size.width + 22, viewCount.frame.origin.y, 85, 20)];
        [commentCount setTitle:@"    44256次评论" forState:UIControlStateNormal];//一共12个数字
        [commentCount setTitleColor:kMainTextColor forState:UIControlStateNormal];
        [commentCount.titleLabel setFont:[UIFont systemFontOfSize:12]];
        self.commentCount = commentCount;
        [viewFrameDown addSubview:commentCount];
        
        //眼睛图像
        UIImageView *imageViewSay = [[UIImageView alloc] initWithFrame:CGRectMake(0, 3, 13.5, 12)];
        [imageViewSay setImage:[UIImage imageNamed:@"say.png"]];
        [commentCount addSubview:imageViewSay];
    }
    return self;
}

- (void)cellInitWithDic:(NSDictionary *)dic
{
//    NSString *type = dic[@"type"];
//    if ([type isEqualToString:@"1"]) {
//        for (UIView *view in _viewDown.subviews) {
//            [view removeFromSuperview];
//        }
//        [_viewDown addSubview:self.upBtn];
//        [self.upBtn setCenter:CGPointMake(_viewDown.frame.size.width/2, _viewDown.frame.size.height / 2)];
//    }
    
}

//赞加1
- (void)zanPlusOne:(UIButton *)btn
{
    if (btn.selected != YES) {
        //先取反
        self.plusBtn.selected = YES;
        //先定义一个UIimageview
        UIImageView *zanImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plusOne.png"]];
        [zanImage setCenter:CGPointMake(self.zanCount.center.x, self.zanCount.center.y)];
        [self.viewDown insertSubview:zanImage atIndex:0];
        self.zanImage = zanImage;
        
        CAAnimationGroup *plusAnimation = [CAAnimationGroup animation];
        //定义动画组的执行时间
        [plusAnimation setDuration:1.0f];
        CABasicAnimation *opcity = [AnimationView opacityWithDuration:1.0f from:1.0 to:0.1];
        CAKeyframeAnimation *move = [AnimationView moveWithDuration:1.0f from:CGPointMake(self.zanCount.center.x, self.zanCount.center.y) to:CGPointMake(self.zanCount.center.x, self.zanCount.center.y - 40) controlPointCount:0];
        [plusAnimation setAnimations:@[opcity, move]];
        [plusAnimation setDelegate:self];
        [plusAnimation setValue:@"plus" forKey:@"animatioType"];
        [zanImage.layer addAnimation:plusAnimation forKey:nil];
    }
}

//赞减1
- (void)zanSubOne:(UIButton *)btn
{
    if (btn.selected != YES) {
        //先取反
        self.subBtn.selected = YES;
        //先定义一个UIimageview
        UIImageView *zanImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"subOne.png"]];
        [zanImage setCenter:CGPointMake(self.zanCount.center.x, self.zanCount.center.y)];
        [self.viewDown insertSubview:zanImage atIndex:0];
        self.zanImage = zanImage;
        
        CAAnimationGroup *subAnimation = [CAAnimationGroup animation];
        //定义动画组的执行时间
        [subAnimation setDuration:1.0f];
        CABasicAnimation *opcity = [AnimationView opacityWithDuration:1.0f from:1.0 to:0.1];
        CAKeyframeAnimation *move = [AnimationView moveWithDuration:1.0f from:CGPointMake(self.zanCount.center.x, self.zanCount.center.y) to:CGPointMake(self.zanCount.center.x, self.zanCount.center.y - 40) controlPointCount:0];
        [subAnimation setAnimations:@[opcity, move]];
        [subAnimation setDelegate:self];
        [subAnimation setValue:@"sub" forKey:@"animatioType"];
        [zanImage.layer addAnimation:subAnimation forKey:nil];
    }
}

//动画结束的代理方法
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.zanImage.alpha = 0.0f;
    [self.zanImage removeFromSuperview];
    NSString *type = [anim valueForKey:@"animatioType"];
    if ([type isEqualToString:@"plus"]) {
        self.subBtn.selected = NO;
    }else if ([type isEqualToString:@"sub"])
    {
        self.plusBtn.selected = NO;
    }
}


@end






