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
<<<<<<< HEAD

=======
@property (nonatomic,strong)UIImageView * Moimage;
>>>>>>> parent of e1f60e4... d大是大非上的
@end


@protocol PersonTopicAndFeedbackDelegate <NSObject>

- (void)showTableViewType:(NSInteger)type;

@end
