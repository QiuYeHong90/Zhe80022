//
//  STOREMeta.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "STOREMeta.h"


NSString *const kSTOREMetaCount = @"count";
NSString *const kSTOREMetaHasNext = @"has_next";


@interface STOREMeta ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation STOREMeta

@synthesize count = _count;
@synthesize hasNext = _hasNext;


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
            self.count = [[self objectOrNilForKey:kSTOREMetaCount fromDictionary:dict] doubleValue];
            self.hasNext = [[self objectOrNilForKey:kSTOREMetaHasNext fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kSTOREMetaCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasNext] forKey:kSTOREMetaHasNext];

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

    self.count = [aDecoder decodeDoubleForKey:kSTOREMetaCount];
    self.hasNext = [aDecoder decodeBoolForKey:kSTOREMetaHasNext];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_count forKey:kSTOREMetaCount];
    [aCoder encodeBool:_hasNext forKey:kSTOREMetaHasNext];
}

- (id)copyWithZone:(NSZone *)zone
{
    STOREMeta *copy = [[STOREMeta alloc] init];
    
    if (copy) {

        copy.count = self.count;
        copy.hasNext = self.hasNext;
    }
    
    return copy;
}


@end
