//
//  Tools.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-4.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "Tools.h"

@implementation Tools



+(instancetype)shareInstance
{
    static Tools *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(!tool) {
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
    return documentsDirectory;
}

//获取Library目录
+(void)dirLib{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    NSLog(@"%@",libraryDirectory);
}

//获取Cache目录
-(NSString *)dirCache{
    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cacPath objectAtIndex:0];
    return cachePath;
}

//获取Tmp目录
+(void)dirTmp{
    //[NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
    NSString *tmpDirectory = NSTemporaryDirectory();
    NSLog(@"%@",tmpDirectory);

}

///计算缓存文件的大小的M
- (long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        
        //        //取得一个目录下得所有文件名
        //        NSArray *files = [manager subpathsAtPath:filePath];
        //        NSLog(@"files1111111%@ == %ld",files,files.count);
        //
        //        // 从路径中获得完整的文件名（带后缀）
        //        NSString *exe = [filePath lastPathComponent];
        //        NSLog(@"exeexe ====%@",exe);
        //
        //        // 获得文件名（不带后缀）
        //        exe = [exe stringByDeletingPathExtension];
        //
        //        // 获得文件名（不带后缀）
        //        NSString *exestr = [[files objectAtIndex:1] stringByDeletingPathExtension];
        //        NSLog(@"files2222222%@  ==== %@",[files objectAtIndex:1],exestr);
        
        
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    
    return 0;
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

//返回一个复文本
+(NSMutableAttributedString *)textArr:(NSMutableArray *)arr andColor:(UIColor *)color colorTextIndex:(NSInteger) index
{
    NSInteger length = arr.count;
    NSMutableString *str1 = [[NSMutableString alloc] initWithCapacity:100];
    NSMutableString *str2 = [[NSMutableString alloc] initWithCapacity:100];//用来定位到加颜色字符串之前的所有的字符串，用来定位
    NSInteger locate = 0;//用来记录哪个字符串需要加颜色
    NSInteger size = 0;
    for (NSInteger i = 0; i < length; i++) {
        [str1 appendString:arr[i]];
        if (i < index) {
            [str2 appendString:arr[i]];
        }
    }
    if (str2 != nil) {//如果不是指定第一个设置颜色
        locate = str2.length;
    }
    str2 = arr[index];
    size = str2.length;
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:str1];
    if (locate > 0) {//如果指定的不是第一个，就设置前面的颜色为黑色
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, locate)];
    }
    [str addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(locate, size)];
    if ((locate + size) < str1.length) {//如果设置的不是最后一个，就设置最后面的为黑色
        [str addAttribute:NSForegroundColorAttributeName value:[self colorWithRed:100 angGreen:100 andBlue:100] range:NSMakeRange(locate + size, str1.length - locate - size)];
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.maximumLineHeight = 60;  //最大的行高
    paragraphStyle.lineSpacing = 2;  //行自定义行高度
    [str addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    return str;
}

@end
