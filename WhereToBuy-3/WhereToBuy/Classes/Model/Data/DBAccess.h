//
//  DBAccess.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-21.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

sqlite3 *database;

@interface DBAccess : NSObject

//打开数据库
+ (void)openDB;

//关闭数据库
+ (void)closeDB;

//查询数据
+ (NSMutableArray *)getDataFromDBWithSql:(const char *) sql;

//清空表中的数据
+ (void) cleanDBWithSql:(const char *)sql;

//插入数据
+ (void) insertDBWithSql:(const char *)sql;

@end
