//
//  UserBaseClass.m
//
//  Created by   on 15/4/7
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "UserBaseClass.h"
#import "UserData.h"


NSString *const kUserBaseClassStatus = @"status";
NSString *const kUserBaseClassMessage = @"message";
NSString *const kUserBaseClassData = @"data";


@interface UserBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UserBaseClass

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
            self.status = [[self objectOrNilForKey:kUserBaseClassStatus fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kUserBaseClassMessage fromDictionary:dict];
            self.data = [UserData modelObjectWithDictionary:[dict objectForKey:kUserBaseClassData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kUserBaseClassStatus];
    [mutableDict setValue:self.message forKey:kUserBaseClassMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kUserBaseClassData];

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

    self.status = [aDecoder decodeDoubleForKey:kUserBaseClassStatus];
    self.message = [aDecoder decodeObjectForKey:kUserBaseClassMessage];
    self.data = [aDecoder decodeObjectForKey:kUserBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_status forKey:kUserBaseClassStatus];
    [aCoder encodeObject:_message forKey:kUserBaseClassMessage];
    [aCoder encodeObject:_data forKey:kUserBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    UserBaseClass *copy = [[UserBaseClass alloc] init];
    
    if (copy) {

        copy.status = self.status;
        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
