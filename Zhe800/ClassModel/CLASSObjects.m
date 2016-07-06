//
//  CLASSObjects.m
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CLASSObjects.h"
#import "CLASSBrandImageUrl.h"


NSString *const kCLASSObjectsBrandImageUrl = @"brand_image_url";
NSString *const kCLASSObjectsId = @"id";
NSString *const kCLASSObjectsDiscountType = @"discount_type";
NSString *const kCLASSObjectsDiscount = @"discount";
NSString *const kCLASSObjectsBrandLibraryId = @"brand_library_id";
NSString *const kCLASSObjectsBeginTime = @"begin_time";
NSString *const kCLASSObjectsLowPrice = @"low_price";
NSString *const kCLASSObjectsSpecialName = @"special_name";
NSString *const kCLASSObjectsTitle = @"title";
NSString *const kCLASSObjectsLogoImage = @"logo_image";
NSString *const kCLASSObjectsSquareImage = @"square_image";
NSString *const kCLASSObjectsToday = @"today";
NSString *const kCLASSObjectsDealCounts = @"deal_counts";
NSString *const kCLASSObjectsBrandSalesCount = @"brand_sales_count";
NSString *const kCLASSObjectsEndTime = @"end_time";
NSString *const kCLASSObjectsBrandUrlName = @"brand_url_name";
NSString *const kCLASSObjectsName = @"name";
NSString *const kCLASSObjectsDiscountRule = @"discount_rule";


@interface CLASSObjects ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLASSObjects

@synthesize brandImageUrl = _brandImageUrl;
@synthesize objectsIdentifier = _objectsIdentifier;
@synthesize discountType = _discountType;
@synthesize discount = _discount;
@synthesize brandLibraryId = _brandLibraryId;
@synthesize beginTime = _beginTime;
@synthesize lowPrice = _lowPrice;
@synthesize specialName = _specialName;
@synthesize title = _title;
@synthesize logoImage = _logoImage;
@synthesize squareImage = _squareImage;
@synthesize today = _today;
@synthesize dealCounts = _dealCounts;
@synthesize brandSalesCount = _brandSalesCount;
@synthesize endTime = _endTime;
@synthesize brandUrlName = _brandUrlName;
@synthesize name = _name;
@synthesize discountRule = _discountRule;


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
            self.brandImageUrl = [CLASSBrandImageUrl modelObjectWithDictionary:[dict objectForKey:kCLASSObjectsBrandImageUrl]];
            self.objectsIdentifier = [[self objectOrNilForKey:kCLASSObjectsId fromDictionary:dict] doubleValue];
            self.discountType = [self objectOrNilForKey:kCLASSObjectsDiscountType fromDictionary:dict];
            self.discount = [self objectOrNilForKey:kCLASSObjectsDiscount fromDictionary:dict];
            self.brandLibraryId = [[self objectOrNilForKey:kCLASSObjectsBrandLibraryId fromDictionary:dict] doubleValue];
            self.beginTime = [self objectOrNilForKey:kCLASSObjectsBeginTime fromDictionary:dict];
            self.lowPrice = [[self objectOrNilForKey:kCLASSObjectsLowPrice fromDictionary:dict] doubleValue];
            self.specialName = [self objectOrNilForKey:kCLASSObjectsSpecialName fromDictionary:dict];
            self.title = [self objectOrNilForKey:kCLASSObjectsTitle fromDictionary:dict];
            self.logoImage = [self objectOrNilForKey:kCLASSObjectsLogoImage fromDictionary:dict];
            self.squareImage = [self objectOrNilForKey:kCLASSObjectsSquareImage fromDictionary:dict];
            self.today = [[self objectOrNilForKey:kCLASSObjectsToday fromDictionary:dict] doubleValue];
            self.dealCounts = [[self objectOrNilForKey:kCLASSObjectsDealCounts fromDictionary:dict] doubleValue];
            self.brandSalesCount = [[self objectOrNilForKey:kCLASSObjectsBrandSalesCount fromDictionary:dict] doubleValue];
            self.endTime = [self objectOrNilForKey:kCLASSObjectsEndTime fromDictionary:dict];
            self.brandUrlName = [self objectOrNilForKey:kCLASSObjectsBrandUrlName fromDictionary:dict];
            self.name = [self objectOrNilForKey:kCLASSObjectsName fromDictionary:dict];
            self.discountRule = [self objectOrNilForKey:kCLASSObjectsDiscountRule fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.brandImageUrl dictionaryRepresentation] forKey:kCLASSObjectsBrandImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.objectsIdentifier] forKey:kCLASSObjectsId];
    NSMutableArray *tempArrayForDiscountType = [NSMutableArray array];
    for (NSObject *subArrayObject in self.discountType) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDiscountType addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDiscountType addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDiscountType] forKey:kCLASSObjectsDiscountType];
    [mutableDict setValue:self.discount forKey:kCLASSObjectsDiscount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandLibraryId] forKey:kCLASSObjectsBrandLibraryId];
    [mutableDict setValue:self.beginTime forKey:kCLASSObjectsBeginTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lowPrice] forKey:kCLASSObjectsLowPrice];
    [mutableDict setValue:self.specialName forKey:kCLASSObjectsSpecialName];
    [mutableDict setValue:self.title forKey:kCLASSObjectsTitle];
    [mutableDict setValue:self.logoImage forKey:kCLASSObjectsLogoImage];
    [mutableDict setValue:self.squareImage forKey:kCLASSObjectsSquareImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.today] forKey:kCLASSObjectsToday];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dealCounts] forKey:kCLASSObjectsDealCounts];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandSalesCount] forKey:kCLASSObjectsBrandSalesCount];
    [mutableDict setValue:self.endTime forKey:kCLASSObjectsEndTime];
    [mutableDict setValue:self.brandUrlName forKey:kCLASSObjectsBrandUrlName];
    [mutableDict setValue:self.name forKey:kCLASSObjectsName];
    NSMutableArray *tempArrayForDiscountRule = [NSMutableArray array];
    for (NSObject *subArrayObject in self.discountRule) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDiscountRule addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDiscountRule addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDiscountRule] forKey:kCLASSObjectsDiscountRule];

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

    self.brandImageUrl = [aDecoder decodeObjectForKey:kCLASSObjectsBrandImageUrl];
    self.objectsIdentifier = [aDecoder decodeDoubleForKey:kCLASSObjectsId];
    self.discountType = [aDecoder decodeObjectForKey:kCLASSObjectsDiscountType];
    self.discount = [aDecoder decodeObjectForKey:kCLASSObjectsDiscount];
    self.brandLibraryId = [aDecoder decodeDoubleForKey:kCLASSObjectsBrandLibraryId];
    self.beginTime = [aDecoder decodeObjectForKey:kCLASSObjectsBeginTime];
    self.lowPrice = [aDecoder decodeDoubleForKey:kCLASSObjectsLowPrice];
    self.specialName = [aDecoder decodeObjectForKey:kCLASSObjectsSpecialName];
    self.title = [aDecoder decodeObjectForKey:kCLASSObjectsTitle];
    self.logoImage = [aDecoder decodeObjectForKey:kCLASSObjectsLogoImage];
    self.squareImage = [aDecoder decodeObjectForKey:kCLASSObjectsSquareImage];
    self.today = [aDecoder decodeDoubleForKey:kCLASSObjectsToday];
    self.dealCounts = [aDecoder decodeDoubleForKey:kCLASSObjectsDealCounts];
    self.brandSalesCount = [aDecoder decodeDoubleForKey:kCLASSObjectsBrandSalesCount];
    self.endTime = [aDecoder decodeObjectForKey:kCLASSObjectsEndTime];
    self.brandUrlName = [aDecoder decodeObjectForKey:kCLASSObjectsBrandUrlName];
    self.name = [aDecoder decodeObjectForKey:kCLASSObjectsName];
    self.discountRule = [aDecoder decodeObjectForKey:kCLASSObjectsDiscountRule];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_brandImageUrl forKey:kCLASSObjectsBrandImageUrl];
    [aCoder encodeDouble:_objectsIdentifier forKey:kCLASSObjectsId];
    [aCoder encodeObject:_discountType forKey:kCLASSObjectsDiscountType];
    [aCoder encodeObject:_discount forKey:kCLASSObjectsDiscount];
    [aCoder encodeDouble:_brandLibraryId forKey:kCLASSObjectsBrandLibraryId];
    [aCoder encodeObject:_beginTime forKey:kCLASSObjectsBeginTime];
    [aCoder encodeDouble:_lowPrice forKey:kCLASSObjectsLowPrice];
    [aCoder encodeObject:_specialName forKey:kCLASSObjectsSpecialName];
    [aCoder encodeObject:_title forKey:kCLASSObjectsTitle];
    [aCoder encodeObject:_logoImage forKey:kCLASSObjectsLogoImage];
    [aCoder encodeObject:_squareImage forKey:kCLASSObjectsSquareImage];
    [aCoder encodeDouble:_today forKey:kCLASSObjectsToday];
    [aCoder encodeDouble:_dealCounts forKey:kCLASSObjectsDealCounts];
    [aCoder encodeDouble:_brandSalesCount forKey:kCLASSObjectsBrandSalesCount];
    [aCoder encodeObject:_endTime forKey:kCLASSObjectsEndTime];
    [aCoder encodeObject:_brandUrlName forKey:kCLASSObjectsBrandUrlName];
    [aCoder encodeObject:_name forKey:kCLASSObjectsName];
    [aCoder encodeObject:_discountRule forKey:kCLASSObjectsDiscountRule];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLASSObjects *copy = [[CLASSObjects alloc] init];
    
    if (copy) {

        copy.brandImageUrl = [self.brandImageUrl copyWithZone:zone];
        copy.objectsIdentifier = self.objectsIdentifier;
        copy.discountType = [self.discountType copyWithZone:zone];
        copy.discount = [self.discount copyWithZone:zone];
        copy.brandLibraryId = self.brandLibraryId;
        copy.beginTime = [self.beginTime copyWithZone:zone];
        copy.lowPrice = self.lowPrice;
        copy.specialName = [self.specialName copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.logoImage = [self.logoImage copyWithZone:zone];
        copy.squareImage = [self.squareImage copyWithZone:zone];
        copy.today = self.today;
        copy.dealCounts = self.dealCounts;
        copy.brandSalesCount = self.brandSalesCount;
        copy.endTime = [self.endTime copyWithZone:zone];
        copy.brandUrlName = [self.brandUrlName copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.discountRule = [self.discountRule copyWithZone:zone];
    }
    
    return copy;
}


@end
