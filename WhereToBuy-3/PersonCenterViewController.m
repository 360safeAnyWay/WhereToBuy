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

@interface PersonCenterViewController()<UITableViewDataSource, UITableViewDelegate>
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
}

@end

@implementation PersonCenterViewController

- (void) viewDidLoad
{
    [self addUI];
}

- (void) addUI
{
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 524)];
    [scroll setShowsVerticalScrollIndicator:NO];
    [scroll setContentSize:CGSizeMake(self.view.frame.size.width, 630)];
    [scroll setBackgroundColor:[Tools colorWithRed:241 angGreen:241 andBlue:241]];
    [self.view addSubview:scroll];
    
    //头像背景
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 176)];
    [imageView setImage:[UIImage imageNamed:@"personBack.png"]];
    [scroll addSubview:imageView];
    
    //头像
    UIButton *personImage = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [personImage setFrame:CGRectMake(98, 24, 124, 124)];
    [personImage setBackgroundImage:[UIImage imageNamed:@"moren.png"] forState:UIControlStateNormal];
    personImage.clipsToBounds = YES;
    [Tools setUIViewLine:personImage cornerRadius:62 with:0 color:[UIColor whiteColor]];
    [imageView addSubview:personImage];
    
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
    [view addSubview:vipImage];
    
    //已发表的话题
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"已发表42次话题"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, 3)];
    [str addAttribute:NSForegroundColorAttributeName value:[Tools colorWithRed:251 angGreen:119 andBlue:0] range:NSMakeRange(3, 2)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(5, 3)];
    UILabel *topicLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 10, 100, 20)];
    [topicLabel setAttributedText:str];
    [topicLabel setFont:[UIFont systemFontOfSize:12]];
    [view addSubview:topicLabel];
    
    //已发表的回复
    str = [[NSMutableAttributedString alloc] initWithString:@"已发表9421次回复"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, 3)];
    [str addAttribute:NSForegroundColorAttributeName value:[Tools colorWithRed:251 angGreen:119 andBlue:0] range:NSMakeRange(3, 4)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(7, 3)];
    UILabel *feedLabel = [[UILabel alloc] initWithFrame:CGRectMake(topicLabel.frame.origin.x, topicLabel.frame.origin.y + topicLabel.frame.size.height, 100, 20)];
    [feedLabel setAttributedText:str];
    [feedLabel setFont:[UIFont systemFontOfSize:12]];
    [view addSubview:feedLabel];

    
    //设置底部菜单
    dic = [[NSMutableDictionary alloc] init];
    selectedArr = [[NSMutableArray alloc] init];
    //tableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, view.frame.origin.y + view.frame.size.height + 10, 300,self.view.frame.size.height - 187) style:UITableViewStylePlain];
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
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    view.backgroundColor = [Tools colorWithRed:241 angGreen:241 andBlue:241];
    return view;
}

//设置view，将替代titleForHeaderInSection方法
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    view.backgroundColor = [UIColor whiteColor];
    if (section == 0) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(276, 18, 12, 7)];
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
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(280, 18, 7, 12)];
            [imageView setImage:[UIImage imageNamed:@"right.png"]];
            [view addSubview:imageView];
        }
    }
    CenterMainCellButton *button = [[CenterMainCellButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];;
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
        return 40;
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
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            }else if(indexPath.row == 1)
            {
                [cell.image setImage:[UIImage imageNamed:@"reply.png"]];
                [cell.titleLabel setText:@"我发表的回复"];
                [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            }
        }
        
        return cell;
    }
    return nil;
}

-(void)doButton:(UIButton *)sender
{
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
            PeronTipsViewController *personTips = [[PeronTipsViewController alloc] init];
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
}

//清理缓存
- (void)showWithLabelMixed {
    
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
        usleep(50000);
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

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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


@end
