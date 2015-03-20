//
//  PersonCenterViewController.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-27.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "BaseViewController.h"
@protocol PersonTopicAndFeedbackDelegate;

@interface PersonCenterViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>

@property (assign, nonatomic) id delegate;

@end


@protocol PersonTopicAndFeedbackDelegate <NSObject>

- (void)showTableViewType:(NSInteger)type;

@end
