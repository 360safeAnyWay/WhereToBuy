//
//  UserData.h
//
//  Created by   on 15/4/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface UserData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, assign) id intro;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *cityId;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *level;
@property (nonatomic, strong) NSString *birthday;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *role;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *roleId;
@property (nonatomic, strong) NSString *photo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
