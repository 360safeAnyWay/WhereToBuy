//
//  NSString+WJ.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-4.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "NSString+WJ.h"

@implementation NSString (WJ)

- (NSString *)fileApped:(NSString *)append
{
    NSString *ext = [self pathExtension];
    NSString *imageName = [self stringByDeletingPathExtension];
    imageName = [imageName stringByAppendingString:append];
    return [imageName stringByAppendingPathExtension:ext];
}

@end
