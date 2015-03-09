//
//  Tools.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-4.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Tools : NSObject

//弹出ALertView的提示，只需要输入要弹出的信息即可
+ (void)showAlertView:(NSString *)tips;

//将时间从时间戳转换为当地标准时间
+ (NSString *) timeExange:(NSString *) integer;

//设置UIView的边框线，也可以设置按钮及Label的边框线
+(void) setUIViewLine:(UIView *) temp cornerRadius:(NSInteger) radius with:(NSInteger) width color:(UIColor *)color;

//根据RGB返回特定的颜色
+(UIColor *) colorWithRed:(CGFloat) red angGreen:(CGFloat) green andBlue:(CGFloat)blue;

@end
