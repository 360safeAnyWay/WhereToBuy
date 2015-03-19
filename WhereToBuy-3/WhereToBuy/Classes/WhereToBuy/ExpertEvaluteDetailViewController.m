//
//  ExpertEvaluteDetailViewController.m
//  WhereToBuy
//
//  Created by ywj on 15-3-13.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "ExpertEvaluteDetailViewController.h"
#import "NavBackButton.h"
#import "ExpertDetailViewCell.h"
#import "CLLRefreshHeadController.h"

const int MaxCount8 = 5;

@interface ExpertEvaluteDetailViewController ()<CLLRefreshHeadControllerDelegate, UITableViewDataSource, UITableViewDelegate>
{
    NSInteger loadCount;
}
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (strong, nonatomic) CLLRefreshHeadController *refreshControll2;
@property (weak, nonatomic) UITableView *tableView2;
@property (strong, nonatomic) NSMutableArray *dataArr2;

@end

@implementation ExpertEvaluteDetailViewController

- (CLLRefreshHeadController *)refreshControl2
{
    if (!_refreshControll2) {
        _refreshControll2 = [[CLLRefreshHeadController alloc] initWithScrollView:self.tableView2 viewDelegate:self];
    }
    return _refreshControll2;
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
    if (self.dataArr2.count > 0 && loadCount < MaxCount8) {
        return YES;
    }
    return NO;
}

- (void)endRefresh {
    loadCount = 0;
    NSMutableArray *data = [[NSMutableArray alloc] initWithObjects:@"圣诞节撒的呢",@"那是你曾经开展农村",@"四川省你擦拭",@"删除MMC卡螺旋藻",@"飒飒大SD卡那是快乐的拉开",@"是你撒看见你的卡死你都看",@"萨达姆设计的",@"SD卡三季度",@"dsa9kdkfm",@"上次的事;分开拍151",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa", nil];
    self.dataArr2 = data;
    [self.tableView2 reloadData];
    
    [self.refreshControll2 endPullDownRefreshing];
}
- (void)endLoadMore {
    loadCount ++;
    NSMutableArray *data = [[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"第%ld次就加载更多,共%d次",(long)loadCount,MaxCount8 ],@"更多1",@"更多2",@"更多3", nil];
    [self.dataArr2 addObjectsFromArray:data];
    [self.tableView2 reloadData];
    [self.refreshControll2 endPullUpLoading];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NavBackButton *backBtn = [[NavBackButton alloc] initWithFrame:CGRectMake(0, 0, 105, 26)];
    [backBtn setImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [backBtn setTitle:self.name forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
    [self addUI];
    [self.refreshControll2 startPullDownRefreshing];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.refreshControl2 startPullDownRefreshing];
}

//返回
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addUI
{
    UITableView *table2 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 503) style:UITableViewStylePlain];
    table2.delegate = self;
    table2.dataSource = self;
    [table2 setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView2 = table2;
    [self.view addSubview:table2];
}

//table的delegate  && dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"ExpertDetailViewCell";
    ExpertDetailViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = (ExpertDetailViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"ExpertDetailViewCell" owner:self options:nil] lastObject];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 102;
}

@end



