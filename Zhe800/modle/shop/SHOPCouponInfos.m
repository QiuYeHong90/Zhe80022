//
//  SHOPCouponInfos.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SHOPCouponInfos.h"


NSString *const kSHOPCouponInfosCouponWapUrl = @"coupon_wap_url";
NSString *const kSHOPCouponInfosCouponPrice = @"coupon_price";
NSString *const kSHOPCouponInfosLijianPrice = @"lijian_price";


@interface SHOPCouponInfos ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SHOPCouponInfos

@synthesize couponWapUrl = _couponWapUrl;
@synthesize couponPrice = _couponPrice;
@synthesize lijianPrice = _lijianPrice;


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
            self.couponWapUrl = [self objectOrNilForKey:kSHOPCouponInfosCouponWapUrl fromDictionary:dict];
            self.couponPrice = [[self objectOrNilForKey:kSHOPCouponInfosCouponPrice fromDictionary:dict] doubleValue];
            self.lijianPrice = [[self objectOrNilForKey:kSHOPCouponInfosLijianPrice fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.couponWapUrl forKey:kSHOPCouponInfosCouponWapUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.couponPrice] forKey:kSHOPCouponInfosCouponPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lijianPrice] forKey:kSHOPCouponInfosLijianPrice];

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

    self.couponWapUrl = [aDecoder decodeObjectForKey:kSHOPCouponInfosCouponWapUrl];
    self.couponPrice = [aDecoder decodeDoubleForKey:kSHOPCouponInfosCouponPrice];
    self.lijianPrice = [aDecoder decodeDoubleForKey:kSHOPCouponInfosLijianPrice];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_couponWapUrl forKey:kSHOPCouponInfosCouponWapUrl];
    [aCoder encodeDouble:_couponPrice forKey:kSHOPCouponInfosCouponPrice];
    [aCoder encodeDouble:_lijianPrice forKey:kSHOPCouponInfosLijianPrice];
}

- (id)copyWithZone:(NSZone *)zone
{
    SHOPCouponInfos *copy = [[SHOPCouponInfos alloc] init];
    
    if (copy) {

        copy.couponWapUrl = [self.couponWapUrl copyWithZone:zone];
        copy.couponPrice = self.couponPrice;
        copy.lijianPrice = self.lijianPrice;
    }
    
    return copy;
}


@end
