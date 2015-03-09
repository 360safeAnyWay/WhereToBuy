//
//  DBAccess.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-21.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "DBAccess.h"

#define DOCUMENTPATH       NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]

//数据库文件地址
#define DBPATH [NSString stringWithFormat:@"%@/WhereToBuy.sqilte",DOCUMENTPATH]

@implementation DBAccess

//打开数据库
+ (void)openDB
{
    NSString *dbPath = [[NSBundle mainBundle] pathForResource:@"WhereToBuy" ofType:@"sqlite"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:DBPATH]) {
        [[NSFileManager defaultManager] copyItemAtPath:dbPath toPath:DBPATH error:nil];
    }
    if (sqlite3_open([DBPATH UTF8String], &database) == SQLITE_OK) {
    }else
    {
        NSLog(@"打开数据库失败");
    }
}

//关闭数据库
+ (void)closeDB
{
    if (sqlite3_close(database) == SQLITE_OK) {
        
    }else
    {
        NSLog(@"关闭数据库失败");
    }
}

//查询数据
+ (NSMutableArray *)getDataFromDBWithSql:(const char *) sql
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    sqlite3_stmt *statement;
    NSInteger result = sqlite3_prepare(database, sql, -1, &statement, NULL);
    if (result == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *city = (char *)sqlite3_column_text(statement, 0);
            [arr addObject:[NSString stringWithUTF8String:city]];
        }
        sqlite3_finalize(statement);
    }
    return arr;
}

//清空表中的数据
+ (void) cleanDBWithSql:(const char *)sql
{
    NSInteger result = sqlite3_exec(database, sql, NULL, NULL, nil);
    if (result == SQLITE_OK) {
        
    }else
    {
        NSLog(@"删除失败");
    }
}

//插入数据
+ (void) insertDBWithSql:(const char *)sql
{
    char *errmsg;
    NSInteger result = sqlite3_exec(database, sql, NULL, NULL, &errmsg);
    if (result == SQLITE_OK) {
        
    }else
    {
        NSLog(@"插入数据失败");
    }
}

@end
