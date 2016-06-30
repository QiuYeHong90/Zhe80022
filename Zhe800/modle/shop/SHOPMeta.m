//
//  SHOPMeta.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SHOPMeta.h"


NSString *const kSHOPMetaCount = @"count";
NSString *const kSHOPMetaHasNext = @"has_next";


@interface SHOPMeta ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SHOPMeta

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
            self.count = [[self objectOrNilForKey:kSHOPMetaCount fromDictionary:dict] doubleValue];
            self.hasNext = [[self objectOrNilForKey:kSHOPMetaHasNext fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kSHOPMetaCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasNext] forKey:kSHOPMetaHasNext];

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

    self.count = [aDecoder decodeDoubleForKey:kSHOPMetaCount];
    self.hasNext = [aDecoder decodeBoolForKey:kSHOPMetaHasNext];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_count forKey:kSHOPMetaCount];
    [aCoder encodeBool:_hasNext forKey:kSHOPMetaHasNext];
}

- (id)copyWithZone:(NSZone *)zone
{
    SHOPMeta *copy = [[SHOPMeta alloc] init];
    
    if (copy) {

        copy.count = self.count;
        copy.hasNext = self.hasNext;
    }
    
    return copy;
}


@end