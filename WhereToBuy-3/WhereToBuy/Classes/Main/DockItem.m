//
//  DockItem.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-4.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "DockItem.h"

@implementation DockItem

#define kTitleRatio 0.3

-(id) initWithFrame:(CGRect) frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.imageView.contentMode = UIViewContentModeCenter;
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_slider.png"] forState:UIControlStateSelected];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

//改写highLighted方法，隐藏该状态
- (void) setHighlighted:(BOOL)highlighted {}

//调整内部的imageView
- (CGRect) imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    CGFloat imageY = 2;
    CGFloat imageWidth = contentRect.size.width;
    CGFloat imageHeight = contentRect.size.height * (1 - kTitleRatio);
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

//调整内部的UILabel的Frame
-(CGRect) titleRectForContentRect:(CGRect)contentRect
{
    CGFloat tilteX = 0;
    CGFloat titleHeight = contentRect.size.height * kTitleRatio;
    CGFloat titleY = contentRect.size.height - titleHeight - 2;
    return CGRectMake(tilteX, titleY, contentRect.size.width, titleHeight);
}

@end
