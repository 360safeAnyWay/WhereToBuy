//
//  DataCenter.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-16.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "DataCenter.h"

static DataCenter *data = nil;

@implementation DataCenter

+(instancetype)instance{
    if (!data) {
        data = [[self alloc] init];
    }
    return data;
}

- (id) init
{
    if (self = [super init]) {
        _infoDic = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"WhereToBuyInfo" ofType:@"plist"]];
    }
    return self;
}

- (NSString *)getStringForKey:(NSString *)key
{
    return _infoDic[key];
}

@end
