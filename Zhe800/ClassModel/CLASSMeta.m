//
//  CLASSMeta.m
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CLASSMeta.h"


NSString *const kCLASSMetaHasNext = @"has_next";


@interface CLASSMeta ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLASSMeta

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
            self.hasNext = [[self objectOrNilForKey:kCLASSMetaHasNext fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasNext] forKey:kCLASSMetaHasNext];

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

    self.hasNext = [aDecoder decodeBoolForKey:kCLASSMetaHasNext];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_hasNext forKey:kCLASSMetaHasNext];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLASSMeta *copy = [[CLASSMeta alloc] init];
    
    if (copy) {

        copy.hasNext = self.hasNext;
    }
    
    return copy;
}


@end
