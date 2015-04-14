//
//  MoreReplyViewController.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/23.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "MoreReplyViewController.h"
#import "MoreReplyTableViewCell.h"
#import "MoreRRTableViewCell.h"
@interface MoreReplyViewController ()
{
    UITableView             * _myTableView;
    NSMutableArray          * _sStrArray;
    CGFloat                   _deltaY;
//    取消键盘事件
    UIControl               * _ct;


}

@end

@implementation MoreReplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
}
- (void)createTableView
{
    UIButton *itemBtn4 = [[UIButton alloc] initWithFrame:CGRectMake(17, 5, 10.5, 18)];
    [itemBtn4 setBackgroundImage:[UIImage imageNamed:@"leftBack.png"] forState:UIControlStateNormal];
    [itemBtn4 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:itemBtn4];
    self.navigationItem.leftBarButtonItem= back;

    _sStrArray = [[NSMutableArray alloc]initWithObjects:@"人人人",@" 回复 ",@"@花花花",@":此处省略好多字!此处省略好多字!此处省略好多字!此处省略好多字!此处省略好多字!此处省略好多字!", nil];
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_myTableView];
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    UIView * view = [[UIApplication sharedApplication].delegate.window viewWithTag:1975];
    view.alpha = 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([indexPath row] == 0)
    {
        MoreRRTableViewCell * mrr = [[[NSBundle mainBundle]loadNibNamed:@"MoreRRTableViewCell" owner:nil options:nil]objectAtIndex:0];
        [mrr setSelectionStyle:UITableViewCellSelectionStyleNone];
        mrr.infoMessage.text = _infoMessage_Str;
        [self resetContent:mrr.infoMessage];
        return mrr;
    }else{
      MoreReplyTableViewCell * mr = [[[NSBundle mainBundle]loadNibNamed:@"MoreReplyTableViewCell" owner:nil options:nil]objectAtIndex:0];
        mr.infoMessages.attributedText  = [Tools textArr:_sStrArray andColor:kMainColor colorTextIndex:2];
      [mr setSelectionStyle:UITableViewCellSelectionStyleNone];
      return mr;

    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self PerFormKey:indexPath];
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}
-(void)PerFormKey:(NSIndexPath *)indexPath
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    if(self.key==nil){
        self.key =[[YcKeyBoardView alloc]initWithFrame:CGRectMake(0, kWinSize.height-44, kWinSize.width, 44)];
        self.key.textView.placeholder = @"回复 人人人";
        [self.key.sendButton addTarget:self action:@selector(sendButton:) forControlEvents:UIControlEventTouchUpInside];
        _ct = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        [_ct addTarget:self action:@selector(clearKey:) forControlEvents:UIControlEventTouchUpInside];
    }
    self.key.delegate=self;
    [self.key.textView becomeFirstResponder];
    self.key.textView.returnKeyType=UIReturnKeySend;
    [self.view addSubview:self.key];
    [self.view addSubview:_ct];

    
}
#pragma mark- 键盘的撤销事件
-(void)clearKey:(id)ct
{
    [_ct removeFromSuperview];
    [self.key removeFromSuperview];

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.row == 0)
    {
      CGRect rect = [self cellHight:_infoMessage_Str Size:CGSizeMake(210, 0)];
        return rect.size.height+114;
    }
    NSString * str = [NSString stringWithFormat:@"%@%@%@%@",[_sStrArray objectAtIndex:0],[_sStrArray objectAtIndex:1],[_sStrArray objectAtIndex:2],_sStrArray[3]];
    CGRect rect = [self cellHight:str Size:CGSizeMake(210, 0)];
    return rect.size.height+30;
}
-(CGRect)cellHight:(NSString *)cellText Size:(CGSize)size
{
    CGRect rect = [cellText boundingRectWithSize:size options:
                   NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil];
    return rect;
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark- 评论键盘
-(void)keyboardShow:(NSNotification *)note
{
    CGRect keyBoardRect=[note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    _deltaY =keyBoardRect.size.height;
    self.keyBoardHeight=_deltaY;
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        self.key.transform=CGAffineTransformMakeTranslation(0, -_deltaY);
    }];
}
-(void)keyboardHide:(NSNotification *)note
{
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        self.key.transform=CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self.key removeFromSuperview];
        self.key.textView.text=@"";
    }];
    
}
-(void)keyBoardViewHide:(YcKeyBoardView *)keyBoardView textView:(UITextView *)contentView
{
    [contentView resignFirstResponder];
    [self.key removeFromSuperview];
    //接口请求
    
}
-(void)sendButton:(UIButton *)btn
{
    [self.key removeFromSuperview];
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
