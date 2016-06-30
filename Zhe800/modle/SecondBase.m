//
//  SecondBase.m
//
//  Created by mac  on 16/6/26
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SecondBase.h"


NSString *const kSecondBaseHomepromotionV3 = @"/homepromotion/v3";
NSString *const kSecondBaseV6BrandTop = @"/v6/brand/top";


@interface SecondBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SecondBase

@synthesize homepromotionV3 = _homepromotionV3;
@synthesize v6BrandTop = _v6BrandTop;


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
            self.homepromotionV3 = [self objectOrNilForKey:kSecondBaseHomepromotionV3 fromDictionary:dict];
            self.v6BrandTop = [self objectOrNilForKey:kSecondBaseV6BrandTop fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.homepromotionV3 forKey:kSecondBaseHomepromotionV3];
    [mutableDict setValue:self.v6BrandTop forKey:kSecondBaseV6BrandTop];

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

    self.homepromotionV3 = [aDecoder decodeObjectForKey:kSecondBaseHomepromotionV3];
    self.v6BrandTop = [aDecoder decodeObjectForKey:kSecondBaseV6BrandTop];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_homepromotionV3 forKey:kSecondBaseHomepromotionV3];
    [aCoder encodeObject:_v6BrandTop forKey:kSecondBaseV6BrandTop];
}

- (id)copyWithZone:(NSZone *)zone
{
    SecondBase *copy = [[SecondBase alloc] init];
    
    if (copy) {

        copy.homepromotionV3 = [self.homepromotionV3 copyWithZone:zone];
        copy.v6BrandTop = [self.v6BrandTop copyWithZone:zone];
    }
    
    return copy;
}


@end
