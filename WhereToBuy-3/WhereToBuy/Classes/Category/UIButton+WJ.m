//
//  UIButton+WJ.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-26.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "UIButton+WJ.h"
#import "NSString+WJ.h"

@implementation UIButton (WJ)

- (void) setBackgroundImage:(NSString *)imageName
{
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    NSString *imageHighlighted = [imageName fileApped:@"_highlighted"];
    [self setBackgroundImage:[UIImage imageNamed:imageHighlighted] forState:UIControlStateHighlighted];
}

@end
