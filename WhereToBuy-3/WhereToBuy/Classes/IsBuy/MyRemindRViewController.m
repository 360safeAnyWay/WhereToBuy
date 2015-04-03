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
#import "SystemCellTableViewCell.h"
#import "IsBuyTopicDetailViewController.h"
@interface MyRemindRViewController ()
{
    UITableView * _myTableView;
    

}

@end

@implementation MyRemindRViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [_myTableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的提醒";
    UIButton *itemBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(17, 5, 10.5, 18)];
    [itemBtn4 setBackgroundImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [itemBtn4 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:itemBtn4];
    self.navigationItem.leftBarButtonItem= back;
    _infoStr = @"我拿着刚发下来的试卷问同桌：这道题要求写ABAC式，我填“不孕不育”老师怎么没给我分数？同桌：可能是你戳中老师的痛处了。";
    [self createTableView];


}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
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
        return 80+rect.size.height;
    }else if ([_CellType isEqualToString:@"2"]){
        return 80;
    }else{
        
        return 90;
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
    if ([indexPath row ]== 3)
    {
        _CellType = @"3";
    }
    if ([_CellType isEqualToString:@"1"])
    {
        static NSString * str = @"RemindCell";
        RemindTableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"RemindTableViewCell" owner:nil options:nil]objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

            
        }
        cell.infoLabel.text = _infoStr;
        [self  resetContent:cell.infoLabel];
        [cell.Review addTarget:self action:@selector(CellReview:) forControlEvents:UIControlEventTouchUpInside];
        return cell;

    }else if([_CellType isEqual:@"2"])
        {
        static NSString * str = @"ZanCell";
        ZanTableViewCell * zcell = [tableView dequeueReusableCellWithIdentifier:str];
        if (zcell == nil)
        {
            zcell = [[[NSBundle mainBundle]loadNibNamed:@"ZanTableViewCell" owner:nil options:nil]objectAtIndex:0];
            [zcell setSelectionStyle:UITableViewCellSelectionStyleNone];

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
        }else{
            static NSString * str =@"SystemCell";
            SystemCellTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
            if (cell == nil)
            {
                cell =[[[NSBundle mainBundle]loadNibNamed:@"SystemCellTableViewCell" owner:nil options:nil]objectAtIndex:0];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

            }
            cell.info.text = _infoStr;
            [cell.XButton addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_CellType isEqualToString:@"1"]||[_CellType isEqualToString:@"2"])
    {
        IsBuyTopicDetailViewController * isbuy = [[IsBuyTopicDetailViewController alloc]init];
        [self.navigationController pushViewController:isbuy animated:YES];
        [_myTableView reloadData];

    }
    
}
#pragma mark- toots
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
                   NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
    return rect;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)CellReview:(UIButton *)btn
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    if(self.key==nil){
        self.key =[[YcKeyBoardView alloc]initWithFrame:CGRectMake(0, kWinSize.height-44, kWinSize.width, 44)];
        [self.key.sendButton addTarget:self action:@selector(sendButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    self.key.delegate=self;
    [self.key.textView becomeFirstResponder];
    self.key.textView.returnKeyType=UIReturnKeySend;
    [self.view addSubview:self.key];
}
#warning 这里有个WEB页面+++++++++++++++++++++++++++++++++++++++++++++++
#pragma button事件
-(void)btnClick
{
    
}
#pragma mark- 评论键盘
-(void)keyboardShow:(NSNotification *)note
{
    CGRect keyBoardRect=[note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat deltaY=keyBoardRect.size.height;
    self.keyBoardHeight=deltaY;
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        
        self.key.transform=CGAffineTransformMakeTranslation(0, -deltaY);
    }];
}
-(void)keyboardHide:(NSNotification *)note
{
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        self.key.transform=CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
        self.key.textView.text=@"";
        [self.key removeFromSuperview];
        self.key = nil;
    }];
    
}
-(void)keyBoardViewHide:(YcKeyBoardView *)keyBoardView textView:(UITextView *)contentView
{
    [contentView resignFirstResponder];
    //接口请求
    
}
-(void)sendButton:(UIButton *)btn
{
    [self.key removeFromSuperview];
    self.key = nil;
    NSLog(@"send");
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
