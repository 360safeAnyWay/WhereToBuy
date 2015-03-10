//
//  IsBuyTopicDetailViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-27.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "IsBuyTopicDetailViewController.h"
#import "NavBackButton.h"
#import "IsBuyTopTableViewCell.h"
@implementation IsBuyTopicDetailViewController
{
    UITableView * _myTableView;
    CGRect  Inforect;
    BOOL            _isOpen;
    UIImageView * _anImage;

}

- (void)viewDidLoad
{
    //   导航返回
    [self backButton];
    [self createTableView];
    [self createWindowView];
    
}
//tagView功能栏
-(void)createWindowView
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-60, [UIScreen mainScreen].bounds.size.height-60, 50, 50)];
    [[UIApplication sharedApplication].delegate.window addSubview:view];
    view.clipsToBounds = YES;
    view.layer.cornerRadius = 25;
    view.tag = 1975;
    UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-80, 50)];
    UIImage * images  = [UIImage imageNamed:@"backG.png"];
    [images stretchableImageWithLeftCapWidth:25 topCapHeight:20];
    image.image = images;
    [view addSubview:image];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 50);
    btn.layer.cornerRadius = 25;
    btn.clipsToBounds = YES;
    [btn setBackgroundImage:[UIImage imageNamed:@"black.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(WindowBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    _anImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    _anImage.image = [UIImage imageNamed:@"begin2.png"];
    [view addSubview:_anImage];
    [self createWindowViewAddUI];
    
}
//windowView 控件
-(void)createWindowViewAddUI
{
    
}
-(void)WindowBtnClick:(UIButton *)btn
{
    
   // view 动画;
    if (_isOpen == NO)
    {
        
        [UIView animateWithDuration:0.5 animations:^{
            _anImage.alpha = 0;
            _anImage.userInteractionEnabled = YES;
        } completion:^(BOOL finished) {
            [self animationWithView:70.f widthes:[UIScreen mainScreen].bounds.size.width-80];

        }];
        _isOpen = YES;
    }
    else{
        
        [self animationWithView:[UIScreen mainScreen].bounds.size.width-60 widthes:50] ;
        _isOpen = NO;

    }
    
}
#pragma mark- TableView
-(void)createTableView
{
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_myTableView];
}
//返回按钮的创建
-(void)backButton
{
    NavBackButton *backBtn = [[NavBackButton alloc] initWithFrame:CGRectMake(0, 0, 105, 26)];
    [backBtn setImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [backBtn setTitle:@"主题内容" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
}
//返回
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    [self animationWithView:[UIScreen mainScreen].bounds.size.width widthes:50];
    UIView * view = [[UIApplication sharedApplication].delegate.window viewWithTag:1975];
   
    dispatch_main_after(1.5f, ^{
        [view removeFromSuperview];
    });
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    _infoStr     =  @"1、做英语阅读的感觉： 我们知道贤鏛是在生活中很重要的。比如在鼙蛮和贎胡里，有彃燊在罅鸡那里蘩墝，之前他们链滼鞷蕻贱鬡鴊雫宽裤湾旷隗谡坚镊蠵恒闳嘑傡彚槩滼鞷蕻贱鬡艐倏雫宽裤湾旷隗谡坚镊蠵。 1，鞷 在文中的意思？ 2，给这篇文章起个标题？ 3，作者想告诉我们什么？2、学渣滴考试心得：语文考试时觉得自己是外国人，英语考试时又觉得自己变回中国人了，数学考试时发现试卷上都是外星文。3、一天下课我问同桌：“咱俩谁爹谁儿子？”同桌想了半天来一句：“我爹你儿子。”随后我说：“好孙子。。。”4、我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。";
    Inforect = [self  cellHight:_infoStr Size:CGSizeMake(210, 0)];

    return 200+Inforect.size.height;
}
#pragma mark- 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    IsBuyTopTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if ( cell == nil)
    {
        cell = [[IsBuyTopTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    return cell;
  
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//计算高度
-(CGRect)cellHight:(NSString *)cellText Size:(CGSize)size
{
    CGRect rect = [cellText boundingRectWithSize:size options:
                   NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil];
    return rect;
}
-(void)animationWithView:(CGFloat)X widthes:(CGFloat)widthes
{
    UIView * view = [[UIApplication sharedApplication].delegate.window viewWithTag:1975];
    [UIView animateWithDuration:1 animations:^{
        CGRect rect = view.frame;
        rect.origin.x = X;
        rect.size.width =widthes;
        view.frame = rect;
    } completion:^(BOOL finished) {
        if (_isOpen == NO)
        {
            [UIView animateWithDuration:0.5 animations:^{
                _anImage.alpha = 1;
                
            }];
        }
        _anImage.userInteractionEnabled = NO;


    }];
}
//延迟加载
static void dispatch_main_after(NSTimeInterval delay, void (^block)(void))
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        block();
    });
}
@end
