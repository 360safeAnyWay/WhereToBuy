//
//  MoreReplyViewController.m
//  WhereToBuy
//
//  Created by MAXMFJ on 15/3/12.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "MoreReplyViewController.h"

@interface MoreReplyViewController ()

@end

@implementation MoreReplyViewController
{
    NSString * _dataStr;
    CGFloat  _Porigin;
}
- (instancetype)initWithstr:(NSString *)str WithFlot:(CGFloat)PFlot number:(NSString *)number;
{
    self = [super init];
    if (self) {
        _dataStr = str;
        _Porigin = PFlot;
        _LcStr   = number;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBlack];
    [self createTableView];
    // Do any additional setup after loading the view.
}
//创建表
-(void)createTableView
{
    _myTableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _myTableView.delegate =self;
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _myTableView.dataSource =self;
    _myTableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_myTableView];
}
//返回按钮
-(void)createBlack
{
self.title = @"详细回复";
self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
self.view.backgroundColor = [UIColor whiteColor];
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    UIView * view = [[UIApplication sharedApplication].delegate.window viewWithTag:1975];
    view.alpha = 1;
}

#pragma mark- TableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString * str = @"cell";
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil)
    {
        cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 150+_Porigin;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150+_Porigin)];
    view.backgroundColor =[UIColor whiteColor];
    [self addUI:view];
    return view;
}
-(void)addUI:(UIView *)views
{
    UIButton *imageView = [[UIButton alloc] initWithFrame:CGRectMake(13, 15, 40, 40)];
    [Tools setUIViewLine:imageView cornerRadius:20 with:1 color:[UIColor whiteColor]];
    [imageView setBackgroundImage:[UIImage imageNamed:@"avatar.png"] forState:UIControlStateNormal];
    [imageView setUserInteractionEnabled:NO];
    imageView.clipsToBounds = YES;
    self.imageHead = imageView;
    [views addSubview:imageView];
    UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-75, 25, 15, 15)];
    image.image = [UIImage imageNamed:@"我发表的主题.png"];
    [views addSubview:image];
    
    UILabel * HFlabel = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-55, 18, 60, 30)];
    HFlabel.text = @"回复ta";
    HFlabel.textColor = [UIColor darkGrayColor];
    HFlabel.font = [UIFont systemFontOfSize:13];
    [views addSubview:HFlabel];
    UIButton *  HFbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    HFbtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-75, 15, 75, 30);
    [HFbtn addTarget:self action:@selector(PerFormKey) forControlEvents:UIControlEventTouchUpInside];
    [views addSubview:HFbtn];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x+imageView.frame.size.width+5,imageView.frame.origin.y+5 , 93, 12)];
    [nameLabel setText:@"鸟鸟鸟"];
    [nameLabel setTextColor:[UIColor blackColor]];
    [nameLabel setFont:[UIFont systemFontOfSize:14]];
    [nameLabel setTextAlignment:NSTextAlignmentLeft];
    self.nameLabel = nameLabel;
    [views addSubview:nameLabel];
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(5,nameLabel.frame.origin.y+15 , 200, 12)];
    [dateLabel setText:@"2015/3/9 14:21"];
    [dateLabel setTextColor:[UIColor darkGrayColor]];
    [dateLabel setFont:[UIFont systemFontOfSize:14]];
    [dateLabel setTextAlignment:NSTextAlignmentCenter];
    self.dateLabel = dateLabel;
    [views addSubview:dateLabel];
    //    分割线
    UIView *viewDown = [[UIView alloc] initWithFrame:CGRectMake(0, imageView.frame.origin.y+imageView.frame.size.height+10, [UIScreen mainScreen].applicationFrame.size.width, 1)];
    [viewDown setBackgroundColor:[Tools colorWithRed:236 angGreen:236 andBlue:236]];
    [views addSubview:viewDown];
    UILabel * infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, viewDown.frame.origin.y+10, [UIScreen mainScreen].bounds.size.width, _Porigin)];
    infoLabel.text = _dataStr;
    infoLabel.font = [UIFont systemFontOfSize:13];
    infoLabel.textColor = [UIColor darkGrayColor];
    [views addSubview:infoLabel];
    UIView *viewLDown = [[UIView alloc] initWithFrame:CGRectMake(0,views.frame.size.height-1, [UIScreen mainScreen].applicationFrame.size.width, 1)];
    [viewLDown setBackgroundColor:[Tools colorWithRed:236 angGreen:236 andBlue:236]];
    [views addSubview:viewLDown];
    UILabel * _LCLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, viewLDown.frame.origin.y-25, 80, 25)];
    _LCLabel.text = _LcStr;
    _LCLabel.font = [UIFont systemFontOfSize:13];
    _LCLabel.textColor = [UIColor darkGrayColor];
    [views addSubview:_LCLabel];

}
-(void)PerFormKey
{
    NSLog(@"弹出键盘");
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
