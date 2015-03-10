//
//  PersonBuildingEvaluteViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-9.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "PersonBuildingEvaluteViewController.h"
#import "CLLRefreshHeadController.h"
#import "UIImageView+WebCache.h"
#import "Tools.h"
#import "EvaluteCell.h"
#import "VipEvaluteViewController.h"

const NSInteger MaxCount2 = 5;

@interface PersonBuildingEvaluteViewController ()<UITableViewDataSource, UITableViewDelegate, CLLRefreshHeadControllerDelegate>
{
    NSInteger loadCount;
}
@property (nonatomic,strong)CLLRefreshHeadController *refreshControll;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (weak, nonatomic) UITableView *tableView;
@property (strong, nonatomic) CLLRefreshHeadController *refreshControll2;
@property (weak, nonatomic) UITableView *tableView2;
@property (strong, nonatomic) NSMutableArray *dataArr2;

@end

@implementation PersonBuildingEvaluteViewController

- (CLLRefreshHeadController *)refreshControl
{
    if (!_refreshControll) {
        _refreshControll = [[CLLRefreshHeadController alloc] initWithScrollView:self.tableView viewDelegate:self];
    }
    return _refreshControll;
}

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
    if (self.dataArr.count > 0 && loadCount < MaxCount2) {
        return YES;
    }
    return NO;
}

- (void)endRefresh {
    loadCount = 0;
    NSMutableArray *data = [[NSMutableArray alloc] initWithObjects:@"圣诞节撒的呢",@"那是你曾经开展农村",@"四川省你擦拭",@"删除MMC卡螺旋藻",@"飒飒大SD卡那是快乐的拉开",@"是你撒看见你的卡死你都看",@"萨达姆设计的",@"SD卡三季度",@"dsa9kdkfm",@"上次的事;分开拍151",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa",@"上次的事sasa", nil];
    self.dataArr = data;
    [self.tableView reloadData];
    [self.tableView2 reloadData];
    
    [self.refreshControll endPullDownRefreshing];
    [self.refreshControll2 endPullDownRefreshing];
}
- (void)endLoadMore {
    loadCount ++;
    NSMutableArray *data = [[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"第%ld次就加载更多,共%ld次",(long)loadCount,(long)MaxCount2 ],@"更多1",@"更多2",@"更多3", nil];
    [self.dataArr addObjectsFromArray:data];
    [self.tableView reloadData];
    [self.tableView2 reloadData];
    
    [self.refreshControll endPullUpLoading];
    [self.refreshControll2 endPullUpLoading];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"楼盘评价" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.leftBarButtonItems = @[item1, item2];
    
    UIButton *itemBtn3 = [[UIButton alloc] initWithFrame:CGRectMake(245, 5, 4, 22)];
    [itemBtn3 setBackgroundImage:[UIImage imageNamed:@"more.png"] forState:UIControlStateNormal];
    [itemBtn3 addTarget:self action:@selector(more) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *more = [[UIBarButtonItem alloc] initWithCustomView:itemBtn3];
    self.navigationItem.rightBarButtonItem = more;
    
    self.dataArr= [NSMutableArray array];
    loadCount = 0;
    
    [self addUI];
    [self refreshControl];
    [self refreshControl2];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"开始刷新");
    [self.refreshControll startPullDownRefreshing];
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

// 67 34.5
- (void) addUI
{
    //上面得三个标签得父View
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 35)];
    [view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:view];
    
    //下面得哪个橙色线
    UIView *lineDown = [[UIView alloc] initWithFrame:CGRectMake(0, 33, self.view.frame.size.width, 2)];
    [lineDown setBackgroundColor:[Tools colorWithRed:253 angGreen:134 andBlue:40]];
    [view addSubview:lineDown];
    
    //2个按钮标签
    for (NSInteger i = 1; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(17 + (i - 1) * 67, 0, 67, 34.5)];
        [btn setBackgroundImage:[UIImage imageNamed:@"isBuyListBack.png"] forState:UIControlStateSelected];
        [btn setBackgroundImage:[UIImage imageNamed:@"isBuyListBack.png"] forState:UIControlStateHighlighted];
        [btn setBackgroundColor:[UIColor whiteColor]];
        btn.tag = i;
        [btn addTarget:self action:@selector(showTopicByButton:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
        if (i == 1) {
            [btn setTitle:@"待评价" forState:UIControlStateNormal];
            btn.selected = YES;
            btn.userInteractionEnabled = NO;
        }else if(i == 2)
        {
            [btn setTitle:@"已评价" forState:UIControlStateNormal];
        }
        [view insertSubview:btn atIndex:0];
    }
    
    //显示内容得tableView(0, 99, self.view.frame.size.width, 425)
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 99, self.view.frame.size.width, 503) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.rowHeight = 100;
    table.sectionHeaderHeight = 22.0f;
    table.sectionFooterHeight = 22.0f;
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView = table;
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:table];
    
    //显示内容得tableView(0, 99, self.view.frame.size.width, 425)
    UITableView *table2 = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 99, self.view.frame.size.width, 503) style:UITableViewStylePlain];
    table2.delegate = self;
    table2.dataSource = self;
    table2.rowHeight = 100;
    table2.sectionHeaderHeight = 22.0f;
    table2.sectionFooterHeight = 22.0f;
    [table2 setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView2 = table2;
    self.tableView2.backgroundView = nil;
    self.tableView2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:table2];
}

//点击不同得按钮，显示不同得内容
- (void)showTopicByButton:(UIButton *)btn
{
    for (NSInteger i = 1; i <= 2; i++) {
        [((UIButton *)[self.view viewWithTag:i]) setSelected:NO];
        [((UIButton *)[self.view viewWithTag:i]) setUserInteractionEnabled:NO];
    }
    [btn setSelected:YES];
    if (btn.tag ==1) {
        [UIView animateWithDuration:0.5f animations:^{//点击待评价按钮，将已评价的table移入进来，带评价table移除出去
            [self.view bringSubviewToFront:self.tableView];
            [self.tableView setCenter:CGPointMake(self.tableView.center.x + self.view.frame.size.width, self.tableView.center.y)];
             [self.tableView2 setCenter:CGPointMake(self.tableView2.center.x + self.view.frame.size.width, self.tableView2.center.y)];
        } completion:^(BOOL finished) {
           
            [((UIButton *)[self.view viewWithTag:2]) setUserInteractionEnabled:YES];
        }];
    }else if (btn.tag == 2)
    {
        [UIView animateWithDuration:0.5f animations:^{//点击待评价按钮，将待评价的table移入进来，已评价table移除出去
            [self.view bringSubviewToFront:self.tableView2];
            [self.tableView2 setCenter:CGPointMake(self.tableView2.center.x - self.view.frame.size.width, self.tableView2.center.y)];
            [self.tableView setCenter:CGPointMake(self.tableView.center.x - self.view.frame.size.width, self.tableView.center.y)];
        } completion:^(BOOL finished) {
            
            [((UIButton *)[self.view viewWithTag:1]) setUserInteractionEnabled:YES];
        }];
    }
}

//搜索
- (void)search
{
    NSLog(@"搜索");
}

//查看信息
- (void)lookMessage
{
    NSLog(@"查看");
}


//更多菜单
- (void) more
{
    NSLog(@"更多菜单");
}

#pragma mark -- delegate & dataSource
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cellID";
    EvaluteCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[EvaluteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    if (tableView == self.tableView2) {//如果是已验证的列表就显示已已验证图片
        [cell cellInitWithCell:self.dataArr2 andIndex:0];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VipEvaluteViewController *vipEva = [[VipEvaluteViewController alloc] init];
    [self.navigationController pushViewController:vipEva animated:YES];
}

@end
