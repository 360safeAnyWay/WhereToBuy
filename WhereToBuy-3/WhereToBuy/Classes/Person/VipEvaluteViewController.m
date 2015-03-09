//
//  VipEvaluteViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-9.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "VipEvaluteViewController.h"
#import "Tools.h"
#import "VipEvaluteCell.h"
#import "VipEvaluteDetailViewContrller.h"

@interface VipEvaluteViewController()<UIScrollViewDelegate, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate,VipEvaluteDetailDelegate>
{
    UIScrollView *_scroll;
    UIView *_segmentView;
    NSMutableArray *_tableArr;//用于刷新table的数组
    UITableView *_table;
}
@property (weak, nonatomic) UITableView *tableView;

@end

@implementation VipEvaluteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"博恩花园";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(done)];
    
    self.automaticallyAdjustsScrollViewInsets = NO;//取消自动布局
    [self addUI];
    _tableArr = [[NSMutableArray alloc] initWithArray:@[@[@"0",@""],@[@"0",@""],@[@"0",@""],@[@"0",@""]]];
    [_table reloadData];
}

//282
- (void) addUI
{
    UIView *tableHearView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 315)];
    
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
    
    //优点icon 你登我的18512526954 密码fangyuan2012
    UIImageView *goodImageView = [[UIImageView alloc] initWithFrame:CGRectMake(17, scroll.frame.origin.y + scroll.frame.size.height + 16, 15, 15)];
    [goodImageView setImage:[UIImage imageNamed:@"good.png"]];
    [tableHearView addSubview:goodImageView];
    
    //优点Label
    UILabel *goodLabel = [[UILabel alloc] initWithFrame:CGRectMake(goodImageView.frame.origin.x + goodImageView.frame.size.width + 6, goodImageView.frame.origin.y - 3, 40, 20)];
    [goodLabel setText:@"优点"];
    [goodLabel setTextColor:[Tools colorWithRed:102 angGreen:202 andBlue:148]];
    [tableHearView addSubview:goodLabel];
    
    //优点文本
    UITextField *goodText = [[UITextField alloc] initWithFrame:CGRectMake(goodLabel.frame.origin.x + goodLabel.frame.size.width + 6, scroll.frame.origin.y + scroll.frame.size.height + 6, 240, 34)];
    [goodText setText:@"交通方便"];
    [goodText setFont:[UIFont systemFontOfSize:14]];
    [goodText setReturnKeyType:UIReturnKeyDone];
    goodText.delegate = self;
    [tableHearView addSubview:goodText];
    
    //编辑小图像
    UIImageView *goodEdit = [[UIImageView alloc] initWithFrame:CGRectMake(goodText.frame.size.width - 32, 6, 16, 16)];
    [goodEdit setImage:[UIImage imageNamed:@"edit.png"]];
    [goodText addSubview:goodEdit];
    
    UIView *goodLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 33, goodText.frame.size.width, 1)];
    [goodLineView setBackgroundColor:[Tools colorWithRed:229 angGreen:229 andBlue:229]];
    [goodText addSubview:goodLineView];
    
    //缺点icon
    UIImageView *nogoodImageView = [[UIImageView alloc] initWithFrame:CGRectMake(17, scroll.frame.origin.y + scroll.frame.size.height + 16 + 34, 15, 15)];
    [nogoodImageView setImage:[UIImage imageNamed:@"nogood.png"]];
    [tableHearView addSubview:nogoodImageView];
    
    //缺点Label
    UILabel *nogoodLabel = [[UILabel alloc] initWithFrame:CGRectMake(nogoodImageView.frame.origin.x + nogoodImageView.frame.size.width + 6, nogoodImageView.frame.origin.y - 3, 40, 20)];
    [nogoodLabel setText:@"缺点"];
    [nogoodLabel setTextColor:[Tools colorWithRed:255 angGreen:102 andBlue:49]];
    [tableHearView addSubview:nogoodLabel];
    
    //缺点文本
    UITextField *nogoodText = [[UITextField alloc] initWithFrame:CGRectMake(goodText.frame.origin.x, goodText.frame.origin.y + goodText.frame.size.height, goodText.frame.size.width, 34)];
    [nogoodText setText:@"请输入缺点"];
    [nogoodText setFont:[UIFont systemFontOfSize:14]];
    [nogoodText setTextColor:[UIColor lightGrayColor]];
    [nogoodText setReturnKeyType:UIReturnKeyDone];
    nogoodText.delegate = self;
    [tableHearView addSubview:nogoodText];
    
    UIView *nogoodLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 33, nogoodText.frame.size.width, 1)];
    [nogoodLineView setBackgroundColor:[Tools colorWithRed:229 angGreen:229 andBlue:229]];
    [nogoodText addSubview:nogoodLineView];
    
    //编辑小图像
    UIImageView *nogoodEdit = [[UIImageView alloc] initWithFrame:CGRectMake(nogoodText.frame.size.width - 32, 6, 16, 16)];
    [nogoodEdit setImage:[UIImage imageNamed:@"edit.png"]];
    [nogoodText addSubview:nogoodEdit];
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain] ;
    table.delegate = self;
    table.dataSource = self;
    table.tableHeaderView = tableHearView;
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:table];
    _table = table;
}

- (void) back
{
    [self.navigationController popViewControllerAnimated:YES];
}

//完成编辑
- (void)done
{
    
}

#pragma mark -- delegate & dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VipEvaluteCell *cell = [[VipEvaluteCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    [cell cellInitWithCell:_tableArr andIndex:indexPath.row];
    NSLog(@"这是第%ld行－－－－－－－－－",(long)indexPath.row);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VipEvaluteCell *cell = (VipEvaluteCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    CGFloat labelHeight = cell.myEvalute.frame.size.height;
    return 48 + labelHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VipEvaluteDetailViewContrller *vipDetail = [[VipEvaluteDetailViewContrller alloc] init];
    self.delegate = vipDetail;
    vipDetail.delegate = self;
    if (indexPath.row == 0) {
        [self.delegate setBackButtonTitle:@"性价比" andRow:0];
    }else if(indexPath.row == 1)
    {
        [self.delegate setBackButtonTitle:@"户型" andRow:1];
    }else if(indexPath.row == 2)
    {
        [self.delegate setBackButtonTitle:@"房屋质量" andRow:2];
    }else if(indexPath.row == 3)
    {
        [self.delegate setBackButtonTitle:@"个性" andRow:3];
    }
    [self.navigationController pushViewController:vipDetail animated:YES];
}

//点击背景退出
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

//点击键盘上的完成退出
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//用于刷新从详细评论页面返回时候进行刷新数据
- (void)refreshTableViewData:(NSArray *)arr
{
    NSInteger i = [arr[0] integerValue];
    NSMutableArray *tempArr = [[NSMutableArray alloc] initWithCapacity:2];
    tempArr[0] = arr[1];
    tempArr[1] = arr[2];
    _tableArr[i] = tempArr;
    [_table reloadData];
}

@end








