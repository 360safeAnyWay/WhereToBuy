//  PersonCenterViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-27.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "PersonCenterViewController.h"
#import "Tools.h"
#import "CenterMainCell.h"
#import "PersonTopicViewController.h"
#import "CenterMainCellButton.h"
#import "NSString+WJ.h"
#import "PersonSetViewController.h"
#import "PersonBuildingEvaluteViewController.h"
#import "PeronTipsViewController.h"
#import "PersonCollectViewController.h"
#import "DXAlertView.h"
#import "MBProgressHUD.h"
#import "SDImageCache.h"
#import "MyRemindRViewController.h"
<<<<<<< HEAD
=======
#import "USERUSERDataBase.h"
#import "LoginViewController.h"
#import "UIButton+WebCache.h"
#import "UIImageView+LBBlurredImage.h"
#import "UIImage+Screenshot.h"
#import "AFNetworkReachabilityManager.h"
#import "NotNetWorking.h"

>>>>>>> parent of e1f60e4... d大是大非上的

@interface PersonCenterViewController()
{
    UITableView *_tableView;
    NSMutableDictionary *dic;//存对应的数据
    NSMutableArray *selectedArr;//二级列表是否展开状态
    NSMutableArray *titleDataArray;//标题数组
    NSMutableArray *_titleImageArray;//图像数组
    NSMutableArray *grouparr0;
    NSString *_cacheStatePic;//标识缓存状态的图片
    MBProgressHUD *_HUD;
    NSInteger _borderWith;
    BOOL _btnInteraction;//按钮是否需要可以再次点击
    UIColor *_tilteColor;//字体的颜色
    UIImage *_iconImage;//清除缓存使用的icon
    CGFloat _cacheSize;//缓存目录得大小
<<<<<<< HEAD
=======
    USERUSERDataBase * _uudb;
    UILabel *_labelName;
    UIButton *_personImage;
    UIImage * _moImage;
    UIView * _moView;
    BOOL     _isNetWorking;
    NotNetWorking * _netView;
>>>>>>> parent of e1f60e4... d大是大非上的
}

@end

@implementation PersonCenterViewController

- (void) viewDidLoad
{
<<<<<<< HEAD
    [self addUI];
=======
    [super viewDidLoad];
    [self addUI];
    [self isNetWorking];

>>>>>>> parent of e1f60e4... d大是大非上的
}

//每次在页面加载得时候计算缓存的大小，如果缓存不为0，就显示可加载状态
- (void)viewWillAppear:(BOOL)animated
{
<<<<<<< HEAD
    NSString *path = [[Tools shareInstance] dirCache];
    CGFloat size = [[Tools shareInstance] folderSizeAtPath:path];
    NSLog(@"缓存目录是：%@",path);
    NSLog(@"缓存目录得大小是%f",size);
=======
    [super viewWillAppear:animated];
    [self.Moimage removeFromSuperview];
    [self netWorking];
    NSString *path = [[Tools shareInstance] dirCache];
    CGFloat size = [[Tools shareInstance] folderSizeAtPath:path];
>>>>>>> parent of e1f60e4... d大是大非上的
    if (size > 0) {
        _cacheStatePic = @"1dian_green.png";
        _borderWith  = 0;
        _btnInteraction = YES;
        _tilteColor = [UIColor whiteColor];
        _iconImage = [UIImage imageNamed:@"6_selected.png"];
        _cacheSize = size;
        titleDataArray[5] = @"清除缓存";
        [_tableView reloadData];
    }
<<<<<<< HEAD
}

- (void) addUI
{
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 524)];
    [scroll setShowsVerticalScrollIndicator:NO];
    [scroll setContentSize:CGSizeMake(self.view.frame.size.width, 630)];
=======
    
}
-(void)netWorking
{
    [_moView removeFromSuperview];
    [[ServiceManage shareInstance]DidUserInfo:[NSString stringWithFormat:@"http://218.244.130.25/api.php/user/info?token=%@&client=IOS&uid=%@",TOKEN,[[NSUserDefaults standardUserDefaults] objectForKey:@"uid"]] completion:^(NSMutableArray *array, NSString *error) {
        
        _uudb =  array[0];
        if (_uudb.status == 10000001)
        {
            [_labelName setText:_uudb.data.username];
            [_personImage sd_setBackgroundImageWithURL:[NSURL URLWithString:_uudb.data.photo] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"moren.png"]];
        }else{
            [self createImage];
        }
        _isNetWorking = YES;
        
    }];
}
-(void)createImage
{
     [_moView removeFromSuperview];
    [self.Moimage removeFromSuperview];
    _moView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _moImage = [UIImage screenshot];
    self.Moimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.Moimage.image = _moImage;
    [self.Moimage setImageToBlur:self.Moimage.image
                        blurRadius:kLBBlurredImageDefaultBlurRadius
                   completionBlock:^(NSError *error){

                   }];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2-100/2,0, 100)];
    btn.backgroundColor = kMainColor;
    [btn setTintColor:[UIColor whiteColor]];
    [btn addTarget:self action:@selector(loginBtn) forControlEvents:UIControlEventTouchUpInside];
    [_moView addSubview:self.Moimage];
    [_moView addSubview:btn];
   [UIView animateWithDuration:0.5f animations:^{
       btn.frame =CGRectMake(0, [UIScreen mainScreen].bounds.size.height/2-100/2, [UIScreen mainScreen].bounds.size.width, 100);
   } completion:^(BOOL finished) {
       [btn setTitle:@"登陆状态已过期!前往登陆!" forState:0];
   }];
    [self.view addSubview:_moView];
}
-(void)loginBtn
{
    LoginViewController * login = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
}
- (void) addUI
{
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [scroll setShowsVerticalScrollIndicator:NO];
    if (IPhone4)
   {
    [scroll setContentSize:CGSizeMake(self.view.frame.size.width, [UIScreen mainScreen].bounds.size.height+140)];
    }
    if(IPhone5)
    {
        [scroll setContentSize:CGSizeMake(self.view.frame.size.width, [UIScreen mainScreen].bounds.size.height+100)];

    }
    if (IPhone6)
    {
        [scroll setContentSize:CGSizeMake(self.view.frame.size.width, [UIScreen mainScreen].bounds.size.height+20)];
    }
    if (IPhone6P) {
        [scroll setContentSize:CGSizeMake(self.view.frame.size.width, [UIScreen mainScreen].bounds.size.height)];

    }
>>>>>>> parent of e1f60e4... d大是大非上的
    [scroll setBackgroundColor:[Tools colorWithRed:241 angGreen:241 andBlue:241]];
    [self.view addSubview:scroll];
    
    //头像背景
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 176)];
<<<<<<< HEAD
    [imageView setImage:[UIImage imageNamed:@"personBack.png"]];
    [scroll addSubview:imageView];
    
    //头像
    UIButton *personImage = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [personImage setFrame:CGRectMake(98, 24, 124, 124)];
    [personImage setBackgroundImage:[UIImage imageNamed:@"moren.png"] forState:UIControlStateNormal];
    personImage.clipsToBounds = YES;
    [Tools setUIViewLine:personImage cornerRadius:62 with:0 color:[UIColor whiteColor]];
    [imageView addSubview:personImage];
=======
    if (IPhone4||IPhone5)
    {
        [imageView setImage:[UIImage imageNamed:@"PersonBG@x.jpg"]];

    }else{
        [imageView setImage:[UIImage imageNamed:@"PersonBG@2x.jpg"]];
    }
    [scroll addSubview:imageView];
    
    //头像
    _personImage = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_personImage setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-124/2, 24, 124, 124)];
    _personImage.clipsToBounds = YES;
    [Tools setUIViewLine:_personImage cornerRadius:62 with:0 color:[UIColor whiteColor]];
    [imageView addSubview:_personImage];
>>>>>>> parent of e1f60e4... d大是大非上的
    
    //个人信息View
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(12, imageView.frame.origin.y + imageView.frame.size.height + 12, self.view.frame.size.width - 24, 58)];
    [view setBackgroundColor:[UIColor whiteColor]];
    [scroll addSubview:view];
    
    //姓名标题
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 40, 15)];
    [label setText:@"姓名"];
    [label setFont:[UIFont systemFontOfSize:14]];
    [label setTextAlignment:NSTextAlignmentLeft];
    [label setTextColor:[UIColor lightGrayColor]];
    [view addSubview:label];
    
    //姓名286
<<<<<<< HEAD
    UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(label.frame.origin.x, label.frame.origin.y + label.frame.size.height + 5, 120, 20)];
    [labelName setText:@"买姑娘得小房子"];
    [labelName setFont:[UIFont systemFontOfSize:15]];
    [labelName setTextAlignment:NSTextAlignmentLeft];
    [labelName setTextColor:[UIColor blackColor]];
    [view addSubview:labelName];
    
    //VIP认证图标
    UIImageView *vipImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 22.5, 21)];
    [vipImage setImage:[UIImage imageNamed:@"vip1.png"]];
    [vipImage setCenter:CGPointMake(labelName.center.x + labelName.frame.size.width / 2, labelName.center.y)];
=======
   _labelName = [[UILabel alloc] initWithFrame:CGRectMake(label.frame.origin.x, label.frame.origin.y + label.frame.size.height + 5, 120, 20)];
    [_labelName setFont:[UIFont systemFontOfSize:15]];
    [_labelName setTextAlignment:NSTextAlignmentLeft];
    [_labelName setTextColor:[UIColor blackColor]];
    [view addSubview:_labelName];
    
    //VIP认证图标
    UIImageView *vipImage = [[UIImageView alloc] initWithFrame:CGRectMake(_labelName.frame.origin.x + _labelName.frame.size.width +5,_labelName.frame.origin.y, 22.5, 21)];
    [vipImage setImage:[UIImage imageNamed:@"vip1.png"]];
>>>>>>> parent of e1f60e4... d大是大非上的
    [view addSubview:vipImage];
    
    //已发表的话题
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"已发表42次话题"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, 3)];
    [str addAttribute:NSForegroundColorAttributeName value:kMainColor range:NSMakeRange(3, 2)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(5, 3)];
<<<<<<< HEAD
    UILabel *topicLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 10, 100, 20)];
=======
    UILabel *topicLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-140, 10, 100, 20)];
>>>>>>> parent of e1f60e4... d大是大非上的
    [topicLabel setAttributedText:str];
    [topicLabel setFont:[UIFont systemFontOfSize:12]];
    [view addSubview:topicLabel];
    
    //已发表的回复
    str = [[NSMutableAttributedString alloc] initWithString:@"已发表9421次回复"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, 3)];
    [str addAttribute:NSForegroundColorAttributeName value:kMainColor range:NSMakeRange(3, 4)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(7, 3)];
    UILabel *feedLabel = [[UILabel alloc] initWithFrame:CGRectMake(topicLabel.frame.origin.x, topicLabel.frame.origin.y + topicLabel.frame.size.height, 100, 20)];
    [feedLabel setAttributedText:str];
    [feedLabel setFont:[UIFont systemFontOfSize:12]];
    [view addSubview:feedLabel];
<<<<<<< HEAD

=======
    
>>>>>>> parent of e1f60e4... d大是大非上的
    
    //设置底部菜单
    dic = [[NSMutableDictionary alloc] init];
    selectedArr = [[NSMutableArray alloc] init];
    //tableView
<<<<<<< HEAD
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, view.frame.origin.y + view.frame.size.height + 10, 300,self.view.frame.size.height - 187) style:UITableViewStylePlain];
=======
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, view.frame.origin.y + view.frame.size.height + 10, [UIScreen mainScreen].bounds.size.width-20,self.view.frame.size.height - 187) style:UITableViewStylePlain];
>>>>>>> parent of e1f60e4... d大是大非上的
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    //不要分割线
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView setBackgroundColor:[UIColor clearColor]];
    [scroll addSubview:_tableView];
    
    [self initDataSource];
}

-(void)initDataSource
{
    titleDataArray = [[NSMutableArray alloc] initWithObjects:@"我的买否",@"我的提醒",@"楼盘评价",@"我的收藏",@"个人设置",@"清除缓存", nil];
    _titleImageArray = [[NSMutableArray alloc] initWithObjects:@"1.png",@"2.png",@"3.png",@"4.png",@"5.png",@"6.png", nil];
    NSMutableDictionary *nameAndStateDic1 = [NSMutableDictionary dictionaryWithDictionary:@{@"cell":@"MainCell",@"pic":@"title.png",@"title":@"我发表的话题"}];
    NSMutableDictionary *nameAndStateDic2 = [NSMutableDictionary dictionaryWithDictionary:@{@"cell":@"MainCell",@"pic":@"reply.png",@"title":@"我发表的回复"}];
    _cacheStatePic = @"1dian_green.png";
    _borderWith  = 0;
    _btnInteraction = YES;
    _tilteColor = [UIColor whiteColor];
    _iconImage = [UIImage imageNamed:@"6_selected.png"];
    grouparr0 = [[NSMutableArray alloc] initWithObjects:nameAndStateDic1,nameAndStateDic2, nil];
    
    [dic setValue:grouparr0 forKey:@"0"];
}

#pragma mark----tableViewDelegate
//返回几个表头
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return titleDataArray.count;
}

//每一个表头下返回几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *string = [NSString stringWithFormat:@"%ld",(long)section];
    
    if ([selectedArr containsObject:string]) {
        
        UIImageView *imageV = (UIImageView *)[_tableView viewWithTag:20000+section];
        imageV.image = [UIImage imageNamed:@"downP.png"];
        
        NSArray *array1 = dic[string];
        return array1.count;
    }
    return 0;
}

//设置表头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

//Section Footer的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section == 5)
        return 0;
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
<<<<<<< HEAD
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
=======
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width-20, 40)];
>>>>>>> parent of e1f60e4... d大是大非上的
    view.backgroundColor = [Tools colorWithRed:241 angGreen:241 andBlue:241];
    return view;
}

//设置view，将替代titleForHeaderInSection方法
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    view.backgroundColor = [UIColor whiteColor];
    if (section == 0) {
<<<<<<< HEAD
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(276, 18, 12, 7)];
=======
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-42, 18, 12, 7)];
>>>>>>> parent of e1f60e4... d大是大非上的
        imageView.tag = 20000+section;
        
        //判断是不是选中状态
        NSString *string = [NSString stringWithFormat:@"%ld",(long)section];
        
        if ([selectedArr containsObject:string]) {
            imageView.image = [UIImage imageNamed:@"upP.png"];
        }
        else
        {
            imageView.image = [UIImage imageNamed:@"downP.png"];
        }
        [view addSubview:imageView];
    }else
    {
        if (section != 5) {
<<<<<<< HEAD
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(280, 18, 7, 12)];
=======
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-38, 18, 7, 12)];
>>>>>>> parent of e1f60e4... d大是大非上的
            [imageView setImage:[UIImage imageNamed:@"right.png"]];
            [view addSubview:imageView];
        }
    }
<<<<<<< HEAD
    CenterMainCellButton *button = [[CenterMainCellButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];;
=======
    CenterMainCellButton *button = [[CenterMainCellButton alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-20, 40)];;
>>>>>>> parent of e1f60e4... d大是大非上的
    button.tag = 100+section;
    [button addTarget:self action:@selector(doButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:@"1dian.png"] forState:UIControlStateHighlighted];
    [button setTitle:[titleDataArray objectAtIndex:section] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    if (section == 5) {//如果是第五行，则显示绿色的背景
        [button setBackgroundImage:[UIImage imageNamed:_cacheStatePic] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [Tools setUIViewLine:button cornerRadius:0 with:_borderWith color:[Tools colorWithRed:173 angGreen:173 andBlue:173]];
        [button setTitleColor:_tilteColor forState:UIControlStateNormal];
        [button setUserInteractionEnabled:_btnInteraction];
        
        //显示内存还剩余多少兆
<<<<<<< HEAD
        UILabel *cacheLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 10, 120, 20)];
=======
        UILabel *cacheLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-150, 10, 120, 20)];
>>>>>>> parent of e1f60e4... d大是大非上的
        [cacheLabel setTextColor:[UIColor whiteColor]];
        [cacheLabel setText:[NSString stringWithFormat:@"%.2fM缓存",_cacheSize]];
        [cacheLabel setTextAlignment:NSTextAlignmentLeft];
        [view addSubview:cacheLabel];
    }
    NSString *icon = _titleImageArray[section];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[icon fileApped:@"_selected"]] forState:UIControlStateHighlighted];
    if (section == 5) {//如果是第五行，则显示只有白色线条的那个垃圾桶按钮，
        [button setImage:_iconImage forState:UIControlStateNormal];
    }
    [view insertSubview:button atIndex:0];
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
<<<<<<< HEAD
        return 40;
=======
    return 40;
>>>>>>> parent of e1f60e4... d大是大非上的
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //当前是第几个表头
    NSString *indexStr = [NSString stringWithFormat:@"%ld",(long)indexPath.section];
    
    if ([dic[indexStr][indexPath.row][@"cell"] isEqualToString:@"MainCell"]) {
        
        static NSString *CellIdentifier = @"MainCell";
        
        CenterMainCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[CenterMainCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
        }
        
        if ([selectedArr containsObject:indexStr]) {
            if (indexPath.row == 0) {
                [cell.image setImage:[UIImage imageNamed:@"title.png"]];
                [cell.titleLabel setText:@"我发表的话题"];
<<<<<<< HEAD
=======
                [cell.titleLabel setTextColor:[Tools colorWithRed:51 angGreen:51 andBlue:51]];
>>>>>>> parent of e1f60e4... d大是大非上的
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            }else if(indexPath.row == 1)
            {
                [cell.image setImage:[UIImage imageNamed:@"reply.png"]];
                [cell.titleLabel setText:@"我发表的回复"];
<<<<<<< HEAD
=======
                [cell.titleLabel setTextColor:[Tools colorWithRed:51 angGreen:51 andBlue:51]];
>>>>>>> parent of e1f60e4... d大是大非上的
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            }
        }
        
        return cell;
    }
    return nil;
}

-(void)doButton:(UIButton *)sender
{
<<<<<<< HEAD
    NSString *string = [NSString stringWithFormat:@"%ld",(long)sender.tag-100];
    
    //数组selectedArr里面存的数据和表头想对应，方便以后做比较
    if ([selectedArr containsObject:string])
    {
        [selectedArr removeObject:string];
    }
    else
    {
        [selectedArr addObject:string];
    };
    [_tableView reloadData];
    switch (sender.tag - 100) {
        case 0:
            
            break;
        case 1:{
            MyRemindRViewController *personTips = [[MyRemindRViewController alloc] init];
            [self.navigationController pushViewController:personTips animated:YES];
            break;
        }
        case 2:{
            PersonBuildingEvaluteViewController *personJudge = [[PersonBuildingEvaluteViewController alloc] init];
            [self.navigationController pushViewController:personJudge animated:YES];
        }
            break;
        case 3:{
            PersonCollectViewController *personCollect = [[PersonCollectViewController alloc] init];
            [self.navigationController pushViewController:personCollect animated:YES];
        }
            break;
        case 4:{
            PersonSetViewController *personSet = [[PersonSetViewController alloc] init];
            [self.navigationController pushViewController:personSet animated:YES];
        }
            break;
        case 5:{
//            [sender setBackgroundImage:[UIImage imageNamed:@"1dian.png"] forState:UIControlStateNormal];
//            titleDataArray[5] = @"缓存已清空,好爽";
//            _cacheStatePic = @"1dian.png";
//            [_tableView reloadData];
//            NSLog(@"yichuasdfasdf");
            DXAlertView *alert = [[DXAlertView alloc] initWithTitle:@"提示" contentText:@"是否确定需要清理缓存？" leftButtonTitle:@"取消" rightButtonTitle:@"确定"];
            [alert show];
            alert.leftBlock = ^() {
                 NSLog(@"left button clicked");
            };
            alert.rightBlock = ^() {
                [self showWithLabelMixed];
            };
            alert.dismissBlock = ^() {
                NSLog(@"Do something interesting after dismiss block");
            };
        }
            break;
        default:
            break;
    }
=======
    if (_isNetWorking == NO)
    {
        SHOWALERT(@"网络速度不给力,请稍后再爬!")
        return;
    }
    NSString *string = [NSString stringWithFormat:@"%ld",(long)sender.tag-100];
        
        //数组selectedArr里面存的数据和表头想对应，方便以后做比较
        if ([selectedArr containsObject:string])
        {
            [selectedArr removeObject:string];
        }
        else
        {
            [selectedArr addObject:string];
        };
        [_tableView reloadData];
        switch (sender.tag - 100) {
            case 0:
                
                break;
            case 1:{
                MyRemindRViewController *personTips = [[MyRemindRViewController alloc] init];
                [self.navigationController pushViewController:personTips animated:YES];
                break;
            }
            case 2:{
                PersonBuildingEvaluteViewController *personJudge = [[PersonBuildingEvaluteViewController alloc] init];
                [self.navigationController pushViewController:personJudge animated:YES];
            }
                break;
            case 3:{
                PersonCollectViewController *personCollect = [[PersonCollectViewController alloc] init];
                [self.navigationController pushViewController:personCollect animated:YES];
            }
                break;
            case 4:{
                PersonSetViewController *personSet = [[PersonSetViewController alloc] init];
                personSet.userData = _uudb.data;
                [self.navigationController pushViewController:personSet animated:YES];
            }
                break;
            case 5:{
                //            [sender setBackgroundImage:[UIImage imageNamed:@"1dian.png"] forState:UIControlStateNormal];
                //            titleDataArray[5] = @"缓存已清空,好爽";
                //            _cacheStatePic = @"1dian.png";
                //            [_tableView reloadData];
                //            NSLog(@"yichuasdfasdf");
                DXAlertView *alert = [[DXAlertView alloc] initWithTitle:@"提示" contentText:@"是否确定需要清理缓存？" leftButtonTitle:@"取消" rightButtonTitle:@"确定"];
                [alert show];
                alert.leftBlock = ^() {
                };
                alert.rightBlock = ^() {
                    [self showWithLabelMixed];
                };
                alert.dismissBlock = ^() {
                };
            }
                break;
            default:
                break;
        }

      
    
>>>>>>> parent of e1f60e4... d大是大非上的
}

//清理缓存
- (void)showWithLabelMixed {
    [self clearCache];
    _HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.navigationController.view addSubview:_HUD];
    _HUD.labelText = @"正在整理缓存";
    _HUD.minSize = CGSizeMake(135.f, 135.f);
    
    [_HUD showWhileExecuting:@selector(myMixedTask) onTarget:self withObject:nil animated:YES];
}

//清除缓存
- (void)myMixedTask {
    // Indeterminate mode
    sleep(2);
    // Switch to determinate mode
    _HUD.mode = MBProgressHUDModeDeterminate;
    _HUD.labelText = @"清理中";
    float progress = 0.0f;
    while (progress < 1.0f)
    {
        progress += 0.01f;
        _HUD.progress = progress;
        usleep(10000);
    }
    // The sample image is based on the work by www.pixelpressicons.com, http://creativecommons.org/licenses/by/2.5/ca/
    // Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
    _HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    _HUD.mode = MBProgressHUDModeCustomView;
    _HUD.labelText = @"缓存清除成功!";
    //刷新table
    titleDataArray[5] = @"缓存已清空,好爽";
    _cacheStatePic = @"1dian_gray.png";
    _borderWith = 1;
    _btnInteraction = NO;
    _tilteColor = [UIColor blackColor];
    _iconImage = [UIImage imageNamed:@"6.png"];
    [_tableView reloadData];
    sleep(2);
}

//清除缓存
- (void)clearCache
{
<<<<<<< HEAD
dispatch_async(
   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
   , ^{
       NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
       
       NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
       NSLog(@"files :%ld",(unsigned long)[files count]);
       for (NSString *p in files) {
           NSError *error;
           NSString *path = [cachPath stringByAppendingPathComponent:p];
           if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
               [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
           }
       }
       [self performSelectorOnMainThread:@selector(clearCacheSuccess) withObject:nil waitUntilDone:YES];});
=======
    dispatch_async(
                   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
                   , ^{
                       NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                       
                       NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
                       for (NSString *p in files) {
                           NSError *error;
                           NSString *path = [cachPath stringByAppendingPathComponent:p];
                           if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                               [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                           }
                       }
                       [self performSelectorOnMainThread:@selector(clearCacheSuccess) withObject:nil waitUntilDone:YES];});
>>>>>>> parent of e1f60e4... d大是大非上的
}

//清除缓存成功得回调方法
-(void)clearCacheSuccess
{
<<<<<<< HEAD
    NSLog(@"清理成功");
=======
>>>>>>> parent of e1f60e4... d大是大非上的
    _cacheSize = 0.0;
    [_tableView reloadData];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
<<<<<<< HEAD
=======
  
>>>>>>> parent of e1f60e4... d大是大非上的
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PersonTopicViewController *topic = [[PersonTopicViewController alloc] init];
    self.delegate = topic;
    if (indexPath.row == 0) {//如果点击了我发布的话题，显示下面赞数量和回复数量
        [self.delegate showTableViewType:0];
    }else if (indexPath.row == 1)//如果点击了我的回复，则只进行显示赞了多少
    {
        [self.delegate showTableViewType:1];
    }
    [self.navigationController pushViewController:topic animated:YES];
}

<<<<<<< HEAD
=======
-(void)isNetWorking
{
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    
    // 2.设置网络状态改变后的处理
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变了, 就会调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: // 未知网络
                NSLog(@"未知网络");
                break;
                
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                NSLog(@"没有网络(断网)");
                [_netView removeFromSuperview];
                _netView = [[NotNetWorking alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
                [self.view addSubview:_netView];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                NSLog(@"手机自带网络");
                [_netView removeFromSuperview];
                [self netWorking];

                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                NSLog(@"WIFI");
                [_netView removeFromSuperview];
             
                [self netWorking];
                break;
        }
    }];
    
    // 3.开始监控
    [mgr startMonitoring];
}
>>>>>>> parent of e1f60e4... d大是大非上的

@end
