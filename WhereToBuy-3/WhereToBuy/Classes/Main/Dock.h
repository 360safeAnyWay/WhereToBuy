//
//  Dock.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-4.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DockItem.h"
@protocol DockDelegate;

@interface Dock : UIView

@property (weak, nonatomic) id<DockDelegate>delegate;
@property (nonatomic, assign) NSInteger selectedIndex;

- (void) addItemWithIcon:(NSString *)icon andTitle:(NSString *)title;

- (void) itemClick:(DockItem *)btn;

@end

@protocol DockDelegate <NSObject>

- (void) dock:(Dock *)dock itemSelectedFrom:(NSInteger)from to:(NSInteger)to;

@end