//
//  USERUSERDataBase.m
//
//  Created by   on 15/4/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "USERUSERDataBase.h"
#import "USERData.h"


NSString *const kUSERUSERDataBaseStatus = @"status";
NSString *const kUSERUSERDataBaseMessage = @"message";
NSString *const kUSERUSERDataBaseData = @"data";


@interface USERUSERDataBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation USERUSERDataBase

@synthesize status = _status;
@synthesize message = _message;
@synthesize data = _data;


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
            self.status = [[self objectOrNilForKey:kUSERUSERDataBaseStatus fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kUSERUSERDataBaseMessage fromDictionary:dict];
            self.data = [USERData modelObjectWithDictionary:[dict objectForKey:kUSERUSERDataBaseData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kUSERUSERDataBaseStatus];
    [mutableDict setValue:self.message forKey:kUSERUSERDataBaseMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kUSERUSERDataBaseData];

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

    self.status = [aDecoder decodeDoubleForKey:kUSERUSERDataBaseStatus];
    self.message = [aDecoder decodeObjectForKey:kUSERUSERDataBaseMessage];
    self.data = [aDecoder decodeObjectForKey:kUSERUSERDataBaseData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kUSERUSERDataBaseStatus];
    [aCoder encodeObject:_message forKey:kUSERUSERDataBaseMessage];
    [aCoder encodeObject:_data forKey:kUSERUSERDataBaseData];
}

- (id)copyWithZone:(NSZone *)zone
{
    USERUSERDataBase *copy = [[USERUSERDataBase alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
