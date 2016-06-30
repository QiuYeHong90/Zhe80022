//
//  STORECouponInfos.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "STORECouponInfos.h"


NSString *const kSTORECouponInfosLijianPrice = @"lijian_price";
NSString *const kSTORECouponInfosCouponPrice = @"coupon_price";
NSString *const kSTORECouponInfosCouponWapUrl = @"coupon_wap_url";


@interface STORECouponInfos ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation STORECouponInfos

@synthesize lijianPrice = _lijianPrice;
@synthesize couponPrice = _couponPrice;
@synthesize couponWapUrl = _couponWapUrl;


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
            self.lijianPrice = [[self objectOrNilForKey:kSTORECouponInfosLijianPrice fromDictionary:dict] doubleValue];
            self.couponPrice = [[self objectOrNilForKey:kSTORECouponInfosCouponPrice fromDictionary:dict] doubleValue];
            self.couponWapUrl = [self objectOrNilForKey:kSTORECouponInfosCouponWapUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lijianPrice] forKey:kSTORECouponInfosLijianPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.couponPrice] forKey:kSTORECouponInfosCouponPrice];
    [mutableDict setValue:self.couponWapUrl forKey:kSTORECouponInfosCouponWapUrl];

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

    self.lijianPrice = [aDecoder decodeDoubleForKey:kSTORECouponInfosLijianPrice];
    self.couponPrice = [aDecoder decodeDoubleForKey:kSTORECouponInfosCouponPrice];
    self.couponWapUrl = [aDecoder decodeObjectForKey:kSTORECouponInfosCouponWapUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_lijianPrice forKey:kSTORECouponInfosLijianPrice];
    [aCoder encodeDouble:_couponPrice forKey:kSTORECouponInfosCouponPrice];
    [aCoder encodeObject:_couponWapUrl forKey:kSTORECouponInfosCouponWapUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    STORECouponInfos *copy = [[STORECouponInfos alloc] init];
    
    if (copy) {

        copy.lijianPrice = self.lijianPrice;
        copy.couponPrice = self.couponPrice;
        copy.couponWapUrl = [self.couponWapUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
