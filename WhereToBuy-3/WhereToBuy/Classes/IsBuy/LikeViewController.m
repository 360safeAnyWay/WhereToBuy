//
//  LikeViewController.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/14.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "LikeViewController.h"

@interface LikeViewController ()
{
    UITableView * _myTableView;

}

@end

@implementation LikeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];

}
-(void)createTableView
{
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.rowHeight = UITableViewAutomaticDimension;
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_myTableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 10;
}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
//{
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
