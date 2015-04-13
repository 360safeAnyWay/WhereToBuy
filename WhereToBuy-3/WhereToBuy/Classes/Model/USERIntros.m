//
//  USERIntros.m
//
//  Created by   on 15/4/8
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "USERIntros.h"


NSString *const kUSERIntrosType = @"type";
NSString *const kUSERIntrosIntro = @"intro";


@interface USERIntros ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation USERIntros

@synthesize type = _type;
@synthesize intro = _intro;


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
            self.type = [self objectOrNilForKey:kUSERIntrosType fromDictionary:dict];
            self.intro = [self objectOrNilForKey:kUSERIntrosIntro fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.type forKey:kUSERIntrosType];
    [mutableDict setValue:self.intro forKey:kUSERIntrosIntro];

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

    self.type = [aDecoder decodeObjectForKey:kUSERIntrosType];
    self.intro = [aDecoder decodeObjectForKey:kUSERIntrosIntro];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_type forKey:kUSERIntrosType];
    [aCoder encodeObject:_intro forKey:kUSERIntrosIntro];
}

- (id)copyWithZone:(NSZone *)zone
{
    USERIntros *copy = [[USERIntros alloc] init];
    
    if (copy) {

        copy.type = [self.type copyWithZone:zone];
        copy.intro = [self.intro copyWithZone:zone];
    }
    
    return copy;
}


@end
