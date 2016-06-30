//
//  STOREImageUrl.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "STOREImageUrl.h"


NSString *const kSTOREImageUrlSi3 = @"si3";


@interface STOREImageUrl ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation STOREImageUrl

@synthesize si3 = _si3;


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
            self.si3 = [self objectOrNilForKey:kSTOREImageUrlSi3 fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.si3 forKey:kSTOREImageUrlSi3];

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

    self.si3 = [aDecoder decodeObjectForKey:kSTOREImageUrlSi3];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_si3 forKey:kSTOREImageUrlSi3];
}

- (id)copyWithZone:(NSZone *)zone
{
    STOREImageUrl *copy = [[STOREImageUrl alloc] init];
    
    if (copy) {

        copy.si3 = [self.si3 copyWithZone:zone];
    }
    
    return copy;
}


@end
