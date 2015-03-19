//
//  LikeViewController.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/14.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "LikeViewController.h"
#import "SearchDetailEvaluteCell.h"
#import "SearchDetailCell.h"
#import "BuilddingDetailViewController.h"
@interface LikeViewController ()
{
    NSInteger loadCount;
    NSInteger _tag;//用于标定是否
}


@end

@implementation LikeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"猜你喜欢";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(backMain)];
    [self addUI];
}

- (void)addUI
{
    NSDictionary *dic = @{@"Cell": @"MainCell",@"isAttached":@(NO)};
    NSArray * array = @[dic,dic,dic,dic,dic,dic];
    
    self.dataArray = [[NSMutableArray alloc]init];
    self.dataArray = [NSMutableArray arrayWithArray:array];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushBuilddingDetail:) name:@"pushDetail" object:nil];
    
    
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    table.sectionHeaderHeight = 0.0f;
    table.sectionFooterHeight = 0.0f;
    self.tableView1 = table;
    [self.view addSubview:table];
}

//返回
- (void)backMain
{
    [self.navigationController popViewControllerAnimated:YES];
}

//展开侧边栏
- (void)more
{
    
}

#pragma mark -- delegate & dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if ([[self.dataArray[indexPath.row] objectForKey:@"Cell"] isEqualToString:@"MainCell"])
    {
        
        static NSString *CellIdentifier = @"SearchDetailCell";
        
        SearchDetailCell *cell = (SearchDetailCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = (SearchDetailCell *)[[[NSBundle mainBundle] loadNibNamed:@"SearchDetailCell" owner:self options:nil] lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        return cell;
        
    }else if([[self.dataArray[indexPath.row] objectForKey:@"Cell"] isEqualToString:@"AttachedCell"]){
        
        static NSString *CellIdentifier = @"SearchDetailEvaluteCell";
        
        SearchDetailEvaluteCell *cell = (SearchDetailEvaluteCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = (SearchDetailEvaluteCell *)[[[NSBundle mainBundle] loadNibNamed:@"SearchDetailEvaluteCell" owner:self options:nil] lastObject];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        return cell;
        
    }
    
    return nil;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSIndexPath *path = nil;
    
    if ([[self.dataArray[indexPath.row] objectForKey:@"Cell"] isEqualToString:@"MainCell"]) {
        path = [NSIndexPath indexPathForItem:(indexPath.row+1) inSection:indexPath.section];
    }else{
        path = indexPath;
    }
    
    if ([[self.dataArray[indexPath.row] objectForKey:@"isAttached"] boolValue]) {
        // 关闭附加cell
        NSDictionary * dic = @{@"Cell": @"MainCell",@"isAttached":@(NO)};
        self.dataArray[(path.row-1)] = dic;
        [self.dataArray removeObjectAtIndex:path.row];
        
        [self.tableView1 beginUpdates];
        [self.tableView1 deleteRowsAtIndexPaths:@[path]  withRowAnimation:UITableViewRowAnimationMiddle];
        [self.tableView1 endUpdates];
        
    }else{
        // 打开附加cell
        NSDictionary * dic = @{@"Cell": @"MainCell",@"isAttached":@(YES)};
        self.dataArray[(path.row-1)] = dic;
        NSDictionary * addDic = @{@"Cell": @"AttachedCell",@"isAttached":@(YES)};
        [self.dataArray insertObject:addDic atIndex:path.row];
        
        
        [self.tableView1 beginUpdates];
        [self.tableView1 insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationMiddle];
        [self.tableView1 endUpdates];
        
    }
}

- (void)pushBuilddingDetail:(NSNotification *)userInfo
{
    NSLog(@"%@",[userInfo object]);
    BuilddingDetailViewController *detail = [[BuilddingDetailViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[self.dataArray[indexPath.row] objectForKey:@"Cell"] isEqualToString:@"MainCell"])
    {
        return 248;
    }else{
        return 112;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
