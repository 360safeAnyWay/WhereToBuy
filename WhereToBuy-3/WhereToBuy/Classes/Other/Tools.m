//
//  Tools.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-4.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "Tools.h"

@implementation Tools

+ (void)showAlertView:(NSString *)tips
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:tips delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
    [alertView show];
}

+ (NSString *) timeExange:(NSString *) integer
{
    NSInteger i = [integer integerValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:i];
    NSString *s = [NSString stringWithFormat:@"%@",date];
    return s;
}

+(void) setUIViewLine:(UIView *) temp cornerRadius:(NSInteger) radius with:(NSInteger) width color:(UIColor *)color
{
    if (color != nil) {
        temp.layer.cornerRadius = radius;
    }
    temp.layer.borderWidth = width;
    temp.layer.borderColor = color.CGColor;
}

//根据RGB返回特定的颜色
+(UIColor *) colorWithRed:(int) red angGreen:(int) green andBlue:(int)blue
{
    UIColor *color = [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
    return color;
}


@end
