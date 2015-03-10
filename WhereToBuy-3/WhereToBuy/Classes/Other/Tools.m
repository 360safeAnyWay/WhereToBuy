//
//  Tools.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-4.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "Tools.h"

@implementation Tools

+(instancetype)sharedInstance
{
    static Tools *tool = nil;
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!tool) {
            tool = [[Tools alloc] init];
        }
    });
    return tool;
}

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
+(UIColor *) colorWithRed:(CGFloat) red angGreen:(CGFloat) green andBlue:(CGFloat)blue
{
    UIColor *color = [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
    return color;
}

//获取Documents目录
+(NSString *)dirDoc{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"app_home_doc: %@",documentsDirectory);
    return documentsDirectory;
}

//获取Library目录
+(void)dirLib{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    NSLog(@"app_home_lib: %@",libraryDirectory);
}

//获取Cache目录
+(NSString *)dirCache{
    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cacPath objectAtIndex:0];
    return cachePath;
}

//获取Tmp目录
+(void)dirTmp{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
    NSString *tmpDirectory = NSTemporaryDirectory();
    NSLog(@"app_home_tmp: %@",tmpDirectory);
}

- (CGFloat) folderSizeAtPath:(NSString*) folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];//从前向后枚举器／／／／//
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSLog(@"fileName ==== %@",fileName);
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        NSLog(@"fileAbsolutePath ==== %@",fileAbsolutePath);
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    NSLog(@"folderSize ==== %lld",folderSize);
    return folderSize/(1024.0*1024.0);
}

///计算缓存文件的大小的M
- (long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    
    return 0;
}

@end
