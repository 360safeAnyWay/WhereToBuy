//
//  BuilddingDetailViewController.m
//  WhereToBuy
//
//  Created by ywj on 15-3-7.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "BuilddingDetailViewController.h"
#import "CLLRefreshHeadController.h"
#import "Tools.h"

const int MaxCount7 = 5;

//哈喽ooo

@interface BuilddingDetailViewController ()<CLLRefreshHeadControllerDelegate, UITableViewDataSource, UITableViewDelegate>
{
    NSInteger loadCount;
}
@property (nonatomic,strong)CLLRefreshHeadController *refreshControll;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (weak, nonatomic) UITableView *tableView;
@property (strong, nonatomic) CLLRefreshHeadController *refreshControll2;
@property (weak, nonatomic) UITableView *tableView2;
@property (strong, nonatomic) NSMutableArray *dataArr2;
@property (strong, nonatomic) CLLRefreshHeadController *refreshControll3;
@property (weak, nonatomic) UITableView *tableView3;
@property (strong, nonatomic) NSMutableArray *dataArr3;

@end

@implementation BuilddingDetailViewController

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

- (CLLRefreshHeadController *)refreshControl3
{
    if (!_refreshControll3) {
        _refreshControll3 = [[CLLRefreshHeadController alloc] initWithScrollView:self.tableView3 viewDelegate:self];
    }
    return _refreshControll3;
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
    if (self.dataArr.count > 0 && loadCount < MaxCount7) {
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
    [self.tableView3 reloadData];
    
    [self.refreshControll endPullDownRefreshing];
    [self.refreshControll2 endPullDownRefreshing];
    [self.refreshControll3 endPullDownRefreshing];
}
- (void)endLoadMore {
    loadCount ++;
    NSMutableArray *data = [[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"第%ld次就加载更多,共%d次",(long
)loadCount,MaxCount7 ],@"更多1",@"更多2",@"更多3", nil];
    [self.dataArr addObjectsFromArray:data];
    [self.tableView reloadData];
    [self.tableView2 reloadData];
    [self.tableView3 reloadData];
    
    [self.refreshControll endPullUpLoading];
    [self.refreshControll2 endPullUpLoading];
    [self.refreshControll3 endPullUpLoading];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addUI];
    [self refreshControl];
    [self refreshControl2];
    [self refreshControl3];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"开始刷新");
    [self.refreshControll startPullDownRefreshing];
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
    for (int i = 1; i < 4; i++) {
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
            [btn setTitle:@"楼盘详情" forState:UIControlStateNormal];
            btn.selected = YES;
            btn.userInteractionEnabled = NO;
        }else if(i == 2)
        {
            [btn setTitle:@"大众评论" forState:UIControlStateNormal];
        }
        else if(i == 3)
        {
            [btn setTitle:@"购房权威" forState:UIControlStateNormal];
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
    for (int i = 1; i <= 2; i++) {
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

@end
