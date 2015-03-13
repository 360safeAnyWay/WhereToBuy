//
//  MyRemindRViewController.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/13.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "MyRemindRViewController.h"
#import "RemindTableViewCell.h"
#import "ZanTableViewCell.h"
@interface MyRemindRViewController ()
{
    UITableView * _myTableView;
    

}

@end

@implementation MyRemindRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的提醒";
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    _infoStr = @"我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。";
    [self createTableView];


}
-(void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
#pragma mark- TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if ([_CellType  isEqualToString:@"1"])
    {
        CGRect rect = [self cellHight:_infoStr Size:CGSizeMake(210, 0)];
        return 100+rect.size.height;
    }else if ([_CellType isEqualToString:@"2"]){
        return 80;
    }else{
        return 100;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([indexPath row]== 1 || [indexPath row] == 2)
    {
        _CellType = @"2";
    }else{
        _CellType = @"1";
    }
    if ([_CellType isEqualToString:@"1"])
    {
        static NSString * str = @"RemindCell";
        RemindTableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"RemindTableViewCell" owner:nil options:nil]objectAtIndex:0];
            cell.infoLabel.text = _infoStr;
            [self  resetContent:cell.infoLabel];
            
        }
        return cell;

    }else
//        if([_CellType isEqual:@"2"])
        {
        static NSString * str = @"ZanCell";
        ZanTableViewCell * zcell = [tableView dequeueReusableCellWithIdentifier:str];
        if (zcell == nil)
        {
            zcell = [[[NSBundle mainBundle]loadNibNamed:@"ZanTableViewCell" owner:nil options:nil]objectAtIndex:0];
        }
            if ([indexPath row] == 1)
            {
                zcell.name.text = @"提莫";
                zcell.info.text = @"赞啦你的回复";
            }else{
                zcell.name.text = @"德莱文";
                zcell.info.text = @"踩啦你的回复";
            }
        return zcell;
    }
}
- (void)resetContent:(UILabel *)lab{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:lab.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.maximumLineHeight = 60;  //最大的行高
    paragraphStyle.lineSpacing = 1.5;  //行自定义行高度
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [lab.text length])];
    lab.attributedText = attributedString;
    [lab sizeToFit];
}
-(CGRect)cellHight:(NSString *)cellText Size:(CGSize)size
{
    CGRect rect = [cellText boundingRectWithSize:size options:
                   NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    return rect;
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
