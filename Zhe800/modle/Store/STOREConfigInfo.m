//
//  STOREConfigInfo.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "STOREConfigInfo.h"


NSString *const kSTOREConfigInfoPicList = @"pic_list";
NSString *const kSTOREConfigInfoSecondSwitch = @"second_switch";
NSString *const kSTOREConfigInfoSecondAlign = @"second_align";
NSString *const kSTOREConfigInfoThirdColor = @"third_color";
NSString *const kSTOREConfigInfoFootText = @"foot_text";
NSString *const kSTOREConfigInfoThirdRightColor = @"third_right_color";
NSString *const kSTOREConfigInfoFirstColor = @"first_color";
NSString *const kSTOREConfigInfoBaoyouColor = @"baoyou_color";
NSString *const kSTOREConfigInfoThirdAlign = @"third_align";
NSString *const kSTOREConfigInfoThirdRightValue = @"third_right_value";
NSString *const kSTOREConfigInfoFirstAlign = @"first_align";
NSString *const kSTOREConfigInfoFootColor = @"foot_color";
NSString *const kSTOREConfigInfoPromotionColor = @"promotion_color";
NSString *const kSTOREConfigInfoIconGrid = @"icon_grid";
NSString *const kSTOREConfigInfoActivityText = @"activity_text";
NSString *const kSTOREConfigInfoActivityBgColor = @"activity_bg_color";
NSString *const kSTOREConfigInfoFirstSwitch = @"first_switch";
NSString *const kSTOREConfigInfoFootSwitch = @"foot_switch";
NSString *const kSTOREConfigInfoThirdLeftValue = @"third_left_value";
NSString *const kSTOREConfigInfoPromotionBgColor = @"promotion_bg_color";
NSString *const kSTOREConfigInfoValue = @"value";
NSString *const kSTOREConfigInfoActivityBorderColor = @"activity_border_color";
NSString *const kSTOREConfigInfoIconList = @"icon_list";
NSString *const kSTOREConfigInfoThirdSwitch = @"third_switch";
NSString *const kSTOREConfigInfoBaoyouText = @"baoyou_text";
NSString *const kSTOREConfigInfoFootAlign = @"foot_align";
NSString *const kSTOREConfigInfoPromotionBorderColor = @"promotion_border_color";
NSString *const kSTOREConfigInfoBrandYoupinBgColor = @"brand_youpin_bg_color";
NSString *const kSTOREConfigInfoThirdLeftType = @"third_left_type";
NSString *const kSTOREConfigInfoPromotionText = @"promotion_text";
NSString *const kSTOREConfigInfoThirdText = @"third_text";
NSString *const kSTOREConfigInfoBrandYoupinBorderColor = @"brand_youpin_border_color";
NSString *const kSTOREConfigInfoThirdRightSwitch = @"third_right_switch";
NSString *const kSTOREConfigInfoActivityColor = @"activity_color";
NSString *const kSTOREConfigInfoFirstText = @"first_text";
NSString *const kSTOREConfigInfoThirdLeftColor = @"third_left_color";
NSString *const kSTOREConfigInfoBrandYoupinText = @"brand_youpin_text";
NSString *const kSTOREConfigInfoBrandYoupinColor = @"brand_youpin_color";
NSString *const kSTOREConfigInfoPoint = @"point";
NSString *const kSTOREConfigInfoSecondText = @"second_text";
NSString *const kSTOREConfigInfoSecondColor = @"second_color";
NSString *const kSTOREConfigInfoPicGrid = @"pic_grid";
NSString *const kSTOREConfigInfoPicType = @"pic_type";
NSString *const kSTOREConfigInfoThirdLeftSwitch = @"third_left_switch";
NSString *const kSTOREConfigInfoFootBgColor = @"foot_bg_color";
NSString *const kSTOREConfigInfoFootType = @"foot_type";
NSString *const kSTOREConfigInfoThirdRightType = @"third_right_type";


@interface STOREConfigInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation STOREConfigInfo

@synthesize picList = _picList;
@synthesize secondSwitch = _secondSwitch;
@synthesize secondAlign = _secondAlign;
@synthesize thirdColor = _thirdColor;
@synthesize footText = _footText;
@synthesize thirdRightColor = _thirdRightColor;
@synthesize firstColor = _firstColor;
@synthesize baoyouColor = _baoyouColor;
@synthesize thirdAlign = _thirdAlign;
@synthesize thirdRightValue = _thirdRightValue;
@synthesize firstAlign = _firstAlign;
@synthesize footColor = _footColor;
@synthesize promotionColor = _promotionColor;
@synthesize iconGrid = _iconGrid;
@synthesize activityText = _activityText;
@synthesize activityBgColor = _activityBgColor;
@synthesize firstSwitch = _firstSwitch;
@synthesize footSwitch = _footSwitch;
@synthesize thirdLeftValue = _thirdLeftValue;
@synthesize promotionBgColor = _promotionBgColor;
@synthesize value = _value;
@synthesize activityBorderColor = _activityBorderColor;
@synthesize iconList = _iconList;
@synthesize thirdSwitch = _thirdSwitch;
@synthesize baoyouText = _baoyouText;
@synthesize footAlign = _footAlign;
@synthesize promotionBorderColor = _promotionBorderColor;
@synthesize brandYoupinBgColor = _brandYoupinBgColor;
@synthesize thirdLeftType = _thirdLeftType;
@synthesize promotionText = _promotionText;
@synthesize thirdText = _thirdText;
@synthesize brandYoupinBorderColor = _brandYoupinBorderColor;
@synthesize thirdRightSwitch = _thirdRightSwitch;
@synthesize activityColor = _activityColor;
@synthesize firstText = _firstText;
@synthesize thirdLeftColor = _thirdLeftColor;
@synthesize brandYoupinText = _brandYoupinText;
@synthesize brandYoupinColor = _brandYoupinColor;
@synthesize point = _point;
@synthesize secondText = _secondText;
@synthesize secondColor = _secondColor;
@synthesize picGrid = _picGrid;
@synthesize picType = _picType;
@synthesize thirdLeftSwitch = _thirdLeftSwitch;
@synthesize footBgColor = _footBgColor;
@synthesize footType = _footType;
@synthesize thirdRightType = _thirdRightType;


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
            self.picList = [self objectOrNilForKey:kSTOREConfigInfoPicList fromDictionary:dict];
            self.secondSwitch = [[self objectOrNilForKey:kSTOREConfigInfoSecondSwitch fromDictionary:dict] doubleValue];
            self.secondAlign = [[self objectOrNilForKey:kSTOREConfigInfoSecondAlign fromDictionary:dict] doubleValue];
            self.thirdColor = [self objectOrNilForKey:kSTOREConfigInfoThirdColor fromDictionary:dict];
            self.footText = [self objectOrNilForKey:kSTOREConfigInfoFootText fromDictionary:dict];
            self.thirdRightColor = [self objectOrNilForKey:kSTOREConfigInfoThirdRightColor fromDictionary:dict];
            self.firstColor = [self objectOrNilForKey:kSTOREConfigInfoFirstColor fromDictionary:dict];
            self.baoyouColor = [self objectOrNilForKey:kSTOREConfigInfoBaoyouColor fromDictionary:dict];
            self.thirdAlign = [[self objectOrNilForKey:kSTOREConfigInfoThirdAlign fromDictionary:dict] doubleValue];
            self.thirdRightValue = [self objectOrNilForKey:kSTOREConfigInfoThirdRightValue fromDictionary:dict];
            self.firstAlign = [[self objectOrNilForKey:kSTOREConfigInfoFirstAlign fromDictionary:dict] doubleValue];
            self.footColor = [self objectOrNilForKey:kSTOREConfigInfoFootColor fromDictionary:dict];
            self.promotionColor = [self objectOrNilForKey:kSTOREConfigInfoPromotionColor fromDictionary:dict];
            self.iconGrid = [self objectOrNilForKey:kSTOREConfigInfoIconGrid fromDictionary:dict];
            self.activityText = [self objectOrNilForKey:kSTOREConfigInfoActivityText fromDictionary:dict];
            self.activityBgColor = [self objectOrNilForKey:kSTOREConfigInfoActivityBgColor fromDictionary:dict];
            self.firstSwitch = [[self objectOrNilForKey:kSTOREConfigInfoFirstSwitch fromDictionary:dict] doubleValue];
            self.footSwitch = [[self objectOrNilForKey:kSTOREConfigInfoFootSwitch fromDictionary:dict] doubleValue];
            self.thirdLeftValue = [self objectOrNilForKey:kSTOREConfigInfoThirdLeftValue fromDictionary:dict];
            self.promotionBgColor = [self objectOrNilForKey:kSTOREConfigInfoPromotionBgColor fromDictionary:dict];
            self.value = [self objectOrNilForKey:kSTOREConfigInfoValue fromDictionary:dict];
            self.activityBorderColor = [self objectOrNilForKey:kSTOREConfigInfoActivityBorderColor fromDictionary:dict];
            self.iconList = [self objectOrNilForKey:kSTOREConfigInfoIconList fromDictionary:dict];
            self.thirdSwitch = [[self objectOrNilForKey:kSTOREConfigInfoThirdSwitch fromDictionary:dict] doubleValue];
            self.baoyouText = [self objectOrNilForKey:kSTOREConfigInfoBaoyouText fromDictionary:dict];
            self.footAlign = [[self objectOrNilForKey:kSTOREConfigInfoFootAlign fromDictionary:dict] doubleValue];
            self.promotionBorderColor = [self objectOrNilForKey:kSTOREConfigInfoPromotionBorderColor fromDictionary:dict];
            self.brandYoupinBgColor = [self objectOrNilForKey:kSTOREConfigInfoBrandYoupinBgColor fromDictionary:dict];
            self.thirdLeftType = [[self objectOrNilForKey:kSTOREConfigInfoThirdLeftType fromDictionary:dict] doubleValue];
            self.promotionText = [self objectOrNilForKey:kSTOREConfigInfoPromotionText fromDictionary:dict];
            self.thirdText = [self objectOrNilForKey:kSTOREConfigInfoThirdText fromDictionary:dict];
            self.brandYoupinBorderColor = [self objectOrNilForKey:kSTOREConfigInfoBrandYoupinBorderColor fromDictionary:dict];
            self.thirdRightSwitch = [[self objectOrNilForKey:kSTOREConfigInfoThirdRightSwitch fromDictionary:dict] doubleValue];
            self.activityColor = [self objectOrNilForKey:kSTOREConfigInfoActivityColor fromDictionary:dict];
            self.firstText = [self objectOrNilForKey:kSTOREConfigInfoFirstText fromDictionary:dict];
            self.thirdLeftColor = [self objectOrNilForKey:kSTOREConfigInfoThirdLeftColor fromDictionary:dict];
            self.brandYoupinText = [self objectOrNilForKey:kSTOREConfigInfoBrandYoupinText fromDictionary:dict];
            self.brandYoupinColor = [self objectOrNilForKey:kSTOREConfigInfoBrandYoupinColor fromDictionary:dict];
            self.point = [[self objectOrNilForKey:kSTOREConfigInfoPoint fromDictionary:dict] doubleValue];
            self.secondText = [self objectOrNilForKey:kSTOREConfigInfoSecondText fromDictionary:dict];
            self.secondColor = [self objectOrNilForKey:kSTOREConfigInfoSecondColor fromDictionary:dict];
            self.picGrid = [self objectOrNilForKey:kSTOREConfigInfoPicGrid fromDictionary:dict];
            self.picType = [[self objectOrNilForKey:kSTOREConfigInfoPicType fromDictionary:dict] doubleValue];
            self.thirdLeftSwitch = [[self objectOrNilForKey:kSTOREConfigInfoThirdLeftSwitch fromDictionary:dict] doubleValue];
            self.footBgColor = [self objectOrNilForKey:kSTOREConfigInfoFootBgColor fromDictionary:dict];
            self.footType = [[self objectOrNilForKey:kSTOREConfigInfoFootType fromDictionary:dict] doubleValue];
            self.thirdRightType = [[self objectOrNilForKey:kSTOREConfigInfoThirdRightType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.picList forKey:kSTOREConfigInfoPicList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.secondSwitch] forKey:kSTOREConfigInfoSecondSwitch];
    [mutableDict setValue:[NSNumber numberWithDouble:self.secondAlign] forKey:kSTOREConfigInfoSecondAlign];
    [mutableDict setValue:self.thirdColor forKey:kSTOREConfigInfoThirdColor];
    [mutableDict setValue:self.footText forKey:kSTOREConfigInfoFootText];
    [mutableDict setValue:self.thirdRightColor forKey:kSTOREConfigInfoThirdRightColor];
    [mutableDict setValue:self.firstColor forKey:kSTOREConfigInfoFirstColor];
    [mutableDict setValue:self.baoyouColor forKey:kSTOREConfigInfoBaoyouColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.thirdAlign] forKey:kSTOREConfigInfoThirdAlign];
    [mutableDict setValue:self.thirdRightValue forKey:kSTOREConfigInfoThirdRightValue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.firstAlign] forKey:kSTOREConfigInfoFirstAlign];
    [mutableDict setValue:self.footColor forKey:kSTOREConfigInfoFootColor];
    [mutableDict setValue:self.promotionColor forKey:kSTOREConfigInfoPromotionColor];
    [mutableDict setValue:self.iconGrid forKey:kSTOREConfigInfoIconGrid];
    [mutableDict setValue:self.activityText forKey:kSTOREConfigInfoActivityText];
    [mutableDict setValue:self.activityBgColor forKey:kSTOREConfigInfoActivityBgColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.firstSwitch] forKey:kSTOREConfigInfoFirstSwitch];
    [mutableDict setValue:[NSNumber numberWithDouble:self.footSwitch] forKey:kSTOREConfigInfoFootSwitch];
    [mutableDict setValue:self.thirdLeftValue forKey:kSTOREConfigInfoThirdLeftValue];
    [mutableDict setValue:self.promotionBgColor forKey:kSTOREConfigInfoPromotionBgColor];
    [mutableDict setValue:self.value forKey:kSTOREConfigInfoValue];
    [mutableDict setValue:self.activityBorderColor forKey:kSTOREConfigInfoActivityBorderColor];
    [mutableDict setValue:self.iconList forKey:kSTOREConfigInfoIconList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.thirdSwitch] forKey:kSTOREConfigInfoThirdSwitch];
    [mutableDict setValue:self.baoyouText forKey:kSTOREConfigInfoBaoyouText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.footAlign] forKey:kSTOREConfigInfoFootAlign];
    [mutableDict setValue:self.promotionBorderColor forKey:kSTOREConfigInfoPromotionBorderColor];
    [mutableDict setValue:self.brandYoupinBgColor forKey:kSTOREConfigInfoBrandYoupinBgColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.thirdLeftType] forKey:kSTOREConfigInfoThirdLeftType];
    [mutableDict setValue:self.promotionText forKey:kSTOREConfigInfoPromotionText];
    [mutableDict setValue:self.thirdText forKey:kSTOREConfigInfoThirdText];
    [mutableDict setValue:self.brandYoupinBorderColor forKey:kSTOREConfigInfoBrandYoupinBorderColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.thirdRightSwitch] forKey:kSTOREConfigInfoThirdRightSwitch];
    [mutableDict setValue:self.activityColor forKey:kSTOREConfigInfoActivityColor];
    [mutableDict setValue:self.firstText forKey:kSTOREConfigInfoFirstText];
    [mutableDict setValue:self.thirdLeftColor forKey:kSTOREConfigInfoThirdLeftColor];
    [mutableDict setValue:self.brandYoupinText forKey:kSTOREConfigInfoBrandYoupinText];
    [mutableDict setValue:self.brandYoupinColor forKey:kSTOREConfigInfoBrandYoupinColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.point] forKey:kSTOREConfigInfoPoint];
    [mutableDict setValue:self.secondText forKey:kSTOREConfigInfoSecondText];
    [mutableDict setValue:self.secondColor forKey:kSTOREConfigInfoSecondColor];
    [mutableDict setValue:self.picGrid forKey:kSTOREConfigInfoPicGrid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.picType] forKey:kSTOREConfigInfoPicType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.thirdLeftSwitch] forKey:kSTOREConfigInfoThirdLeftSwitch];
    [mutableDict setValue:self.footBgColor forKey:kSTOREConfigInfoFootBgColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.footType] forKey:kSTOREConfigInfoFootType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.thirdRightType] forKey:kSTOREConfigInfoThirdRightType];

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

    self.picList = [aDecoder decodeObjectForKey:kSTOREConfigInfoPicList];
    self.secondSwitch = [aDecoder decodeDoubleForKey:kSTOREConfigInfoSecondSwitch];
    self.secondAlign = [aDecoder decodeDoubleForKey:kSTOREConfigInfoSecondAlign];
    self.thirdColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoThirdColor];
    self.footText = [aDecoder decodeObjectForKey:kSTOREConfigInfoFootText];
    self.thirdRightColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoThirdRightColor];
    self.firstColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoFirstColor];
    self.baoyouColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoBaoyouColor];
    self.thirdAlign = [aDecoder decodeDoubleForKey:kSTOREConfigInfoThirdAlign];
    self.thirdRightValue = [aDecoder decodeObjectForKey:kSTOREConfigInfoThirdRightValue];
    self.firstAlign = [aDecoder decodeDoubleForKey:kSTOREConfigInfoFirstAlign];
    self.footColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoFootColor];
    self.promotionColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoPromotionColor];
    self.iconGrid = [aDecoder decodeObjectForKey:kSTOREConfigInfoIconGrid];
    self.activityText = [aDecoder decodeObjectForKey:kSTOREConfigInfoActivityText];
    self.activityBgColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoActivityBgColor];
    self.firstSwitch = [aDecoder decodeDoubleForKey:kSTOREConfigInfoFirstSwitch];
    self.footSwitch = [aDecoder decodeDoubleForKey:kSTOREConfigInfoFootSwitch];
    self.thirdLeftValue = [aDecoder decodeObjectForKey:kSTOREConfigInfoThirdLeftValue];
    self.promotionBgColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoPromotionBgColor];
    self.value = [aDecoder decodeObjectForKey:kSTOREConfigInfoValue];
    self.activityBorderColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoActivityBorderColor];
    self.iconList = [aDecoder decodeObjectForKey:kSTOREConfigInfoIconList];
    self.thirdSwitch = [aDecoder decodeDoubleForKey:kSTOREConfigInfoThirdSwitch];
    self.baoyouText = [aDecoder decodeObjectForKey:kSTOREConfigInfoBaoyouText];
    self.footAlign = [aDecoder decodeDoubleForKey:kSTOREConfigInfoFootAlign];
    self.promotionBorderColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoPromotionBorderColor];
    self.brandYoupinBgColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoBrandYoupinBgColor];
    self.thirdLeftType = [aDecoder decodeDoubleForKey:kSTOREConfigInfoThirdLeftType];
    self.promotionText = [aDecoder decodeObjectForKey:kSTOREConfigInfoPromotionText];
    self.thirdText = [aDecoder decodeObjectForKey:kSTOREConfigInfoThirdText];
    self.brandYoupinBorderColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoBrandYoupinBorderColor];
    self.thirdRightSwitch = [aDecoder decodeDoubleForKey:kSTOREConfigInfoThirdRightSwitch];
    self.activityColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoActivityColor];
    self.firstText = [aDecoder decodeObjectForKey:kSTOREConfigInfoFirstText];
    self.thirdLeftColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoThirdLeftColor];
    self.brandYoupinText = [aDecoder decodeObjectForKey:kSTOREConfigInfoBrandYoupinText];
    self.brandYoupinColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoBrandYoupinColor];
    self.point = [aDecoder decodeDoubleForKey:kSTOREConfigInfoPoint];
    self.secondText = [aDecoder decodeObjectForKey:kSTOREConfigInfoSecondText];
    self.secondColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoSecondColor];
    self.picGrid = [aDecoder decodeObjectForKey:kSTOREConfigInfoPicGrid];
    self.picType = [aDecoder decodeDoubleForKey:kSTOREConfigInfoPicType];
    self.thirdLeftSwitch = [aDecoder decodeDoubleForKey:kSTOREConfigInfoThirdLeftSwitch];
    self.footBgColor = [aDecoder decodeObjectForKey:kSTOREConfigInfoFootBgColor];
    self.footType = [aDecoder decodeDoubleForKey:kSTOREConfigInfoFootType];
    self.thirdRightType = [aDecoder decodeDoubleForKey:kSTOREConfigInfoThirdRightType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_picList forKey:kSTOREConfigInfoPicList];
    [aCoder encodeDouble:_secondSwitch forKey:kSTOREConfigInfoSecondSwitch];
    [aCoder encodeDouble:_secondAlign forKey:kSTOREConfigInfoSecondAlign];
    [aCoder encodeObject:_thirdColor forKey:kSTOREConfigInfoThirdColor];
    [aCoder encodeObject:_footText forKey:kSTOREConfigInfoFootText];
    [aCoder encodeObject:_thirdRightColor forKey:kSTOREConfigInfoThirdRightColor];
    [aCoder encodeObject:_firstColor forKey:kSTOREConfigInfoFirstColor];
    [aCoder encodeObject:_baoyouColor forKey:kSTOREConfigInfoBaoyouColor];
    [aCoder encodeDouble:_thirdAlign forKey:kSTOREConfigInfoThirdAlign];
    [aCoder encodeObject:_thirdRightValue forKey:kSTOREConfigInfoThirdRightValue];
    [aCoder encodeDouble:_firstAlign forKey:kSTOREConfigInfoFirstAlign];
    [aCoder encodeObject:_footColor forKey:kSTOREConfigInfoFootColor];
    [aCoder encodeObject:_promotionColor forKey:kSTOREConfigInfoPromotionColor];
    [aCoder encodeObject:_iconGrid forKey:kSTOREConfigInfoIconGrid];
    [aCoder encodeObject:_activityText forKey:kSTOREConfigInfoActivityText];
    [aCoder encodeObject:_activityBgColor forKey:kSTOREConfigInfoActivityBgColor];
    [aCoder encodeDouble:_firstSwitch forKey:kSTOREConfigInfoFirstSwitch];
    [aCoder encodeDouble:_footSwitch forKey:kSTOREConfigInfoFootSwitch];
    [aCoder encodeObject:_thirdLeftValue forKey:kSTOREConfigInfoThirdLeftValue];
    [aCoder encodeObject:_promotionBgColor forKey:kSTOREConfigInfoPromotionBgColor];
    [aCoder encodeObject:_value forKey:kSTOREConfigInfoValue];
    [aCoder encodeObject:_activityBorderColor forKey:kSTOREConfigInfoActivityBorderColor];
    [aCoder encodeObject:_iconList forKey:kSTOREConfigInfoIconList];
    [aCoder encodeDouble:_thirdSwitch forKey:kSTOREConfigInfoThirdSwitch];
    [aCoder encodeObject:_baoyouText forKey:kSTOREConfigInfoBaoyouText];
    [aCoder encodeDouble:_footAlign forKey:kSTOREConfigInfoFootAlign];
    [aCoder encodeObject:_promotionBorderColor forKey:kSTOREConfigInfoPromotionBorderColor];
    [aCoder encodeObject:_brandYoupinBgColor forKey:kSTOREConfigInfoBrandYoupinBgColor];
    [aCoder encodeDouble:_thirdLeftType forKey:kSTOREConfigInfoThirdLeftType];
    [aCoder encodeObject:_promotionText forKey:kSTOREConfigInfoPromotionText];
    [aCoder encodeObject:_thirdText forKey:kSTOREConfigInfoThirdText];
    [aCoder encodeObject:_brandYoupinBorderColor forKey:kSTOREConfigInfoBrandYoupinBorderColor];
    [aCoder encodeDouble:_thirdRightSwitch forKey:kSTOREConfigInfoThirdRightSwitch];
    [aCoder encodeObject:_activityColor forKey:kSTOREConfigInfoActivityColor];
    [aCoder encodeObject:_firstText forKey:kSTOREConfigInfoFirstText];
    [aCoder encodeObject:_thirdLeftColor forKey:kSTOREConfigInfoThirdLeftColor];
    [aCoder encodeObject:_brandYoupinText forKey:kSTOREConfigInfoBrandYoupinText];
    [aCoder encodeObject:_brandYoupinColor forKey:kSTOREConfigInfoBrandYoupinColor];
    [aCoder encodeDouble:_point forKey:kSTOREConfigInfoPoint];
    [aCoder encodeObject:_secondText forKey:kSTOREConfigInfoSecondText];
    [aCoder encodeObject:_secondColor forKey:kSTOREConfigInfoSecondColor];
    [aCoder encodeObject:_picGrid forKey:kSTOREConfigInfoPicGrid];
    [aCoder encodeDouble:_picType forKey:kSTOREConfigInfoPicType];
    [aCoder encodeDouble:_thirdLeftSwitch forKey:kSTOREConfigInfoThirdLeftSwitch];
    [aCoder encodeObject:_footBgColor forKey:kSTOREConfigInfoFootBgColor];
    [aCoder encodeDouble:_footType forKey:kSTOREConfigInfoFootType];
    [aCoder encodeDouble:_thirdRightType forKey:kSTOREConfigInfoThirdRightType];
}

- (id)copyWithZone:(NSZone *)zone
{
    STOREConfigInfo *copy = [[STOREConfigInfo alloc] init];
    
    if (copy) {

        copy.picList = [self.picList copyWithZone:zone];
        copy.secondSwitch = self.secondSwitch;
        copy.secondAlign = self.secondAlign;
        copy.thirdColor = [self.thirdColor copyWithZone:zone];
        copy.footText = [self.footText copyWithZone:zone];
        copy.thirdRightColor = [self.thirdRightColor copyWithZone:zone];
        copy.firstColor = [self.firstColor copyWithZone:zone];
        copy.baoyouColor = [self.baoyouColor copyWithZone:zone];
        copy.thirdAlign = self.thirdAlign;
        copy.thirdRightValue = [self.thirdRightValue copyWithZone:zone];
        copy.firstAlign = self.firstAlign;
        copy.footColor = [self.footColor copyWithZone:zone];
        copy.promotionColor = [self.promotionColor copyWithZone:zone];
        copy.iconGrid = [self.iconGrid copyWithZone:zone];
        copy.activityText = [self.activityText copyWithZone:zone];
        copy.activityBgColor = [self.activityBgColor copyWithZone:zone];
        copy.firstSwitch = self.firstSwitch;
        copy.footSwitch = self.footSwitch;
        copy.thirdLeftValue = [self.thirdLeftValue copyWithZone:zone];
        copy.promotionBgColor = [self.promotionBgColor copyWithZone:zone];
        copy.value = [self.value copyWithZone:zone];
        copy.activityBorderColor = [self.activityBorderColor copyWithZone:zone];
        copy.iconList = [self.iconList copyWithZone:zone];
        copy.thirdSwitch = self.thirdSwitch;
        copy.baoyouText = [self.baoyouText copyWithZone:zone];
        copy.footAlign = self.footAlign;
        copy.promotionBorderColor = [self.promotionBorderColor copyWithZone:zone];
        copy.brandYoupinBgColor = [self.brandYoupinBgColor copyWithZone:zone];
        copy.thirdLeftType = self.thirdLeftType;
        copy.promotionText = [self.promotionText copyWithZone:zone];
        copy.thirdText = [self.thirdText copyWithZone:zone];
        copy.brandYoupinBorderColor = [self.brandYoupinBorderColor copyWithZone:zone];
        copy.thirdRightSwitch = self.thirdRightSwitch;
        copy.activityColor = [self.activityColor copyWithZone:zone];
        copy.firstText = [self.firstText copyWithZone:zone];
        copy.thirdLeftColor = [self.thirdLeftColor copyWithZone:zone];
        copy.brandYoupinText = [self.brandYoupinText copyWithZone:zone];
        copy.brandYoupinColor = [self.brandYoupinColor copyWithZone:zone];
        copy.point = self.point;
        copy.secondText = [self.secondText copyWithZone:zone];
        copy.secondColor = [self.secondColor copyWithZone:zone];
        copy.picGrid = [self.picGrid copyWithZone:zone];
        copy.picType = self.picType;
        copy.thirdLeftSwitch = self.thirdLeftSwitch;
        copy.footBgColor = [self.footBgColor copyWithZone:zone];
        copy.footType = self.footType;
        copy.thirdRightType = self.thirdRightType;
    }
    
    return copy;
}


@end
