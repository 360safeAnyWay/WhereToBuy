//
//  UserDao.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-16.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDao : NSObject

@property (strong, nonatomic) NSString *userName;//用户姓名
@property (strong, nonatomic) NSString *gender;//姓名
@property (strong, nonatomic) NSString *birthday;
@property (strong, nonatomic) NSString *realName;//真实姓名
@property (strong, nonatomic) NSString *province;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *district;
@property (strong, nonatomic) NSString *phoneNum;
@property (strong, nonatomic) NSString *photo;
@property (assign, nonatomic) NSInteger senedTitles;//已发表话题次数
@property (assign, nonatomic) NSInteger callBackTimes;//已回复话题次数

@end
