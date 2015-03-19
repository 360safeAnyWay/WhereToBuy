//
//  NavBackButton.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-2-14.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "NavBackButton.h"

#define kTitleRatio 0.9

@implementation NavBackButton

-(id) initWithFrame:(CGRect) frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.font = [UIFont systemFontOfSize:20];
        [self.titleLabel setTintColor:[UIColor whiteColor]];
        self.imageView.contentMode = UIViewContentModeCenter;
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

//改写highLighted方法，隐藏该状态
- (void) setHighlighted:(BOOL)highlighted {}

//调整内部的imageView
- (CGRect) imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    CGFloat imageY = 4;
    CGFloat imageWidth = contentRect.size.width * (1 - kTitleRatio);
    CGFloat imageHeight = contentRect.size.height - 4;
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

//调整内部的UILabel的Frame
-(CGRect) titleRectForContentRect:(CGRect)contentRect
{
    CGFloat tilteX = (1 - kTitleRatio) * contentRect.size.width + 5;
    CGFloat titleHeight = contentRect.size.height;
    CGFloat titleY =0;
    return CGRectMake(tilteX, titleY, contentRect.size.width * kTitleRatio, titleHeight);
}

@end
