//
//  UserDao.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-16.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "UserDao.h"

@implementation UserDao

- (id) init
{
    if (self = [super init]) {
        _userName = @"";//用户姓名
        _gender = @"";//姓名
        _birthday = @"";
        _realName = @"";//真实姓名
        _phoneNum = @"";
        _photo = @"";
        _expertLevel = 0;
        _senedTitles = 0;
        _callBackTimes = 0;
        _introduce = @"";
    }
    return self;
}

@end
