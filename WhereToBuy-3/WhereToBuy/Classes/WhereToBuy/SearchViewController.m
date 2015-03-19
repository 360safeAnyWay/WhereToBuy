//
//  SearchViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-12.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchTableViewCell.h"
#import "Tools.h"
#import "ServiceManage.h"
#import "SelectCityViewController.h"
#import "DBAccess.h"
#import "SearchDetailViewController.h"
#import "DDMenuController.h"

@interface SearchViewController ()<UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

{
    BOOL _isUpFlag;//判断升起还是降下
    NSInteger _indexTable;//定位是哪一行需要更新数据
    NSInteger _indexPicker;
    NSString *_beforeCityName;//之前保存的城市名
    //保存用户输入的中文汉字字符串
}

@property (strong, nonatomic) NSMutableArray *dataTableArr;
@property (weak, nonatomic) UIPickerView *picker;
@property (strong, nonatomic) NSMutableArray *dataPcikerArr;
@property (strong, nonatomic) NSMutableArray *dataPickerArrs;//存放所有的数据的二维数组
@property (weak, nonatomic) UITableView *table;
@property (weak, nonatomic) UITableView *tipsTable;//智能提示表格
@property (strong, nonatomic) NSMutableArray *housesData;//智能提示数据
@property (weak, nonatomic) UIView *myView;//封装选择器的方法
@property (weak, nonatomic) UITextField *text;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    UIButton *itemBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(245, 8, 20, 30)];
    [itemBtn2 setBackgroundImage:[UIImage imageNamed:@"more.png"] forState:UIControlStateNormal];
    [itemBtn2 addTarget:self action:@selector(more) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *more = [[UIBarButtonItem alloc] initWithCustomView:itemBtn2];
    self.navigationItem.rightBarButtonItem = more;
    [self addUI];
    _isUpFlag = YES;
    _indexTable = 0;
    _indexPicker = 0;
    //数据源
    self.dataTableArr = [[NSMutableArray alloc] initWithArray:@[@"location1.png",@"区域",@"全部",@"area.png",@"面积",@"全部",@"price.png",@"价格",@"全部",@"houseType.png",@"个性",@"全部"]];
    self.dataPickerArrs = [[NSMutableArray alloc] initWithCapacity:4];
    self.dataPcikerArr = [[NSMutableArray alloc] init];
    self.housesData = [[NSMutableArray alloc] init];
    [self getCity];
//    [self getHousesNameFromNet];
//    [self getHousesName];
}

//显示更多菜单
- (void)more
{
    DDMenuController *menu = self.view.window.rootViewController.childViewControllers[1];
    [menu showRightController:YES];
}

//获取所有的小区名，从数据里根据模糊查询获取数据
- (void) getHOusesDataFromSql:(NSString *)str
{
    [DBAccess openDB];
    NSString * sqlS = [NSString stringWithFormat:@"select name from houses where name like '%@%%'",str];
    self.housesData = [DBAccess getDataFromDBWithSql:[sqlS UTF8String]];
    [DBAccess closeDB];
    if (self.housesData == nil) {
        return;
    }
    [self.tipsTable reloadData];
    NSIndexPath *first = [NSIndexPath indexPathForRow:0 inSection:0];//用来刷新数据的时，始终默认的滚动到第一行
    [self.tipsTable selectRowAtIndexPath:first animated:YES scrollPosition:UITableViewScrollPositionTop];
}

//获取所有小区的数据，并存储到本地数据库
- (void) getHousesNameFromNet
{
    [[ServiceManage shareInstance] DidGetHousesName:@{} completion:^(ERROR_CODE code, id obj) {
        if (code == ERROR_CODE_NONE) {
            self.housesData = obj[@"resandsub"];
            [DBAccess openDB];
            const char *sqlC = "delete from houses";
            [DBAccess cleanDBWithSql:sqlC];
            for (NSInteger i =0; i < self.housesData.count; i++) {
                NSString *sql = [NSString stringWithFormat:@"insert into houses (name, num) values ('%@', 3)",self.housesData[i]];
                [DBAccess insertDBWithSql:[sql UTF8String]];
            }
            const char *sqlS = "select name from houses";
            NSMutableArray *arr = [DBAccess getDataFromDBWithSql:sqlS];
            NSLog(@"arr = %@",arr);
            [DBAccess closeDB];
        }
    }];
}

//如果存储的城市变了，则我们需要重新获取数据
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSString *city = [[NSUserDefaults standardUserDefaults] objectForKey:@"city"];
    if (![_beforeCityName isEqualToString:city]) {
        [[ServiceManage shareInstance] DidGetDistrict:@{@"city":city} completion:^(ERROR_CODE code, id obj) {
            NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:obj[@"district"]];
            [arr insertObject:@"全部" atIndex:0];
            [self.dataPickerArrs replaceObjectAtIndex:0 withObject:arr];
            [self.dataTableArr removeAllObjects];
            [self.dataTableArr addObjectsFromArray:@[@"location1.png",@"区域",@"全部",@"area.png",@"面积",@"全部",@"price.png",@"价格",@"全部",@"houseType.png",@"个性",@"全部"]];
            [self.table reloadData];
        }];
        _beforeCityName = city;
    }
    NSLog(@"模态视图消失");
}

//获取所有选择的信息
- (void)getCity
{
    NSString *city = [[NSUserDefaults standardUserDefaults] objectForKey:@"city"];
    _beforeCityName = city;
    [[ServiceManage shareInstance] DidGetDistrict:@{@"city":city} completion:^(ERROR_CODE code, id obj) {
        if (code == ERROR_CODE_NONE) {
            NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:obj[@"district"]];
            [arr insertObject:@"全部" atIndex:0];
            [self.dataPickerArrs addObject:arr];
            [[ServiceManage shareInstance] DidGetArea:nil completion:^(ERROR_CODE code, id obj) {
                if (code == ERROR_CODE_NONE) {
                    NSMutableArray *arr = [self exchangeArr:obj[@"area"] withEndStr:@"平方"];
                    [arr insertObject:@"全部" atIndex:0];
                    [self.dataPickerArrs addObject:arr];
                    [[ServiceManage shareInstance] DidGetPrice:nil completion:^(ERROR_CODE code, id obj) {
                        if (code == ERROR_CODE_NONE) {
                            NSMutableArray *arr = [self exchangeArr:obj[@"price"] withEndStr:@"万"];
                            [arr insertObject:@"全部" atIndex:0];
                            [self.dataPickerArrs addObject:arr];
                            [[ServiceManage shareInstance] DidGetType:nil completion:^(ERROR_CODE code, id obj) {
                                if (code == ERROR_CODE_NONE) {
                                    NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:obj[@"type"]];
                                    [arr insertObject:@"全部" atIndex:0];
                                    [self.dataPickerArrs addObject:arr];
                                }
                            }];
                        }
                    }];
                }
            }];

        }
        }];
}

- (void) back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addUI
{
    //列表：显示选择菜单
    UITableView *table = [[UITableView alloc] initWithFrame:GTRectMake(GTFixWidthFlaot(20), GTFixHeightFlaot(120), 280, 162) style:UITableViewStylePlain];
    [table setDelegate:self];
    table.rowHeight = GTFixHeightFlaot(40.0f);
    [table setContentInset:UIEdgeInsetsMake(-67, 0, 0, 0)];
    table.sectionHeaderHeight = 5.0f;
    table.estimatedSectionHeaderHeight = 5.0f;
    [table setDataSource:self];
    [table setBackgroundColor:[UIColor lightGrayColor]];
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    table.scrollEnabled = NO;
    [self.view addSubview:table];
    self.table = table;
    
    //搜索框视图
    UIView *searchView = [[UIView alloc] initWithFrame:GTRectMake(GTFixWidthFlaot(20), GTFixHeightFlaot(85), 280, 40)];
    [searchView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:searchView];
    
    //搜索框textField
    UITextField *searchText = [[UITextField alloc] initWithFrame:GTRectMake(GTFixWidthFlaot(45), 0, 190, 40)];
    [searchText addTarget:self action:@selector(autoTips:) forControlEvents:UIControlEventEditingChanged];
    [searchText setReturnKeyType:UIReturnKeyDone];
    [searchView addSubview:searchText];
    self.text = searchText;
    [searchText setDelegate:self];
    
    //搜索框架中的搜索按钮
    UIImageView *searchUseKeywordBtn = [[UIImageView alloc] initWithFrame:GTRectMake(GTFixWidthFlaot(235), GTFixHeightFlaot(5), 30, 30)];
    [searchUseKeywordBtn setImage:[UIImage imageNamed:@"searchSmall.png"]];
    [searchView addSubview:searchUseKeywordBtn];
    
    //搜索框中的定位按钮，跳转到选择城市
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:GTRectMake(GTFixWidthFlaot(15), GTFixHeightFlaot(5), 30, 30)];
    [btn addTarget:self action:@selector(selectCity) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:[UIImage imageNamed:@"selectCity.png"] forState:UIControlStateNormal];
    [searchView addSubview:btn];
    
    //搜索框中的两个小竖线
    for (NSInteger i = 0; i <= 1; i++) {
        UIView *views = [[UIView alloc] initWithFrame:GTRectMake(i * GTFixWidthFlaot(260) + GTFixWidthFlaot(10), GTFixHeightFlaot(28), 1, 12)];
        [views setBackgroundColor:[UIColor lightGrayColor]];
        [searchView addSubview:views];
    }
    
    //添加线条，下面的下划线
    for (NSInteger i = 1; i < 6; i++) {
        UIView *view1 = [[UIView alloc] initWithFrame:GTRectMake(GTFixWidthFlaot(30), GTFixHeightFlaot(85)  + (i * GTFixHeightFlaot(40)), 260, 1)];
        [view1 setBackgroundColor:[UIColor lightGrayColor]];
        [self.view addSubview:view1];
    }
    
    //添加搜索按钮,下面大的搜索按钮
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchBtn setFrame:GTRectMake(GTFixWidthFlaot(35), GTFixWidthFlaot(307), 250, 45)];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"searchBtn.png"] forState:UIControlStateNormal];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"searchBtn_selected.png"] forState:(UIControlStateHighlighted)];
    [searchBtn addTarget:self action:@selector(searchSource) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:searchBtn];
    
    //选择器封装视图
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height / 5 * 2)];
    [self.view addSubview:myView];
    self.myView = myView;
    
    //选择器
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height / 5 * 2 - 40)];
    [picker setDelegate:self];
    [picker setBackgroundColor:[UIColor colorWithRed:204 / 255.0 green:204 / 255.0 blue:204 /255.0 alpha:1.0]];
    [myView addSubview:picker];
    self.picker = picker;
    
    //功能控制View
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    [headerView setBackgroundColor:[UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 /255.0 alpha:1.0]];
    [myView addSubview:headerView];
    
    //向上选择
    UIButton *up = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [up setFrame:CGRectMake(5, 5, 30, 30)];
    [up setBackgroundImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
    [up addTarget:self action:@selector(up) forControlEvents:UIControlEventTouchUpInside];
    up.tag = 1;
    [headerView addSubview:up];
    
    //向下选择
    UIButton *down = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [down setFrame:CGRectMake(40, 5, 30, 30)];
    [down setBackgroundImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
    [down addTarget:self action:@selector(down) forControlEvents:UIControlEventTouchUpInside];
    down.tag = 2;
    [headerView addSubview:down];
    
    //完成
    UIButton *selectCityBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [selectCityBtn setFrame:CGRectMake(self.view.frame.size.width - 35, 5, 30, 30)];
    [selectCityBtn setTitle:@"完成" forState:UIControlStateNormal];
    [selectCityBtn addTarget:self action:@selector(done) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:selectCityBtn];
    
    //列表：显示智能提示的表格
    UITableView *tableTips = [[UITableView alloc] initWithFrame:GTRectMake(GTFixWidthFlaot(20), GTFix4SHeightFlaot(127), 280, self.view.frame.size.height - 380) style:UITableViewStylePlain];//加上了屏幕高度，点击后直接弹出，否则原地
    CGPoint center = tableTips.center;
    center.y += self.view.frame.size.height;
    tableTips.center = center;
    NSLog(@"center %f",center.y);
    [tableTips setDelegate:self];
    [tableTips setBackgroundColor:[UIColor whiteColor]];
    tableTips.rowHeight = 40.0f;
    tableTips.showsVerticalScrollIndicator = NO;
    [tableTips setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    tableTips.sectionHeaderHeight = 5.0f;
    tableTips.estimatedSectionHeaderHeight = 5.0f;
    [tableTips setDataSource:self];
    [self.view addSubview:tableTips];
    self.tipsTable = tableTips;
}

//选择器完成选择
- (void)done
{
    if (!_isUpFlag) {
        [UIView animateWithDuration:0.5f animations:^{//下降动画方法
            CGPoint center = self.myView.center;
            center.y += (self.view.frame.size.height / 5 * 2 - 54);
            self.myView.center = center;
            center = self.view.center;
            center.y += 50;
            self.view.center = center;
        } completion:nil];
        _isUpFlag = YES;
    }
    if (self.dataPcikerArr.count != 0) {//如果所选择的城市没有上传区域数据，不执行下列方法
        [self.dataTableArr replaceObjectAtIndex:(_indexTable - 1) * 3 + 2 withObject:self.dataPcikerArr[_indexPicker]];//将任意换成用户选择的文字
        [self.table reloadData];
    }
}

//选择上一个数据源请求,_indexTable分别对应 1 2 3 4行
- (void)up
{
    NSLog(@"向上");
    if (_indexTable > 1) {//只要大于1，那么就可以向上滑动
        _indexTable--;
        if (_indexTable == 2) {//如果等于2，说明只能滑动本次
            
        }
        self.dataPcikerArr = self.dataPickerArrs[_indexTable - 1];
        [self.picker reloadAllComponents];
    }
}

//选择下一个数据源请求
- (void)down
{
    NSLog(@"向下");
    if (_indexTable < 4) {
        _indexTable++;
        if (_indexTable == 3) {
            
        }
        self.dataPcikerArr = self.dataPickerArrs[_indexTable - 1];
        [self.picker reloadAllComponents];
    }
}

//搜索按钮，大搜索按钮
- (void)searchSource
{
    NSLog(@"搜索");
    SearchDetailViewController *searchDetail = [[SearchDetailViewController alloc] init];
    [self.navigationController pushViewController:searchDetail animated:YES];
}

//搜索框中的定位城市按钮
- (void)selectCity
{
    NSLog(@"开始定位");
    SelectCityViewController *select = [[SelectCityViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:select];
    [self presentViewController:nav animated:YES completion:^{
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"isModalView" forKey:@"isModalView"];
        [defaults synchronize];
    }];
}

//触摸背景，关闭键盘的方法
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [self downTipsTable];
}

#pragma mark -- table--dataSource & delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = 0;
    if(tableView == self.table)
    {
        count = 4;
    }
    else if(tableView == self.tipsTable)
    {
        count = self.housesData.count;
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cells;
    if (tableView == self.table) {
        NSString *cellID = @"cell";
        SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[SearchTableViewCell alloc] init];
            [cell cellInitWithArr:_dataTableArr atIndex:indexPath.row];
            cells = cell;
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else if(tableView == self.tipsTable)
    {
        NSString *cellID = @"cellTips";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] init];
            cells = cell;
        }
        cell.textLabel.text = self.housesData[indexPath.row];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    return cells;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.table) {
        if ([self.text isFirstResponder]) {//如果已经打开了键盘，用户点击搜索，应退出键盘
            [self.text resignFirstResponder];
        }
        if (_isUpFlag) {
            [UIView animateWithDuration:0.5f animations:^{//升起动画方法
                CGPoint center = self.myView.center;
                center.y -= (self.view.frame.size.height / 5 * 2 - 54);
                self.myView.center = center;
                center = self.view.center;
                center.y -= 50;
                self.view.center = center;
            } completion:nil];
            _isUpFlag = NO;
        }
        _indexTable = indexPath.row + 1;
        
        self.dataPcikerArr = self.dataPickerArrs[indexPath.row];//点击后重新刷新picker的数据
        _indexPicker = 0;
        [self.picker reloadAllComponents];
        [self.picker selectRow:0 inComponent:0 animated:NO];//每次点击的时候，将选择器控制在第一行
    }else if(tableView == self.tipsTable)
    {
        
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0f;
}

- (UITableViewHeaderFooterView *)headerViewForSection:(NSInteger)section NS_AVAILABLE_IOS(6_0)
{
    UITableViewHeaderFooterView *view = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1)];
    [view setBackgroundColor:[UIColor lightGrayColor]];
    return view;
}

#pragma mark -- picker--dataSource & delegate
//返回显示多少列
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

//返回多少行
- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _dataPcikerArr.count;
}

//返回行内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _dataPcikerArr[row];
}

//选中了哪一行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _indexPicker = [self.picker selectedRowInComponent:0];
}

//将价格数组的内容转换成可显示的内容
- (NSMutableArray *)exchangeArr:(NSArray *)arr withEndStr:(NSString *)string
{
    NSMutableArray *arrM = [[NSMutableArray alloc] initWithCapacity:arr.count];
    for (NSInteger i = 0; i < arr.count; i++) {
        NSMutableString *str = [[NSMutableString alloc] initWithString:arr[i]];
        NSRange range = NSMakeRange(0, [str length]);
        if (i == arr.count -1) {
                NSRange range1 = [str rangeOfString:@"|"];//定位到｜所在的位置
            NSMutableString *str2 = [[NSMutableString alloc] initWithString:[str substringToIndex:range1.location]];//将东西取出来
            [str2 insertString:@"大于" atIndex:0];
            [str2 appendString:string];
            str = str2;//重新赋值给str
        }else
        {
            [str replaceOccurrencesOfString:@"|" withString:@"~" options:NSCaseInsensitiveSearch range:range];
            [str appendString:string];
        }
        [arrM addObject:str];
    }
    return arrM;
}

#pragma mark -- delegate 
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSString *str = [NSString stringWithFormat:@"%@",self.text.text];
//    NSLog(@"%@",str);
//    return YES;
//}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.text resignFirstResponder];
    [self downTipsTable];
    return YES;
}

- (void)autoTips:(id)sender
{
    NSInteger count = 0;
    NSMutableString *insertStr = [[NSMutableString alloc] init];
    if (self.text.text.length > 0) {
        for (NSInteger i = 0; i<self.text.text.length; i++) {
            unichar c = [self.text.text characterAtIndex:i];
            if (c >=0x4E00 && c <=0x9FA5)
            {
                [self increaeTipsTable];
                count++;
                [insertStr appendString:[self.text.text substringWithRange:NSMakeRange(i, 1)]];
                [self getHOusesDataFromSql:insertStr];
            }
        }
    }
}

- (void)increaeTipsTable
{
    if (self.tipsTable.center.y > 700 && self.tipsTable.center.y < 800) {//输入文字，如果提示列表没有出现，就出现
        CGPoint center = self.tipsTable.center;
        center.y -= self.view.frame.size.height;
        self.tipsTable.center = center;
    }
}

- (void)downTipsTable
{
    if (self.tipsTable.center.y > 200 && self.tipsTable.center.y < 300) {//点击完成按钮，如果提示列表还在，就推出
        CGPoint center = self.tipsTable.center;
        center.y += self.view.frame.size.height;
        self.tipsTable.center = center;
    }
}


@end



