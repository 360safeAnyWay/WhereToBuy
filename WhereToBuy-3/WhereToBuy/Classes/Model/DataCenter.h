//
//  DataCenter.h
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-16.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserDao.h"

@interface DataCenter : NSObject
{
    NSDictionary *_infoDic;
}

@property (strong, nonatomic) UserDao *user;

+(instancetype) instance;

- (id) init;

- (NSString *) getStringForKey:(NSString *)key;

@end
