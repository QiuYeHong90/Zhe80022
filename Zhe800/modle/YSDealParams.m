//
//  YSDealParams.m
//
//  Created by mac  on 16/6/26
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "YSDealParams.h"


NSString *const kYSDealParamsShowSaleout = @"show_saleout";


@interface YSDealParams ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation YSDealParams

@synthesize showSaleout = _showSaleout;


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
            self.showSaleout = [[self objectOrNilForKey:kYSDealParamsShowSaleout fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.showSaleout] forKey:kYSDealParamsShowSaleout];

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

    self.showSaleout = [aDecoder decodeDoubleForKey:kYSDealParamsShowSaleout];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_showSaleout forKey:kYSDealParamsShowSaleout];
}

- (id)copyWithZone:(NSZone *)zone
{
    YSDealParams *copy = [[YSDealParams alloc] init];
    
    if (copy) {

        copy.showSaleout = self.showSaleout;
    }
    
    return copy;
}


@end
