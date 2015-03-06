//
//  SelectCityViewController.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-13.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "BaseViewController.h"

@protocol  SelectCityDelegate;

@interface SelectCityViewController : BaseViewController

@property (weak, nonatomic) id<SelectCityDelegate>delegate;

@end

@protocol SelectCityDelegate <NSObject>
@optional

- (void)pushSelectRowValueToMain:(NSString *)city;

@end
