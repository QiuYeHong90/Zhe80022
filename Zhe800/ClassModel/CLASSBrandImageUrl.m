//
//  CLASSBrandImageUrl.m
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CLASSBrandImageUrl.h"


NSString *const kCLASSBrandImageUrlBig = @"big";
NSString *const kCLASSBrandImageUrlSmall = @"small";
NSString *const kCLASSBrandImageUrlNormal = @"normal";


@interface CLASSBrandImageUrl ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLASSBrandImageUrl

@synthesize big = _big;
@synthesize small = _small;
@synthesize normal = _normal;


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
            self.big = [self objectOrNilForKey:kCLASSBrandImageUrlBig fromDictionary:dict];
            self.small = [self objectOrNilForKey:kCLASSBrandImageUrlSmall fromDictionary:dict];
            self.normal = [self objectOrNilForKey:kCLASSBrandImageUrlNormal fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.big forKey:kCLASSBrandImageUrlBig];
    [mutableDict setValue:self.small forKey:kCLASSBrandImageUrlSmall];
    [mutableDict setValue:self.normal forKey:kCLASSBrandImageUrlNormal];

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

    self.big = [aDecoder decodeObjectForKey:kCLASSBrandImageUrlBig];
    self.small = [aDecoder decodeObjectForKey:kCLASSBrandImageUrlSmall];
    self.normal = [aDecoder decodeObjectForKey:kCLASSBrandImageUrlNormal];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_big forKey:kCLASSBrandImageUrlBig];
    [aCoder encodeObject:_small forKey:kCLASSBrandImageUrlSmall];
    [aCoder encodeObject:_normal forKey:kCLASSBrandImageUrlNormal];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLASSBrandImageUrl *copy = [[CLASSBrandImageUrl alloc] init];
    
    if (copy) {

        copy.big = [self.big copyWithZone:zone];
        copy.small = [self.small copyWithZone:zone];
        copy.normal = [self.normal copyWithZone:zone];
    }
    
    return copy;
}


@end
