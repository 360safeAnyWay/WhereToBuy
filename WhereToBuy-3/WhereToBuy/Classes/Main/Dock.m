//
//  Dock.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-4.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "Dock.h"
#import "NSString+WJ.h"

@interface Dock()
{
    DockItem *_selectItem;
}
@end

@implementation Dock

- (void) addItemWithIcon:(NSString *)icon andTitle:(NSString *)title
{
    //创建Item
    DockItem *item = [[DockItem alloc] init];
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [item setTitleColor:kMainColor forState:UIControlStateSelected];
    [item setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:[icon fileApped:@"_selected"]] forState:UIControlStateSelected];
    //监听Item的点击
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
    //添加item
    [self addSubview:item];
    //调整所有的item的frame
    NSInteger count = self.subviews.count;
    // 默认选中第一个item
    if (count == 1) {
        [self itemClick:item];
    }
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width / count;
    for (NSInteger i = 0; i<count; i++) {
        DockItem *dockItem = self.subviews[i];
        dockItem.tag = i;
        dockItem.frame = CGRectMake(width * i, 0, width, height);
    }
}

- (void) itemClick:(DockItem *)btn
{
    if ([_delegate respondsToSelector:@selector(dock:itemSelectedFrom:to:)]) {
        [_delegate dock:self itemSelectedFrom:_selectItem.tag to:btn.tag];
    }
    //取消当前选中的item
    _selectItem.selected = NO;
    //选中当前选中的item
    btn.selected = YES;
    //记录当前选中的item
    _selectItem = btn;
    _selectedIndex = _selectItem.tag;
}

@end
