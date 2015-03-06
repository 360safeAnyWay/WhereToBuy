//
//  SelectCityViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-13.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "SelectCityViewController.h"
#import "ServiceManage.h"
#import "Tools.h"
#import "Constants.h"
#import "DBAccess.h"
#import "GTCommontHeader.h"
#import "MainViewController.h"

@interface SelectCityViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *dataArr;
@property (weak, nonatomic) UITableView *table;

@end

@implementation SelectCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];;
    self.title = @"选择城市";
    self.dataArr = [[NSMutableArray alloc] initWithArray:@[@"自动定位",@"南京",@"手动定位"]];
    NSString *firstTime = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstTime"];
    if (firstTime != nil) {//只有不是第一次才显示返回按钮
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, self.view.frame.size.height - 65) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [table setContentInset:UIEdgeInsetsMake(-64, 0, 64, 0)];
    [self.view addSubview:table];
    self.table = table;
    [self getCityFromDB];
}

- (void) getCityFromNet
{
    [[ServiceManage shareInstance] DidGetCity:@{@"province":@"江苏省"} completion:^(ERROR_CODE code, id obj) {
        if (code == ERROR_CODE_NONE) {
            NSLog(@"网络请求");
            [DBAccess openDB];
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            [arr addObjectsFromArray:obj[@"city"]];
            const char* sql = "delete from city";
            [DBAccess cleanDBWithSql:sql];
            for (int i = 0; i < arr.count; i++) {
                NSString *sqlS = [NSString stringWithFormat:@"insert into city (name,province_id) values ('%@',(select id from province where name = '江苏省'))",arr[i]];
                [DBAccess insertDBWithSql:[sqlS UTF8String]];
            }
            [DBAccess closeDB];
        }else
        {
            [Tools showAlertView:obj[@"message"]];
        }
    }];
}

- (void)getCityFromDB
{
    [DBAccess openDB];
    const char *sql = "select name from city where province_id = (select id from province where name = '江苏省')";
    [self.dataArr addObjectsFromArray:[DBAccess getDataFromDBWithSql:sql]];
    [self.table reloadData];
    [self getCityFromNet];
    [DBAccess closeDB];
}

- (void) back
{
    NSString *isModalView = [[NSUserDefaults standardUserDefaults] objectForKey:@"isModalView"];
    if ([isModalView isEqualToString:@"isModalView"]) {//如果是模态视图，使用dismiss方法，否则使用pop方法
        [self dismissViewControllerAnimated:YES completion:^{
            NSUserDefaults *defaultM = [NSUserDefaults standardUserDefaults];
            [defaultM setObject:@"notModalView" forKey:@"isModalView"];
            [defaultM synchronize];
        }];
    }else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark -- dataSource & delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    if (indexPath.row ==0 || indexPath.row == 2) {
        [cell setBackgroundColor:[UIColor colorWithRed:253 / 255.0 green:147 / 255.0 blue:40 / 255.0 alpha:1.0]];
    }
    if (indexPath.row == 1) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:GTRectMake(GTFixWidthFlaot(210), GTFixHeightFlaot(8), 25, 25)];
        [imageView setImage:[UIImage imageNamed:@"refresh.png"]];
        [imageView setUserInteractionEnabled:NO];
        [cell addSubview:imageView];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:GTRectMake(GTFixWidthFlaot(240), GTFixHeightFlaot(9), 80, 26)];
        [btn setTitle:@"重新定位" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:253 / 255.0 green:147 / 255.0 blue:40 / 255.0 alpha:1.0] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(refreshCity) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:btn];
    }
    cell.textLabel.text = _dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row > 2 || indexPath.row == 1) {
        NSString *isModalView = [[NSUserDefaults standardUserDefaults] objectForKey:@"isModalView"];
        if ([isModalView isEqualToString:@"isModalView"]) {//是否是模态视图进入，如果是，用dismiss方法
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            NSUserDefaults *defaultM = [NSUserDefaults standardUserDefaults];
            [defaultM setObject:@"notModalView" forKey:@"isModalView"];
            [defaultM setObject:_dataArr[indexPath.row] forKey:@"city"];//保存每次选择的城市，下次进入软件加载最后一次选择的城市
            [defaultM synchronize];
        }else
        {
            NSString *firstTime = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstTime"];
            if (firstTime == nil) {
                MainViewController *main = [[MainViewController alloc] initWithButtonCount:kKYCCircleMenuButtonsCount
                                                                                                      menuSize:kKYCircleMenuSize
                                                                                                    buttonSize:kKYCircleMenuButtonSize
                                                                                         buttonImageNameFormat:kKYICircleMenuButtonImageNameFormat
                                                                                              centerButtonSize:kKYCircleMenuCenterButtonSize
                                                                                         centerButtonImageName:kKYICircleMenuCenterButton
                                                                               centerButtonBackgroundImageName:kKYICircleMenuCenterButtonBackground];
                // Set navigation controller as the root vc
                [[UIApplication sharedApplication].windows[0] setRootViewController:main];
                [[UIApplication sharedApplication].windows[0] makeKeyAndVisible];
            }else{
                [self.navigationController popViewControllerAnimated:YES];
            }
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:_dataArr[indexPath.row] forKey:@"city"];//保存每次选择的城市，下次进入软件加载最后一次选择的城市
            [defaults setObject:@"login" forKey:@"firstTime"];
            [defaults synchronize];
            if (indexPath.row == 1) {
                [self.delegate pushSelectRowValueToMain:@"南京市"];
            }else
            {
                [self.delegate pushSelectRowValueToMain:_dataArr[indexPath.row]];
            }
        }
    }
}

//重新定位方法
- (void)refreshCity
{
    NSLog(@"重新定位");
}

@end
