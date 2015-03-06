//
//  CenterMainCellButton.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-3.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "CenterMainCellButton.h"

@implementation CenterMainCellButton

-(id) initWithFrame:(CGRect) frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.imageView.contentMode = UIViewContentModeCenter;
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

//调整内部的imageView
- (CGRect) imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(6, 7, 28, 28);
}

//调整内部的UILabel的Frame
-(CGRect) titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(40, 6, 260, 30);
}

@end
