//
//  USERData.m
//
//  Created by   on 15/4/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "USERData.h"
#import "USERIntros.h"


NSString *const kUSERDataId = @"id";
NSString *const kUSERDataPhone = @"phone";
NSString *const kUSERDataIntros = @"intros";
NSString *const kUSERDataSex = @"sex";
NSString *const kUSERDataCityId = @"city_id";
NSString *const kUSERDataAddress = @"address";
NSString *const kUSERDataLevel = @"level";
NSString *const kUSERDataBirthday = @"birthday";
NSString *const kUSERDataUsername = @"username";
NSString *const kUSERDataRole = @"role";
NSString *const kUSERDataNickname = @"nickname";
NSString *const kUSERDataRoleId = @"role_id";
NSString *const kUSERDataPhoto = @"photo";


@interface USERData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation USERData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize phone = _phone;
@synthesize intros = _intros;
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
            self.dataIdentifier = [self objectOrNilForKey:kUSERDataId fromDictionary:dict];
            self.phone = [self objectOrNilForKey:kUSERDataPhone fromDictionary:dict];
    NSObject *receivedUSERIntros = [dict objectForKey:kUSERDataIntros];
    NSMutableArray *parsedUSERIntros = [NSMutableArray array];
    if ([receivedUSERIntros isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedUSERIntros) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedUSERIntros addObject:[USERIntros modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedUSERIntros isKindOfClass:[NSDictionary class]]) {
       [parsedUSERIntros addObject:[USERIntros modelObjectWithDictionary:(NSDictionary *)receivedUSERIntros]];
    }

    self.intros = [NSArray arrayWithArray:parsedUSERIntros];
            self.sex = [self objectOrNilForKey:kUSERDataSex fromDictionary:dict];
            self.cityId = [self objectOrNilForKey:kUSERDataCityId fromDictionary:dict];
            self.address = [self objectOrNilForKey:kUSERDataAddress fromDictionary:dict];
            self.level = [self objectOrNilForKey:kUSERDataLevel fromDictionary:dict];
            self.birthday = [self objectOrNilForKey:kUSERDataBirthday fromDictionary:dict];
            self.username = [self objectOrNilForKey:kUSERDataUsername fromDictionary:dict];
            self.role = [self objectOrNilForKey:kUSERDataRole fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kUSERDataNickname fromDictionary:dict];
            self.roleId = [self objectOrNilForKey:kUSERDataRoleId fromDictionary:dict];
            self.photo = [self objectOrNilForKey:kUSERDataPhoto fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kUSERDataId];
    [mutableDict setValue:self.phone forKey:kUSERDataPhone];
    NSMutableArray *tempArrayForIntros = [NSMutableArray array];
    for (NSObject *subArrayObject in self.intros) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForIntros addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForIntros addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForIntros] forKey:kUSERDataIntros];
    [mutableDict setValue:self.sex forKey:kUSERDataSex];
    [mutableDict setValue:self.cityId forKey:kUSERDataCityId];
    [mutableDict setValue:self.address forKey:kUSERDataAddress];
    [mutableDict setValue:self.level forKey:kUSERDataLevel];
    [mutableDict setValue:self.birthday forKey:kUSERDataBirthday];
    [mutableDict setValue:self.username forKey:kUSERDataUsername];
    [mutableDict setValue:self.role forKey:kUSERDataRole];
    [mutableDict setValue:self.nickname forKey:kUSERDataNickname];
    [mutableDict setValue:self.roleId forKey:kUSERDataRoleId];
    [mutableDict setValue:self.photo forKey:kUSERDataPhoto];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kUSERDataId];
    self.phone = [aDecoder decodeObjectForKey:kUSERDataPhone];
    self.intros = [aDecoder decodeObjectForKey:kUSERDataIntros];
    self.sex = [aDecoder decodeObjectForKey:kUSERDataSex];
    self.cityId = [aDecoder decodeObjectForKey:kUSERDataCityId];
    self.address = [aDecoder decodeObjectForKey:kUSERDataAddress];
    self.level = [aDecoder decodeObjectForKey:kUSERDataLevel];
    self.birthday = [aDecoder decodeObjectForKey:kUSERDataBirthday];
    self.username = [aDecoder decodeObjectForKey:kUSERDataUsername];
    self.role = [aDecoder decodeObjectForKey:kUSERDataRole];
    self.nickname = [aDecoder decodeObjectForKey:kUSERDataNickname];
    self.roleId = [aDecoder decodeObjectForKey:kUSERDataRoleId];
    self.photo = [aDecoder decodeObjectForKey:kUSERDataPhoto];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kUSERDataId];
    [aCoder encodeObject:_phone forKey:kUSERDataPhone];
    [aCoder encodeObject:_intros forKey:kUSERDataIntros];
    [aCoder encodeObject:_sex forKey:kUSERDataSex];
    [aCoder encodeObject:_cityId forKey:kUSERDataCityId];
    [aCoder encodeObject:_address forKey:kUSERDataAddress];
    [aCoder encodeObject:_level forKey:kUSERDataLevel];
    [aCoder encodeObject:_birthday forKey:kUSERDataBirthday];
    [aCoder encodeObject:_username forKey:kUSERDataUsername];
    [aCoder encodeObject:_role forKey:kUSERDataRole];
    [aCoder encodeObject:_nickname forKey:kUSERDataNickname];
    [aCoder encodeObject:_roleId forKey:kUSERDataRoleId];
    [aCoder encodeObject:_photo forKey:kUSERDataPhoto];
}

- (id)copyWithZone:(NSZone *)zone
{
    USERData *copy = [[USERData alloc] init];
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.phone = [self.phone copyWithZone:zone];
        copy.intros = [self.intros copyWithZone:zone];
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
