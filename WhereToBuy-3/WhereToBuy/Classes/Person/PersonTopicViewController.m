//
//  PersonTopicViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-2.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "PersonTopicViewController.h"
#import "CLLRefreshHeadController.h"
#import "TopicCell.h"
#import "PersonCenterViewController.h"
const int MaxCount1 = 5;

@interface PersonTopicViewController()<UITableViewDataSource, UITableViewDelegate,CLLRefreshHeadControllerDelegate,PersonTopicAndFeedbackDelegate>
{
    NSInteger loadCount;
    NSInteger _type;//table显示的类型
}

@property (nonatomic,strong)CLLRefreshHeadController *refreshControll1;

@end

@implementation PersonTopicViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我发表的话题";
    UIButton *itemBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(17, 5, 10.5, 18)];
    [itemBtn4 setBackgroundImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [itemBtn4 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:itemBtn4];
    self.navigationItem.leftBarButtonItem= back;
    [self addUI];
    [self refreshControl];
}

- (void)addUI
{
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, 503) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.rowHeight = 180;
    table.sectionHeaderHeight = 22.0f;
    table.sectionFooterHeight = 22.0f;
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView1 = table;
    self.tableView1.backgroundView = nil;
    self.tableView1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:table];
}

- (void) back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"开始刷新");
    [self.refreshControll1 startPullDownRefreshing];
}

- (CLLRefreshHeadController *)refreshControl
{
    if (!_refreshControll1) {
        _refreshControll1 = [[CLLRefreshHeadController alloc] initWithScrollView:self.tableView1 viewDelegate:self];
    }
    return _refreshControll1;
}

#pragma mark-
#pragma mark- CLLRefreshHeadContorllerDelegate
- (CLLRefreshViewLayerType)refreshViewLayerType
{
    return CLLRefreshViewLayerTypeOnScrollViews;
}
- (BOOL)keepiOS7NewApiCharacter {
    
    if (!self.navigationController)
        return NO;
    BOOL keeped = [[[UIDevice currentDevice] systemVersion] integerValue] >= 7.0;
    return keeped;
}

- (void)beginPullDownRefreshing {
    NSLog(@"下啦刷新");
    [self performSelector:@selector(endRefresh) withObject:nil afterDelay:3];
}
- (void)beginPullUpLoading
{
    NSLog(@"上啦加载更多");
    [self performSelector:@selector(endLoadMore) withObject:nil afterDelay:3];
}

//是显示更多
- (BOOL)hasRefreshFooterView {
    if (self.dataArr1.count > 0 && loadCount < MaxCount1) {
        return YES;
    }
    return NO;
}

- (void)endRefresh {
    loadCount = 0;
    NSMutableArray *data = [[NSMutableArray alloc] initWithObjects:@"圣诞节撒的呢",@"那是你曾经开展农村",@"四川省你擦拭",@"删除MMC卡螺旋藻",@"飒飒大SD卡那是快乐的拉开",@"是你撒看见你的卡死你都看",@"萨达姆设计的",@"SD卡三季度",@"dsa9kdkfm",@"上次的事;分开拍151",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa", nil];
    self.dataArr1 = data;
    [self.tableView1 reloadData];
    
    [self.refreshControll1 endPullDownRefreshing];
}
- (void)endLoadMore {
    loadCount ++;
    NSMutableArray *data = [[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"第%ld次就加载更多,共%d次",(long)loadCount,MaxCount1 ],@"更多1",@"更多2",@"更多3", nil];
    [self.dataArr1 addObjectsFromArray:data];
    [self.tableView1 reloadData];
    
    [self.refreshControll1 endPullUpLoading];
    
}

#pragma mark -- delegate & dataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr1.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cellID";
    TopicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[TopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        if (_type == 1) {
            [cell cellInitWithDic:@{@"type":@"1"}];
        }
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

//person中table显示类型的代理方法
- (void)showTableViewType:(NSInteger)type
{
    _type = type;
}

@end
