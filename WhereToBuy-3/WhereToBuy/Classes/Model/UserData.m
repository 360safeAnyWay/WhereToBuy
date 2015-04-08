//
//  UserData.m
//
//  Created by   on 15/4/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "UserData.h"


NSString *const kUserDataId = @"id";
NSString *const kUserDataIntro = @"intro";
NSString *const kUserDataPhone = @"phone";
NSString *const kUserDataSex = @"sex";
NSString *const kUserDataCityId = @"city_id";
NSString *const kUserDataAddress = @"address";
NSString *const kUserDataLevel = @"level";
NSString *const kUserDataBirthday = @"birthday";
NSString *const kUserDataUsername = @"username";
NSString *const kUserDataRole = @"role";
NSString *const kUserDataNickname = @"nickname";
NSString *const kUserDataRoleId = @"role_id";
NSString *const kUserDataPhoto = @"photo";


@interface UserData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UserData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize intro = _intro;
@synthesize phone = _phone;
@synthesize sex = _sex;
@synthesize cityId = _cityId;
@synthesize address = _address;
@synthesize level = _level;
@synthesize birthday = _birthday;
@synthesize username = _username;
@synthesize role = _role;
@synthesize nickname = _nickname;
@synthesize roleId = _roleId;
@synthesize photo = _photo;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dataIdentifier = [self objectOrNilForKey:kUserDataId fromDictionary:dict];
            self.intro = [self objectOrNilForKey:kUserDataIntro fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kUserDataPhone fromDictionary:dict];
            self.sex = [self objectOrNilForKey:kUserDataSex fromDictionary:dict];
            self.cityId = [self objectOrNilForKey:kUserDataCityId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kUserDataAddress fromDictionary:dict];
            self.level = [self objectOrNilForKey:kUserDataLevel fromDictionary:dict];
            self.birthday = [self objectOrNilForKey:kUserDataBirthday fromDictionary:dict];
            self.username = [self objectOrNilForKey:kUserDataUsername fromDictionary:dict];
            self.role = [self objectOrNilForKey:kUserDataRole fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kUserDataNickname fromDictionary:dict];
            self.roleId = [self objectOrNilForKey:kUserDataRoleId fromDictionary:dict];
            self.photo = [self objectOrNilForKey:kUserDataPhoto fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kUserDataId];
    [mutableDict setValue:self.intro forKey:kUserDataIntro];
    [mutableDict setValue:self.phone forKey:kUserDataPhone];
    [mutableDict setValue:self.sex forKey:kUserDataSex];
    [mutableDict setValue:self.cityId forKey:kUserDataCityId];
    [mutableDict setValue:self.address forKey:kUserDataAddress];
    [mutableDict setValue:self.level forKey:kUserDataLevel];
    [mutableDict setValue:self.birthday forKey:kUserDataBirthday];
    [mutableDict setValue:self.username forKey:kUserDataUsername];
    [mutableDict setValue:self.role forKey:kUserDataRole];
    [mutableDict setValue:self.nickname forKey:kUserDataNickname];
    [mutableDict setValue:self.roleId forKey:kUserDataRoleId];
    [mutableDict setValue:self.photo forKey:kUserDataPhoto];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.dataIdentifier = [aDecoder decodeObjectForKey:kUserDataId];
    self.intro = [aDecoder decodeObjectForKey:kUserDataIntro];
    self.phone = [aDecoder decodeObjectForKey:kUserDataPhone];
    self.sex = [aDecoder decodeObjectForKey:kUserDataSex];
    self.cityId = [aDecoder decodeObjectForKey:kUserDataCityId];
    self.address = [aDecoder decodeObjectForKey:kUserDataAddress];
    self.level = [aDecoder decodeObjectForKey:kUserDataLevel];
    self.birthday = [aDecoder decodeObjectForKey:kUserDataBirthday];
    self.username = [aDecoder decodeObjectForKey:kUserDataUsername];
    self.role = [aDecoder decodeObjectForKey:kUserDataRole];
    self.nickname = [aDecoder decodeObjectForKey:kUserDataNickname];
    self.roleId = [aDecoder decodeObjectForKey:kUserDataRoleId];
    self.photo = [aDecoder decodeObjectForKey:kUserDataPhoto];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kUserDataId];
    [aCoder encodeObject:_intro forKey:kUserDataIntro];
    [aCoder encodeObject:_phone forKey:kUserDataPhone];
    [aCoder encodeObject:_sex forKey:kUserDataSex];
    [aCoder encodeObject:_cityId forKey:kUserDataCityId];
    [aCoder encodeObject:_address forKey:kUserDataAddress];
    [aCoder encodeObject:_level forKey:kUserDataLevel];
    [aCoder encodeObject:_birthday forKey:kUserDataBirthday];
    [aCoder encodeObject:_username forKey:kUserDataUsername];
    [aCoder encodeObject:_role forKey:kUserDataRole];
    [aCoder encodeObject:_nickname forKey:kUserDataNickname];
    [aCoder encodeObject:_roleId forKey:kUserDataRoleId];
    [aCoder encodeObject:_photo forKey:kUserDataPhoto];
}

- (id)copyWithZone:(NSZone *)zone
{
    UserData *copy = [[UserData alloc] init];
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        //copy.intro = [self.intro copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.sex = [self.sex copyWithZone:zone];
        copy.cityId = [self.cityId copyWithZone:zone];
        copy.address = [self.address copyWithZone:zone];
        copy.level = [self.level copyWithZone:zone];
        copy.birthday = [self.birthday copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
        copy.role = [self.role copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.roleId = [self.roleId copyWithZone:zone];
        copy.photo = [self.photo copyWithZone:zone];
    }
    
    return copy;
}


@end
