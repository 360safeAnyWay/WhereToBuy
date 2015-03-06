//
//  IsBuySearchViewController.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-3-1.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "IsBuySearchViewController.h"
#import "Tools.h"
#import "ChineseInclude.h"
#import "PinYinForObjc.h"
#import <CoreText/CoreText.h>
#import "TagCell.h"

@implementation IsBuySearchViewController

- (id) init
{
    self = [super init];
    if (self) {
        self.flag = 3;
        [self addObserver:self forKeyPath:@"flag" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    }
    return self;
}

//页面消失的时候，去除观察者
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self removeObserver:self forKeyPath:@"flag" context:NULL];
}

- (void)viewDidLoad
{
    self.title = @"搜索话题";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self addUI];
    
}

//监听方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"flag"]) {
        NSLog(@"KVO 重新改变的值 %ld",(long)self.flag);
    }
}

//返回按钮
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addUI
{
    mySearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    mySearchBar.delegate = self;
    [mySearchBar setBarTintColor:[UIColor whiteColor]];
    if (_flag == 2) {
        [mySearchBar setPlaceholder:@"输入#号可以搜索楼盘标签哦"];
    }else if (_flag == 1)
    {
        [mySearchBar setPlaceholder:@"请输入关键字进行检索"];
    }
    
    searchDisplayController = [[UISearchDisplayController alloc]initWithSearchBar:mySearchBar contentsController:self];
    searchDisplayController.active = NO;
    searchDisplayController.searchResultsDataSource = self;
    searchDisplayController.searchResultsDelegate = self;
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    table.rowHeight = 44;
    table.tableHeaderView = mySearchBar;
    table.dataSource = self;
    table.delegate = self;
    [self.view addSubview:table];
    self.tableView = table;
    dataArray = [@[@"德盈国际广场",@"莱茵铂郡",@"盛世公馆",@"晓庄国际广场",@"中央金地",@"天凤国际",@"南京万达广场",@"侯家桥16号",@"恒大金碧天下",@"卧龙湖国际社区",@"世纪天城",@"百美山庄",@"阳光东紫园",@"新湖仙林翠谷",@"开元香山壹境",@"金太阳鹭港",@"玫瑰十一英里",@"碧桂园凤凰城",@"中国边城",@"海玥名都苑",@"百家汇科技社区"]mutableCopy];
}

#pragma UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return searchResults.count;
    }
    else {
        return dataArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    TagCell *cell = (TagCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TagCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        [cell cellInitWithCell:searchResults andIndex:indexPath.row];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"#%@",searchResults[indexPath.row]]];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, 1)];
    }
    else {
        [cell cellInitWithCell:dataArray andIndex:indexPath.row];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"#%@",dataArray[indexPath.row]]];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, 1)];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.flag == 1) {//从发表主题的页面进行跳转过来
        TagCell *cell = (TagCell *)[tableView cellForRowAtIndexPath:indexPath];
        [self.delegate pushTagValue:cell.tagName.text];
        [self.navigationController popViewControllerAnimated:YES];
    }else if(self.flag == 2)
    {//从搜索的页面跳转过来
        
    }
}

#pragma UISearchDisplayDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (_flag == 1) {
        searchResults = [[NSMutableArray alloc]init];
        if (mySearchBar.text.length>0&&![ChineseInclude isIncludeChineseInString:mySearchBar.text]) {
            for (int i=0; i<dataArray.count; i++) {
                if ([ChineseInclude isIncludeChineseInString:dataArray[i]]) {
                    NSString *tempPinYinStr = [PinYinForObjc chineseConvertToPinYin:dataArray[i]];
                    NSRange titleResult=[tempPinYinStr rangeOfString:mySearchBar.text options:NSCaseInsensitiveSearch];
                    if (titleResult.length>0) {
                        [searchResults addObject:dataArray[i]];
                    }
                    NSString *tempPinYinHeadStr = [PinYinForObjc chineseConvertToPinYinHead:dataArray[i]];
                    NSRange titleHeadResult=[tempPinYinHeadStr rangeOfString:mySearchBar.text options:NSCaseInsensitiveSearch];
                    if (titleHeadResult.length>0) {
                        [searchResults addObject:dataArray[i]];
                    }
                }
                else {
                    NSRange titleResult=[dataArray[i] rangeOfString:mySearchBar.text options:NSCaseInsensitiveSearch];
                    if (titleResult.length>0) {
                        [searchResults addObject:dataArray[i]];
                    }
                }
            }
        } else if (mySearchBar.text.length>0&&[ChineseInclude isIncludeChineseInString:mySearchBar.text]) {
            for (NSString *tempStr in dataArray) {
                NSRange titleResult=[tempStr rangeOfString:mySearchBar.text options:NSCaseInsensitiveSearch];
                if (titleResult.length>0) {
                    [searchResults addObject:tempStr];
                }
            }
        }
    }else if (_flag == 2)
    {
        if (mySearchBar.text.length < 1) {
            return;
        }
        searchResults = [[NSMutableArray alloc]init];
        NSString *str = [mySearchBar.text substringWithRange:NSMakeRange(0, 1)];
        if ([str isEqualToString:@"#"] && mySearchBar.text.length > 1) {
            str = [mySearchBar.text substringWithRange:NSMakeRange(1, mySearchBar.text.length - 1)];
            if (str>0&&![ChineseInclude isIncludeChineseInString:str]) {
                for (int i=0; i<dataArray.count; i++) {
                    if ([ChineseInclude isIncludeChineseInString:dataArray[i]]) {
                        NSString *tempPinYinStr = [PinYinForObjc chineseConvertToPinYin:dataArray[i]];
                        NSRange titleResult=[tempPinYinStr rangeOfString:str options:NSCaseInsensitiveSearch];
                        if (titleResult.length>0) {
                            [searchResults addObject:dataArray[i]];
                        }
                        NSString *tempPinYinHeadStr = [PinYinForObjc chineseConvertToPinYinHead:dataArray[i]];
                        NSRange titleHeadResult=[tempPinYinHeadStr rangeOfString:str options:NSCaseInsensitiveSearch];
                        if (titleHeadResult.length>0) {
                            [searchResults addObject:dataArray[i]];
                        }
                    }
                    else {
                        NSRange titleResult=[dataArray[i] rangeOfString:str options:NSCaseInsensitiveSearch];
                        if (titleResult.length>0) {
                            [searchResults addObject:dataArray[i]];
                        }
                    }
                }
            } else if (str.length>0&&[ChineseInclude isIncludeChineseInString:str]) {
                for (NSString *tempStr in dataArray) {
                    NSRange titleResult=[tempStr rangeOfString:str options:NSCaseInsensitiveSearch];
                    if (titleResult.length>0) {
                        [searchResults addObject:tempStr];
                    }
                }
            }
        }
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"开始搜索");
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.frame = CGRectMake(-320, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    [UIView animateWithDuration:0.7 animations:^{
        cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    } completion:^(BOOL finished) {
        ;
    }];
}


@end
