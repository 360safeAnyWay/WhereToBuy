//
//  SearchDetailViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-3-4.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "SearchDetailViewController.h"
#import "Tools.h"
#import "CLLRefreshHeadController.h"
#import "TopicCell.h"
#import "SearchDetailEvaluteCell.h"

const int MaxCount6 = 5;

@interface SearchDetailViewController()
{
    NSInteger _tag;//用于标定是否
}
@end

@interface SearchDetailViewController()<UITextFieldDelegate, CLLRefreshHeadControllerDelegate,UITableViewDelegate,UITableViewDataSource>
{
    int loadCount;
}

@property (nonatomic,strong)CLLRefreshHeadController *refreshControll1;

@end

@implementation SearchDetailViewController

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
    if (self.dataArr1.count > 0 && loadCount < MaxCount6) {
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
    NSMutableArray *data = [[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"第%d次就加载更多,共%d次",loadCount,MaxCount6 ],@"更多1",@"更多2",@"更多3", nil];
    [self.dataArr1 addObjectsFromArray:data];
    [self.tableView1 reloadData];
    
    [self.refreshControll1 endPullUpLoading];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"开始刷新");
    [self.refreshControl startPullDownRefreshing];
}

- (void)loadView
{
    [super loadView];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    UIButton *itemBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(245, 8, 20, 30)];
    [itemBtn2 setBackgroundImage:[UIImage imageNamed:@"more.png"] forState:UIControlStateNormal];
    [itemBtn2 addTarget:self action:@selector(more) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *more = [[UIBarButtonItem alloc] initWithCustomView:itemBtn2];
    self.navigationItem.rightBarButtonItem = more;
    
    UITextField *search = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 225, 30)];
    [search setBackgroundColor:[UIColor whiteColor]];
    [search setPlaceholder:@"去输入关键字检索"];
    search.delegate = self;
    [search setReturnKeyType:UIReturnKeySearch];
    [Tools setUIViewLine:search cornerRadius:5 with:1 color:[Tools colorWithRed:224 angGreen:224 andBlue:224]];
    [self.view addSubview:search];
    
    UIImageView *searchBtn = [[UIImageView alloc] initWithFrame:CGRectMake(200, 5, 20, 20)];
    [searchBtn setImage:[UIImage imageNamed:@"searchSmall.png"]];
    [search addSubview:searchBtn];
    self.navigationItem.titleView = search;
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self addUI];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self refreshControl];
}

- (void)addUI
{
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, self.view.frame.size.height  - 65) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.rowHeight = 112.0f;
    table.sectionHeaderHeight = 0.0f;
    table.sectionFooterHeight = 0.0f;
    self.tableView1 = table;
    [self.view addSubview:table];
}

//返回
- (void) back
{
    [self.navigationController popViewControllerAnimated:YES];
}

//展开侧边栏
- (void)more
{
    
}

#pragma mark -- delegate & dataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cellID";
    SearchDetailEvaluteCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = (SearchDetailEvaluteCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"SearchDetailEvaluteCell" owner:self options:nil]  lastObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

@end
