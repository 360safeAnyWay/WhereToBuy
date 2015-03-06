//
//  PersonCollectViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-26.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "PersonCollectViewController.h"
#import "CLLRefreshHeadController.h"
#import "UIImageView+WebCache.h"
#import "Tools.h"
#import "EvaluteCell.h"
#import "TopicCell.h"

const int MaxCount3 = 5;

@interface PersonCollectViewController()<UITableViewDataSource, UITableViewDelegate, CLLRefreshHeadControllerDelegate>
{
    int loadCount;
}
@property (nonatomic,strong)CLLRefreshHeadController *refreshControll;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (weak, nonatomic) UITableView *tableView;
@property (strong, nonatomic) CLLRefreshHeadController *refreshControll2;
@property (weak, nonatomic) UITableView *tableView2;
@property (strong, nonatomic) NSMutableArray *dataArr2;

@end

@implementation PersonCollectViewController

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
    if (self.dataArr.count > 0 && loadCount < MaxCount3) {
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
    NSMutableArray *data = [[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"第%d次就加载更多,共%d次",loadCount,MaxCount3 ],@"更多1",@"更多2",@"更多3", nil];
    [self.dataArr addObjectsFromArray:data];
    [self.tableView reloadData];
    [self.tableView2 reloadData];
    
    [self.refreshControll endPullUpLoading];
    [self.refreshControll2 endPullUpLoading];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的收藏";
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = item;
    
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

//加载更多
-(void)more
{
    
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
    
    //三个按钮标签
    for (int i = 1; i < 3; i++) {
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
            [btn setTitle:@"楼盘收藏" forState:UIControlStateNormal];
            btn.selected = YES;
            btn.userInteractionEnabled = NO;
        }else if(i == 2)
        {
            [btn setTitle:@"话题收藏" forState:UIControlStateNormal];
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
    table2.rowHeight = 180;
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
//    NSString *cellID = @"cellID";
//    EvaluteCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if (cell == nil) {
//        cell = [[EvaluteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//    }
//    if (tableView == self.tableView2) {//如果是已验证的列表就显示已已验证图片
//        [cell cellInitWithCell:self.dataArr2 andIndex:0];
//    }
//    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    return cell;
    UITableViewCell *cell = nil;
        if (tableView == self.tableView) {
            NSString *cellID1 = @"cellID1";
            EvaluteCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellID1];
            if (cell1 == nil) {
                cell1 = [[EvaluteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID1];
                cell = cell1;
            }
        }else if (tableView == self.tableView2)
        {
            NSString *cellID2 = @"cellID2";
            TopicCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellID2];;
            if (cell2 == nil) {
                cell2 = [[TopicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID2];
                cell = cell2;
            }
        }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


@end
