//
//  SpecialistViewController.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/27.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "SpecialistViewController.h"
#import "IsBuySendTopicViewController.h"
@interface SpecialistViewController ()
{
    UITableView             * _myTableView;
}

@end

@implementation SpecialistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SpecialistCell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SpecialistCell"];
    }
    cell.imageView.image = [UIImage imageNamed:@"share.png"];
    cell.imageView.backgroundColor =[UIColor redColor];
    cell.textLabel.text = @"专家名字测试";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    IsBuySendTopicViewController * is = [self.navigationController.viewControllers objectAtIndex: ([self.navigationController.viewControllers count] -2)];
    [is SpecialistNameWithindex:indexPath tableView:tableView block:nil];
    [self.navigationController popViewControllerAnimated:YES] ;
}
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
