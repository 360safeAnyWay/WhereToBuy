//
//  VipEvaluteViewController.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-9.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "BaseViewController.h"

@protocol VipEvaluteDelegate;

@interface VipEvaluteViewController : BaseViewController

@property (assign, nonatomic)id<VipEvaluteDelegate>delegate;

@end

@protocol VipEvaluteDelegate <NSObject>

- (void)setBackButtonTitle:(NSString*) str andRow:(NSInteger)row;

@end