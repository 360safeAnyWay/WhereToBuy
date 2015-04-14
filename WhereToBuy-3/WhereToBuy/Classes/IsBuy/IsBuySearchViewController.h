//
//  IsBuySearchViewController.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-3-1.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "BaseViewController.h"

@protocol IsBuySearchViewControllerDelegate;

@interface IsBuySearchViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate> {
    NSMutableArray *dataArray;
    NSMutableArray *searchResults;
    UISearchBar *mySearchBar;
    UISearchDisplayController *searchDisplayController;
}
@property (weak, nonatomic) UITableView *tableView;
@property (assign, nonatomic) NSInteger flag;//用于判别是哪一个控制器进行跳转
@property (weak, nonatomic) id<IsBuySearchViewControllerDelegate>delegate;

@end

//将选中的值回传回去
@protocol IsBuySearchViewControllerDelegate <NSObject>

- (void)pushTagValue:(NSString *)str;

@end