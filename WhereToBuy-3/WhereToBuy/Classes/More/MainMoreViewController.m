//
//  MainMoreViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-3-3.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "MainMoreViewController.h"
#import "Tools.h"
#import "MainMoreCell.h"
#import "PeronTipsViewController.h"
#import "WBNavigationController.h"
#import "IsBuyMainViewController.h"
#import "DDMenuController.h"

@interface MainMoreViewController()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) UITableView *table;
@property (strong, nonatomic) NSArray *dataArr;//用来初始化table

@end

@implementation MainMoreViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    _dataArr = @[@"我的", @"楼盘浏览历史", @"猜你喜欢", @"楼盘收藏", @"买否", @"话题浏览历史", @"我的提醒", @"话题收藏", @"设置", @"关于买哪儿", @"意见反馈"];
    
    [self addUI];
}

- (void)addUI
{
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [table setBackgroundColor:[Tools colorWithRed:48 angGreen:48 andBlue:48]];
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:table];
    self.table = table;
}

#pragma mark -- table delagate && dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cellID";
    MainMoreCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[MainMoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        [cell cellInitWithCell:_dataArr andIndex:indexPath.row];
        [cell setBackgroundColor:[Tools colorWithRed:48 angGreen:48 andBlue:48]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 90.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 90)];
    [headerView setImage:[UIImage imageNamed:@"mainMoreHeader.png"]];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 20, 60, 60)];
    [btn setBackgroundImage:[UIImage imageNamed:@"mainMorePhoto.png"] forState:UIControlStateNormal];
    [headerView addSubview:btn];
    
    NSString *name = @"周鸿祎";
    CGSize size1 = CGSizeMake(140, 20);
    CGRect labelSize1 = [name boundingRectWithSize:size1 options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];//动态调整label高度
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:labelSize1];
    [nameLabel setTextColor:[UIColor whiteColor]];
    [nameLabel setFont:[UIFont systemFontOfSize:16]];
    [nameLabel setText:name];
    [nameLabel setCenter:CGPointMake(btn.center.x + btn.frame.size.width / 2 + labelSize1.size.width / 2 + 5, 33)];
    [headerView addSubview:nameLabel];
    
    UIButton *logOut = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [logOut setFrame:CGRectMake(btn.frame.origin.x + btn.frame.size.width + 5, nameLabel.frame.origin.y + nameLabel.frame.size.height + 8, 60, 30)];
    [Tools setUIViewLine:logOut cornerRadius:5 with:1 color:[Tools colorWithRed:143 angGreen:144 andBlue:148]];
    [logOut setTitle:@"登出" forState:UIControlStateNormal];
    [logOut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [logOut.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [headerView addSubview:logOut];
    
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    PeronTipsViewController *tips = [[PeronTipsViewController alloc] init];
    DDMenuController *menu = self.view.window.rootViewController.childViewControllers[0];
    WBNavigationController *isBuyNav = (WBNavigationController *)menu.rootViewController;
    IsBuyMainViewController *isBuy = isBuyNav.childViewControllers[0];
    switch (indexPath.row) {
        case 5:
        {
            NSLog(@"ajsldfjlasdjflasdf");
            [isBuy.navigationController pushViewController:tips animated:YES];
        }
            break;
            
        default:
            break;
    }
    [menu showRootController:YES];
}

@end