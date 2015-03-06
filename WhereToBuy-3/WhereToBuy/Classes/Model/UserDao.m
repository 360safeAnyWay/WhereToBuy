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
        _province = @"";
        _city = @"";
        _district = @"";
        _phoneNum = @"";
        _photo = @"";
        _senedTitles = 0;
        _callBackTimes = 0;
    }
    return self;
}

@end
