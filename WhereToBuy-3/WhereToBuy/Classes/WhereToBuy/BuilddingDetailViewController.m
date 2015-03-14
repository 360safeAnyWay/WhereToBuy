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
#import "VipEvaluteCell.h"
#import "builddingDetailFirstCell.h"
#import "UserEvaluteViewCell.h"
#import "ExpertEvaluteDetailViewController.h"

const int MaxCount7 = 5;

//哈喽ooo

@interface BuilddingDetailViewController ()<CLLRefreshHeadControllerDelegate, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
{
    NSInteger loadCount;
    NSInteger _tag;//用于判定当前选中的事哪一个标签，用于控制table得移动
    UIScrollView *_scroll;
    UIView *_segmentView;
}
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
    [self.tableView2 reloadData];
    [self.tableView3 reloadData];
    
    [self.refreshControll2 endPullDownRefreshing];
    [self.refreshControll3 endPullDownRefreshing];
}
- (void)endLoadMore {
    loadCount ++;
    NSMutableArray *data = [[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"第%ld次就加载更多,共%d次",(long
)loadCount,MaxCount7 ],@"更多1",@"更多2",@"更多3", nil];
    [self.dataArr addObjectsFromArray:data];
    [self.tableView2 reloadData];
    [self.tableView3 reloadData];
    
    [self.refreshControll2 endPullUpLoading];
    [self.refreshControll3 endPullUpLoading];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"朗诗科技房";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    [self addUI];
    [self refreshControl2];
    [self refreshControl3];
    
    _dataArr = [[NSMutableArray alloc] initWithArray:@[@[@"3",@"点击查看更多专家回复"],@[@"4",@"点击查看更多专家回复"],@[@"7",@"点击查看更多专家回复"],@[@"2",@"点击查看更多专家回复"],@[@"8",@"点击查看更多专家回复"],@[@"2",@"点击查看更多专家回复"],@[@"9",@"点击查看更多专家回复"],@[@"4",@"点击查看更多专家回复"],@[@"6",@"点击查看更多专家回复"],@[@"7",@"点击查看更多专家回复"]]];
    [self.tableView reloadData];
}

//返回按钮
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"开始刷新");
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
    
    _tag = 1;//当前tag定位在tag为1页面
    
    //显示内容得tableView(0, 99, self.view.frame.size.width, 425)
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 99, self.view.frame.size.width, 468.5) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.tableHeaderView = [self BuilddingHeaderView];
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView = table;
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:table];
    
    //显示内容得tableView(0, 99, self.view.frame.size.width, 425)
    UITableView *table2 = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 99, self.view.frame.size.width, 468.5) style:UITableViewStylePlain];
    table2.delegate = self;
    table2.dataSource = self;
//    table2.rowHeight = 100;
    [table2 setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView2 = table2;
    [self.view addSubview:table2];
    
    //显示内容得tableView(0, 99, self.view.frame.size.width, 425)
    UITableView *table3 = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*2, 99, self.view.frame.size.width, 468.5) style:UITableViewStylePlain];
    table3.delegate = self;
    table3.dataSource = self;
    [table3 setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView3 = table3;
    table3.tableHeaderView = [self expertHeaderView:@"该房产共有23名专家进行了点评"];
    self.tableView3.backgroundView = nil;
    self.tableView3.backgroundColor = [UIColor clearColor];
    [self.view addSubview:table3];
}

//返回楼盘详情得headerView
-(UIView *)BuilddingHeaderView
{
    UIView *tableHearView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 240)];
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 240)];
    [scroll setContentSize:CGSizeMake(self.view.frame.size.width * 6, 240)];
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
    [scroll setContentOffset:CGPointMake(0, 0)];
    scroll.pagingEnabled = YES;
    scroll.bounces = NO;
    [scroll setBackgroundColor:[UIColor greenColor]];
    [scroll setDelegate:self];
    [tableHearView addSubview:scroll];
    _scroll = scroll;
    
    //用来装分页控件的试图，每次只要居中即可
    UIView *segmentView = [[UIView alloc] init];
    [segmentView setBackgroundColor:[UIColor clearColor]];
    
    for (NSInteger i = 1; i <= 6; i++) {
        UIImageView *houseImage = [[UIImageView alloc] initWithFrame:CGRectMake((i - 1) * self.view.frame.size.width, 0, self.view.frame.size.width, 240)];
        [houseImage setBackgroundColor:[UIColor lightGrayColor]];
        [houseImage setImage:[UIImage imageNamed:@"personBack.png"]];
        [scroll addSubview:houseImage];
        
        //使用自定义分页控件
        UIView *LineView = [[UIView alloc] initWithFrame:CGRectMake((i - 1) * 51, 0, 50, 3)];
        LineView.tag = i;
        [LineView setBackgroundColor:[UIColor whiteColor]];
        [segmentView setBounds:CGRectMake(0, 0, 51 * i, 3)];
        [segmentView addSubview:LineView];
    }
    
    [segmentView viewWithTag:1].backgroundColor = [Tools colorWithRed:255 angGreen:102 andBlue:49];
    [segmentView setCenter:CGPointMake(self.view.frame.size.width / 2, 220)];
    _segmentView = segmentView;
    [tableHearView addSubview:segmentView];
    
    return tableHearView;
}

//返回专家的headerView
- (UIView *)expertHeaderView:(NSString *)str
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120)];
    [image setImage:[UIImage imageNamed:@"expertEvalute.png"]];
    [view addSubview:image];
    
    UILabel *evalute = [[UILabel alloc] initWithFrame:CGRectMake(20, image.frame.origin.y + image.frame.size.height + 10, 200, 20)];
    [evalute setTextAlignment:NSTextAlignmentLeft];
    [evalute setFont:[UIFont systemFontOfSize:14]];
    [evalute setTextColor:[UIColor lightGrayColor]];
    [evalute setText:str];
    [view addSubview:evalute];
    
    return view;
}

//点击不同得按钮，显示不同得内容
- (void)showTopicByButton:(UIButton *)btn
{
    for (int i = 1; i <= 3; i++) {
        [((UIButton *)[self.view viewWithTag:i]) setSelected:NO];
        [((UIButton *)[self.view viewWithTag:i]) setUserInteractionEnabled:NO];
    }
    [btn setSelected:YES];
    if (btn.tag < _tag) {//向右边移动
        [UIView animateWithDuration:0.2f animations:^{//点击待评价按钮，将已评价的table移入进来，带评价table移除出去
            [self.tableView setCenter:CGPointMake(self.tableView.center.x + (_tag - btn.tag)*self.view.frame.size.width, self.tableView.center.y)];
            [self.tableView2 setCenter:CGPointMake(self.tableView2.center.x + (_tag - btn.tag)*self.view.frame.size.width, self.tableView2.center.y)];
            [self.tableView3 setCenter:CGPointMake(self.tableView3.center.x + (_tag - btn.tag)*self.view.frame.size.width, self.tableView3.center.y)];
        } completion:^(BOOL finished) {
            _tag = btn.tag;
            for (int i = 1; i <= 3; i++) {
                [((UIButton *)[self.view viewWithTag:i]) setUserInteractionEnabled:YES];
            }
            [((UIButton *)[self.view viewWithTag:_tag]) setUserInteractionEnabled:NO];
        }];
    }else if (btn.tag > _tag)//向左边移动
    {
        [UIView animateWithDuration:0.2f animations:^{//点击待评价按钮，将已评价的table移入进来，带评价table移除出去
            [self.tableView setCenter:CGPointMake(self.tableView.center.x - (btn.tag - _tag)*self.view.frame.size.width, self.tableView.center.y)];
            [self.tableView2 setCenter:CGPointMake(self.tableView2.center.x - (btn.tag - _tag)*self.view.frame.size.width, self.tableView2.center.y)];
            [self.tableView3 setCenter:CGPointMake(self.tableView3.center.x - (btn.tag - _tag)*self.view.frame.size.width, self.tableView3.center.y)];
        } completion:^(BOOL finished) {
            _tag = btn.tag;
            for (int i = 1; i <= 3; i++) {
                [((UIButton *)[self.view viewWithTag:i]) setUserInteractionEnabled:YES];
            }
            [((UIButton *)[self.view viewWithTag:_tag]) setUserInteractionEnabled:NO];
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
    if (tableView == self.tableView) {
        return 10;
    }else if (tableView == self.tableView2)
    {
        return 10;
    }else if (tableView == self.tableView3)
    {
        return 10;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableView) {
        if (indexPath.row == 0) {
            NSString *cellID = @"builddingDetailFirstCell";
            builddingDetailFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (cell == nil) {
                cell = (builddingDetailFirstCell *)[[[NSBundle mainBundle] loadNibNamed:@"builddingDetailFirstCell" owner:self options:nil] lastObject];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            return cell;
        }else{
            NSString *cellID = @"cellID";
            VipEvaluteCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (cell == nil) {
                cell = [[VipEvaluteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                [cell cellInitWithCell:_dataArr andIndex:indexPath.row];
            }
            return cell;
        }
    }else if (tableView == self.tableView2)
    {
        static NSString *cellID = @"UserEvaluteViewCell";
        UserEvaluteViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = (UserEvaluteViewCell *)[[[NSBundle mainBundle] loadNibNamed:@"UserEvaluteViewCell" owner:self options:nil] lastObject];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        return cell;
    }else if (tableView == self.tableView3)
    {
        NSString *cellID = @"cellID3";
        VipEvaluteCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[VipEvaluteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            [cell cellInitWithCell:_dataArr andIndex:indexPath.row];
        }
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableView) {
        if (indexPath.row == 0) {
            return 275;
        }else
        {
            return 65;
        }
    }else if (tableView == self.tableView2)
    {
        return 120;
    }else if (tableView == self.tableView3)
    {
        return 65;
    }
    return 0;
}

//取消选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableView3) {
        ExpertEvaluteDetailViewController *expertDetail = [[ExpertEvaluteDetailViewController alloc] init];
        [self.navigationController pushViewController:expertDetail animated:YES];
    }
}

//用于切换底部的控制条
- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _scroll) {
        int x = scrollView.contentOffset.x / self.view.frame.size.width;
        for (NSInteger i = 1; i <= 6; i++) {
            [_segmentView viewWithTag:i].backgroundColor = [UIColor whiteColor];
        }
        [_segmentView viewWithTag:x + 1].backgroundColor = [Tools colorWithRed:255 angGreen:102 andBlue:49];
    }
}

@end
