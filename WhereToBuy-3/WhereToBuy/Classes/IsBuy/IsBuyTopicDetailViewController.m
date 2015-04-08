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
#import "IsBuyTopBCell.h"
#import "ReviewViewController.h"
#import "IsBuyTopesTableViewCell.h"

#define FONT_SIZE 17.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f

@implementation IsBuyTopicDetailViewController
{
    UITableView * _myTableView;
    CGRect  Inforect;
    BOOL            _isOpen;
    UIImageView * _anImage;
    //    箭头
    UIImageView * _Zimage;
    PointLike   * _pl;
//    回复按钮
    UIButton    * _HButton;
//    🌲杠;
    UIView      * _viewInViewFrameD;
    CGFloat _Sheight;
    NSString    * _cellStr;

}

- (void)viewDidLoad
{
    _infoStrs = @"我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。";
    _reviewArray = [[NSMutableArray alloc]initWithObjects:@"提莫     回复 @鸟鸟鸟 提莫露脸团战可以输提莫必须S团战可以输提莫必须S团战可以输提莫必须S团战可以输提莫必须S团战可以输提莫必须S",@"德莱文  回复 @提莫 这不是提莫吗?团战可以输提莫必须S团战可以输提莫必须S团战可以输提莫必须S",@"盲僧     回复 @德莱文 团战可以输提莫必须S团战可以输提莫必须S团战可以输提莫必须S团战可以输提莫必须S团战可以输提莫必须S", nil];
    for (NSInteger i = 0; i <3; i++)
    {
        NSString * str = [_reviewArray objectAtIndex:i];
        CGRect Rrect = [self cellHight:str Size:CGSizeMake(210, 0)];
        CGFloat Sheight  = ceilf(Rrect.size.height);
        _Sheight =_Sheight+Sheight;
    }
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
    
}
//windowView 控件
-(void)createWindowViewAddUI
{
//    箭头
    _Zimage = [[UIImageView alloc]initWithFrame:CGRectMake(-10, 0, 50, 50)];
    _Zimage.image= [UIImage imageNamed:@"rightarrow.png"];
     UIView * view = [[UIApplication sharedApplication].delegate.window viewWithTag:1975];
    _Zimage.alpha = 0;
    _Zimage.userInteractionEnabled = YES;
    [view addSubview:_Zimage];
    _pl = [[PointLike alloc]initWithString:@"33652"];
    _pl.frame = CGRectMake(20, 10, 100, 25);
    [_pl.plusBtn setBackgroundImage:[UIImage imageNamed:@"Zup.png"] forState:0];
    [_pl.subBtn setBackgroundImage:[UIImage imageNamed:@"Zdown.png"] forState:0];
    _pl.zanCount.textColor = [UIColor whiteColor];
    _pl.alpha = 0;
    [view addSubview:_pl];
    _viewInViewFrameD = [[UIView alloc] initWithFrame:CGRectMake(_pl.frame.origin.x+_pl.frame.size.width+17, 10, 0.5, 30)];
    [_viewInViewFrameD setBackgroundColor:[UIColor whiteColor]];
    _viewInViewFrameD.alpha = 0;
    [view addSubview:_viewInViewFrameD];
    _HButton = [[UIButton alloc]initWithFrame:CGRectMake(_pl.frame.origin.x+_pl.frame.size.width,_pl.frame.origin.y+1.5, 80,24)];
    [_HButton setBackgroundImage:[UIImage imageNamed:@"huifulouzhu.png"] forState:0];
    [_HButton addTarget:self action:@selector(BlackLZ:) forControlEvents:UIControlEventTouchUpInside];
    _HButton.alpha = 0;
    [view addSubview:_HButton];
    [UIView animateWithDuration:0.2 animations:^{
        CGRect rect = _Zimage.frame;
        rect.origin.x = 0;
        _Zimage.frame = rect;
        _Zimage.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            CGRect rect = _pl.frame;
            rect.origin.x = 30;
            _pl.frame = rect;
            _pl.alpha = 1;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                CGRect rect = _viewInViewFrameD.frame;
                rect.origin.x = _pl.frame.origin.x+_pl.frame.size.width+10;
                _viewInViewFrameD.frame = rect;
                _viewInViewFrameD.alpha = 1;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.2 animations:^{
                    CGRect rect = _HButton.frame;
                    rect.origin.x = _pl.frame.origin.x+_pl.frame.size.width+20;
                    _HButton.frame = rect;
                    _HButton.alpha = 1;
                    _Zimage.userInteractionEnabled = NO;

                }];
            }];
            
        }];
        
    }];
    
}
//删除动画
-(void)removeZimageView
{
    _Zimage.userInteractionEnabled = YES;
    [UIView animateWithDuration:0.2 animations:^{
        CGRect rect = _HButton.frame;
        rect.origin.x = _pl.frame.origin.x+_pl.frame.size.width+10;
        _HButton.frame = rect;
        _HButton.alpha = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            CGRect rect = _viewInViewFrameD.frame;
            rect.origin.x = _pl.frame.origin.x+_pl.frame.size.width;
            _viewInViewFrameD.frame = rect;
            _viewInViewFrameD.alpha = 0;
        } completion:^(BOOL finished) {
            [_HButton removeFromSuperview];
            _HButton = nil;
            [UIView animateWithDuration:0.2 animations:^{
                CGRect rect = _pl.frame;
                rect.origin.x = 20;
                _pl.frame = rect;
                _pl.alpha = 0;
            } completion:^(BOOL finished) {
                [_pl removeFromSuperview];
                _pl = nil;
                [UIView animateWithDuration:0.2 animations:^{
                    CGRect rect = _Zimage.frame;
                    rect.origin.x = -10;
                    _Zimage.frame = rect;
                    _Zimage.alpha = 0;
                } completion:^(BOOL finished) {
                    [_Zimage removeFromSuperview];
                    _Zimage = nil;
                    [self animationWithView:[UIScreen mainScreen].bounds.size.width-60 widthes:50];
                }];
                
            }];

        }];
    }];
    
    
}
-(void)WindowBtnClick:(UIButton *)btn
{
    
   // view 动画;
    if (_isOpen == NO)
    {
        
        [UIView animateWithDuration:0.3 animations:^{
            _anImage.alpha = 0;
            _anImage.userInteractionEnabled = YES;
        } completion:^(BOOL finished) {
            if (IPhone4||IPhone5)
            {
                [self animationWithView:70.f widthes:[UIScreen mainScreen].bounds.size.width-80];
            }
            if (IPhone6)
            {
                [self animationWithView:125.0f widthes:[UIScreen mainScreen].bounds.size.width-135];
            }
            if (IPhone6P)
            {
                [self animationWithView:135.0f widthes:[UIScreen mainScreen].bounds.size.width-155];
            }
            
            

        }];
        _isOpen = YES;
    }
    else{
        [self removeZimageView];
       
        
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
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIButton *itemBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [itemBtn2 setBackgroundImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    [itemBtn2 addTarget:self action:@selector(FXBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *more = [[UIBarButtonItem alloc] initWithCustomView:itemBtn2];
    UIButton *itemBtn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [itemBtn3 setBackgroundImage:[UIImage imageNamed:@"shoucang.png"] forState:UIControlStateNormal];
    
    [itemBtn3 addTarget:self action:@selector(SCBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *more1 = [[UIBarButtonItem alloc] initWithCustomView:itemBtn3];
    self.navigationItem.rightBarButtonItems = @[more,more1];
    [self.view setBackgroundColor:[UIColor whiteColor]];
}
#pragma mark- TopButton
-(void)SCBtn:(id)sender
{
    
}
-(void)FXBtn:(id)sender
{   

    //只需要在响应分享按钮的方法中添加以下代码即可
    NSString *img = [[NSBundle mainBundle] pathForResource:@"logoFX" ofType:@"png"];
    //NSString *img = @"http://pica.nipic.com/2007-11-09/2007119124513598_2.jpg";
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@"感谢分享买哪儿"
                                       defaultContent:@""
                                                image:[ShareSDK imageWithPath:img]
                                                title:@"买哪网欢迎你!"
                                                  url:Base_Url
                                          description:@""
                                            mediaType:SSPublishContentMediaTypeNews];
    //创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    //自定义标题栏相关委托
    id<ISSAuthOptions> authOptions = [ShareSDK authOptionsWithAutoAuth:YES
                                                         allowCallback:NO
                                                         authViewStyle:SSAuthViewStyleFullScreenPopup
                                                          viewDelegate:nil
                                               authManagerViewDelegate:nil];
    //自定义标题栏相关委托
    id<ISSShareOptions> shareOptions = [ShareSDK defaultShareOptionsWithTitle:@"买哪儿分享"
                                                              oneKeyShareList:[NSArray defaultOneKeyShareList]
                                                               qqButtonHidden:YES
                                                        wxSessionButtonHidden:YES
                                                       wxTimelineButtonHidden:YES
                                                         showKeyboardOnAppear:NO
                                                            shareViewDelegate:self
                                                          friendsViewDelegate:nil
                                                        picViewerViewDelegate:nil];
    //弹出分享菜单
    [ShareSDK showShareActionSheet:container
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:authOptions
                      shareOptions:shareOptions
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                if (state == SSResponseStateSuccess)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_ShARE_SUC", @"分享成功"));
                                     UIAlertView * alv = [[UIAlertView alloc]initWithTitle:@"分享结果" message:@"分享成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                                    [alv show];
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_ShARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                    UIAlertView * alv = [[UIAlertView alloc]initWithTitle:@"分享结果" message:@"分享失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                                    [alv show];
                                }
                            }];

}
//返回
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    UIView * view = [[UIApplication sharedApplication].delegate.window viewWithTag:1975];
    [view removeFromSuperview];

    
}
#pragma mark- 代理
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.row == 0)
    {
        NSString *text = _infoStrs;
        
        CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
        
        NSDictionary * attributes = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:FONT_SIZE] forKey:NSFontAttributeName];
        NSAttributedString *attributedText =
        [[NSAttributedString alloc]
         initWithString:text
         attributes:attributes];
        CGRect rect = [attributedText boundingRectWithSize:constraint
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                   context:nil];
        CGSize size = rect.size;
        CGFloat height = MAX(size.height, 44.0f);
        NSLog(@"%f",height);
        return height+150+ (CELL_CONTENT_MARGIN * 2);
    }else{
        _infoStr     =  @"我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。";
        Inforect = [self  cellHight:_infoStr Size:CGSizeMake(210, 0)];
        return 200+Inforect.size.height+_Sheight;
    }

    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 10;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([indexPath row] == 0)
    {
    IsBuyTopesTableViewCell  * cell = [[[NSBundle mainBundle]loadNibNamed:@"IsBuyTopesTableViewCell" owner:nil options:nil]objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.info.text = _infoStrs;
        [cell.info setLineBreakMode:NSLineBreakByWordWrapping];
      

        return cell;
    }else{
    
        static NSString * str = @"BCell";
        IsBuyTopBCell * BCell = [tableView dequeueReusableCellWithIdentifier:str];
        if (BCell == nil)
        {
            BCell = [[IsBuyTopBCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BCell"];
            //[BCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
    BCell.LCLabel.text = [NSString stringWithFormat:@"%ld楼",(long)[indexPath row]];
    
        return BCell;
    }
   
  
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
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect = view.frame;
        rect.origin.x = X;
        rect.size.width =widthes;
        view.frame = rect;
    } completion:^(BOOL finished) {
        if (_isOpen == NO)
        {
            [UIView animateWithDuration:0.3 animations:^{
                _anImage.alpha = 1;
            }];
        }else{
            [self createWindowViewAddUI];

        }
        _anImage.userInteractionEnabled = NO;
        

    }];
}
#pragma mark- 回复界面
-(void)BlackLZ:(UIButton *)btn
{
    UIView * view = [[UIApplication sharedApplication].delegate.window viewWithTag:1975];
    view.alpha = 0;
    ReviewViewController * review = [[ReviewViewController alloc]init];
    [self.navigationController pushViewController:review animated:YES];
    
}
- (void)viewOnWillDisplay:(UIViewController *)viewController shareType:(ShareType)shareType

{
    
    //修改分享编辑框的标题栏颜色
    viewController.navigationController.navigationBar.barTintColor = kMainColor;
    
    //将分享编辑框的标题栏替换为图片
    //    UIImage *image = [UIImage imageNamed:@"iPhoneNavigationBarBG.png"];
    //    [viewController.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
}

@end
