//
//  SHOPConfigInfo.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SHOPConfigInfo.h"


NSString *const kSHOPConfigInfoThirdRightType = @"third_right_type";
NSString *const kSHOPConfigInfoSecondSwitch = @"second_switch";
NSString *const kSHOPConfigInfoSecondAlign = @"second_align";
NSString *const kSHOPConfigInfoThirdColor = @"third_color";
NSString *const kSHOPConfigInfoFootText = @"foot_text";
NSString *const kSHOPConfigInfoThirdRightColor = @"third_right_color";
NSString *const kSHOPConfigInfoFirstColor = @"first_color";
NSString *const kSHOPConfigInfoBaoyouColor = @"baoyou_color";
NSString *const kSHOPConfigInfoThirdAlign = @"third_align";
NSString *const kSHOPConfigInfoThirdRightValue = @"third_right_value";
NSString *const kSHOPConfigInfoFirstAlign = @"first_align";
NSString *const kSHOPConfigInfoFootColor = @"foot_color";
NSString *const kSHOPConfigInfoPromotionColor = @"promotion_color";
NSString *const kSHOPConfigInfoIconGrid = @"icon_grid";
NSString *const kSHOPConfigInfoActivityText = @"activity_text";
NSString *const kSHOPConfigInfoActivityBgColor = @"activity_bg_color";
NSString *const kSHOPConfigInfoFirstSwitch = @"first_switch";
NSString *const kSHOPConfigInfoFootSwitch = @"foot_switch";
NSString *const kSHOPConfigInfoThirdLeftValue = @"third_left_value";
NSString *const kSHOPConfigInfoPromotionBgColor = @"promotion_bg_color";
NSString *const kSHOPConfigInfoValue = @"value";
NSString *const kSHOPConfigInfoActivityBorderColor = @"activity_border_color";
NSString *const kSHOPConfigInfoIconList = @"icon_list";
NSString *const kSHOPConfigInfoThirdSwitch = @"third_switch";
NSString *const kSHOPConfigInfoBaoyouText = @"baoyou_text";
NSString *const kSHOPConfigInfoFootAlign = @"foot_align";
NSString *const kSHOPConfigInfoPromotionBorderColor = @"promotion_border_color";
NSString *const kSHOPConfigInfoBrandYoupinBgColor = @"brand_youpin_bg_color";
NSString *const kSHOPConfigInfoThirdLeftType = @"third_left_type";
NSString *const kSHOPConfigInfoPromotionText = @"promotion_text";
NSString *const kSHOPConfigInfoThirdText = @"third_text";
NSString *const kSHOPConfigInfoBrandYoupinBorderColor = @"brand_youpin_border_color";
NSString *const kSHOPConfigInfoThirdRightSwitch = @"third_right_switch";
NSString *const kSHOPConfigInfoActivityColor = @"activity_color";
NSString *const kSHOPConfigInfoFirstText = @"first_text";
NSString *const kSHOPConfigInfoThirdLeftColor = @"third_left_color";
NSString *const kSHOPConfigInfoBrandYoupinText = @"brand_youpin_text";
NSString *const kSHOPConfigInfoBrandYoupinColor = @"brand_youpin_color";
NSString *const kSHOPConfigInfoPoint = @"point";
NSString *const kSHOPConfigInfoSecondText = @"second_text";
NSString *const kSHOPConfigInfoSecondColor = @"second_color";
NSString *const kSHOPConfigInfoPicGrid = @"pic_grid";
NSString *const kSHOPConfigInfoPicType = @"pic_type";
NSString *const kSHOPConfigInfoThirdLeftSwitch = @"third_left_switch";
NSString *const kSHOPConfigInfoPicList = @"pic_list";
NSString *const kSHOPConfigInfoFootBgColor = @"foot_bg_color";
NSString *const kSHOPConfigInfoFootType = @"foot_type";


@interface SHOPConfigInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SHOPConfigInfo

@synthesize thirdRightType = _thirdRightType;
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
@synthesize picList = _picList;
@synthesize footBgColor = _footBgColor;
@synthesize footType = _footType;


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
            self.thirdRightType = [[self objectOrNilForKey:kSHOPConfigInfoThirdRightType fromDictionary:dict] doubleValue];
            self.secondSwitch = [[self objectOrNilForKey:kSHOPConfigInfoSecondSwitch fromDictionary:dict] doubleValue];
            self.secondAlign = [[self objectOrNilForKey:kSHOPConfigInfoSecondAlign fromDictionary:dict] doubleValue];
            self.thirdColor = [self objectOrNilForKey:kSHOPConfigInfoThirdColor fromDictionary:dict];
            self.footText = [self objectOrNilForKey:kSHOPConfigInfoFootText fromDictionary:dict];
            self.thirdRightColor = [self objectOrNilForKey:kSHOPConfigInfoThirdRightColor fromDictionary:dict];
            self.firstColor = [self objectOrNilForKey:kSHOPConfigInfoFirstColor fromDictionary:dict];
            self.baoyouColor = [self objectOrNilForKey:kSHOPConfigInfoBaoyouColor fromDictionary:dict];
            self.thirdAlign = [[self objectOrNilForKey:kSHOPConfigInfoThirdAlign fromDictionary:dict] doubleValue];
            self.thirdRightValue = [self objectOrNilForKey:kSHOPConfigInfoThirdRightValue fromDictionary:dict];
            self.firstAlign = [[self objectOrNilForKey:kSHOPConfigInfoFirstAlign fromDictionary:dict] doubleValue];
            self.footColor = [self objectOrNilForKey:kSHOPConfigInfoFootColor fromDictionary:dict];
            self.promotionColor = [self objectOrNilForKey:kSHOPConfigInfoPromotionColor fromDictionary:dict];
            self.iconGrid = [self objectOrNilForKey:kSHOPConfigInfoIconGrid fromDictionary:dict];
            self.activityText = [self objectOrNilForKey:kSHOPConfigInfoActivityText fromDictionary:dict];
            self.activityBgColor = [self objectOrNilForKey:kSHOPConfigInfoActivityBgColor fromDictionary:dict];
            self.firstSwitch = [[self objectOrNilForKey:kSHOPConfigInfoFirstSwitch fromDictionary:dict] doubleValue];
            self.footSwitch = [[self objectOrNilForKey:kSHOPConfigInfoFootSwitch fromDictionary:dict] doubleValue];
            self.thirdLeftValue = [self objectOrNilForKey:kSHOPConfigInfoThirdLeftValue fromDictionary:dict];
            self.promotionBgColor = [self objectOrNilForKey:kSHOPConfigInfoPromotionBgColor fromDictionary:dict];
            self.value = [self objectOrNilForKey:kSHOPConfigInfoValue fromDictionary:dict];
            self.activityBorderColor = [self objectOrNilForKey:kSHOPConfigInfoActivityBorderColor fromDictionary:dict];
            self.iconList = [self objectOrNilForKey:kSHOPConfigInfoIconList fromDictionary:dict];
            self.thirdSwitch = [[self objectOrNilForKey:kSHOPConfigInfoThirdSwitch fromDictionary:dict] doubleValue];
            self.baoyouText = [self objectOrNilForKey:kSHOPConfigInfoBaoyouText fromDictionary:dict];
            self.footAlign = [[self objectOrNilForKey:kSHOPConfigInfoFootAlign fromDictionary:dict] doubleValue];
            self.promotionBorderColor = [self objectOrNilForKey:kSHOPConfigInfoPromotionBorderColor fromDictionary:dict];
            self.brandYoupinBgColor = [self objectOrNilForKey:kSHOPConfigInfoBrandYoupinBgColor fromDictionary:dict];
            self.thirdLeftType = [[self objectOrNilForKey:kSHOPConfigInfoThirdLeftType fromDictionary:dict] doubleValue];
            self.promotionText = [self objectOrNilForKey:kSHOPConfigInfoPromotionText fromDictionary:dict];
            self.thirdText = [self objectOrNilForKey:kSHOPConfigInfoThirdText fromDictionary:dict];
            self.brandYoupinBorderColor = [self objectOrNilForKey:kSHOPConfigInfoBrandYoupinBorderColor fromDictionary:dict];
            self.thirdRightSwitch = [[self objectOrNilForKey:kSHOPConfigInfoThirdRightSwitch fromDictionary:dict] doubleValue];
            self.activityColor = [self objectOrNilForKey:kSHOPConfigInfoActivityColor fromDictionary:dict];
            self.firstText = [self objectOrNilForKey:kSHOPConfigInfoFirstText fromDictionary:dict];
            self.thirdLeftColor = [self objectOrNilForKey:kSHOPConfigInfoThirdLeftColor fromDictionary:dict];
            self.brandYoupinText = [self objectOrNilForKey:kSHOPConfigInfoBrandYoupinText fromDictionary:dict];
            self.brandYoupinColor = [self objectOrNilForKey:kSHOPConfigInfoBrandYoupinColor fromDictionary:dict];
            self.point = [[self objectOrNilForKey:kSHOPConfigInfoPoint fromDictionary:dict] doubleValue];
            self.secondText = [self objectOrNilForKey:kSHOPConfigInfoSecondText fromDictionary:dict];
            self.secondColor = [self objectOrNilForKey:kSHOPConfigInfoSecondColor fromDictionary:dict];
            self.picGrid = [self objectOrNilForKey:kSHOPConfigInfoPicGrid fromDictionary:dict];
            self.picType = [[self objectOrNilForKey:kSHOPConfigInfoPicType fromDictionary:dict] doubleValue];
            self.thirdLeftSwitch = [[self objectOrNilForKey:kSHOPConfigInfoThirdLeftSwitch fromDictionary:dict] doubleValue];
            self.picList = [self objectOrNilForKey:kSHOPConfigInfoPicList fromDictionary:dict];
            self.footBgColor = [self objectOrNilForKey:kSHOPConfigInfoFootBgColor fromDictionary:dict];
            self.footType = [[self objectOrNilForKey:kSHOPConfigInfoFootType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.thirdRightType] forKey:kSHOPConfigInfoThirdRightType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.secondSwitch] forKey:kSHOPConfigInfoSecondSwitch];
    [mutableDict setValue:[NSNumber numberWithDouble:self.secondAlign] forKey:kSHOPConfigInfoSecondAlign];
    [mutableDict setValue:self.thirdColor forKey:kSHOPConfigInfoThirdColor];
    [mutableDict setValue:self.footText forKey:kSHOPConfigInfoFootText];
    [mutableDict setValue:self.thirdRightColor forKey:kSHOPConfigInfoThirdRightColor];
    [mutableDict setValue:self.firstColor forKey:kSHOPConfigInfoFirstColor];
    [mutableDict setValue:self.baoyouColor forKey:kSHOPConfigInfoBaoyouColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.thirdAlign] forKey:kSHOPConfigInfoThirdAlign];
    [mutableDict setValue:self.thirdRightValue forKey:kSHOPConfigInfoThirdRightValue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.firstAlign] forKey:kSHOPConfigInfoFirstAlign];
    [mutableDict setValue:self.footColor forKey:kSHOPConfigInfoFootColor];
    [mutableDict setValue:self.promotionColor forKey:kSHOPConfigInfoPromotionColor];
    [mutableDict setValue:self.iconGrid forKey:kSHOPConfigInfoIconGrid];
    [mutableDict setValue:self.activityText forKey:kSHOPConfigInfoActivityText];
    [mutableDict setValue:self.activityBgColor forKey:kSHOPConfigInfoActivityBgColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.firstSwitch] forKey:kSHOPConfigInfoFirstSwitch];
    [mutableDict setValue:[NSNumber numberWithDouble:self.footSwitch] forKey:kSHOPConfigInfoFootSwitch];
    [mutableDict setValue:self.thirdLeftValue forKey:kSHOPConfigInfoThirdLeftValue];
    [mutableDict setValue:self.promotionBgColor forKey:kSHOPConfigInfoPromotionBgColor];
    [mutableDict setValue:self.value forKey:kSHOPConfigInfoValue];
    [mutableDict setValue:self.activityBorderColor forKey:kSHOPConfigInfoActivityBorderColor];
    [mutableDict setValue:self.iconList forKey:kSHOPConfigInfoIconList];
    [mutableDict setValue:[NSNumber numberWithDouble:self.thirdSwitch] forKey:kSHOPConfigInfoThirdSwitch];
    [mutableDict setValue:self.baoyouText forKey:kSHOPConfigInfoBaoyouText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.footAlign] forKey:kSHOPConfigInfoFootAlign];
    [mutableDict setValue:self.promotionBorderColor forKey:kSHOPConfigInfoPromotionBorderColor];
    [mutableDict setValue:self.brandYoupinBgColor forKey:kSHOPConfigInfoBrandYoupinBgColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.thirdLeftType] forKey:kSHOPConfigInfoThirdLeftType];
    [mutableDict setValue:self.promotionText forKey:kSHOPConfigInfoPromotionText];
    [mutableDict setValue:self.thirdText forKey:kSHOPConfigInfoThirdText];
    [mutableDict setValue:self.brandYoupinBorderColor forKey:kSHOPConfigInfoBrandYoupinBorderColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.thirdRightSwitch] forKey:kSHOPConfigInfoThirdRightSwitch];
    [mutableDict setValue:self.activityColor forKey:kSHOPConfigInfoActivityColor];
    [mutableDict setValue:self.firstText forKey:kSHOPConfigInfoFirstText];
    [mutableDict setValue:self.thirdLeftColor forKey:kSHOPConfigInfoThirdLeftColor];
    [mutableDict setValue:self.brandYoupinText forKey:kSHOPConfigInfoBrandYoupinText];
    [mutableDict setValue:self.brandYoupinColor forKey:kSHOPConfigInfoBrandYoupinColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.point] forKey:kSHOPConfigInfoPoint];
    [mutableDict setValue:self.secondText forKey:kSHOPConfigInfoSecondText];
    [mutableDict setValue:self.secondColor forKey:kSHOPConfigInfoSecondColor];
    [mutableDict setValue:self.picGrid forKey:kSHOPConfigInfoPicGrid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.picType] forKey:kSHOPConfigInfoPicType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.thirdLeftSwitch] forKey:kSHOPConfigInfoThirdLeftSwitch];
    [mutableDict setValue:self.picList forKey:kSHOPConfigInfoPicList];
    [mutableDict setValue:self.footBgColor forKey:kSHOPConfigInfoFootBgColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.footType] forKey:kSHOPConfigInfoFootType];

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

    self.thirdRightType = [aDecoder decodeDoubleForKey:kSHOPConfigInfoThirdRightType];
    self.secondSwitch = [aDecoder decodeDoubleForKey:kSHOPConfigInfoSecondSwitch];
    self.secondAlign = [aDecoder decodeDoubleForKey:kSHOPConfigInfoSecondAlign];
    self.thirdColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoThirdColor];
    self.footText = [aDecoder decodeObjectForKey:kSHOPConfigInfoFootText];
    self.thirdRightColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoThirdRightColor];
    self.firstColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoFirstColor];
    self.baoyouColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoBaoyouColor];
    self.thirdAlign = [aDecoder decodeDoubleForKey:kSHOPConfigInfoThirdAlign];
    self.thirdRightValue = [aDecoder decodeObjectForKey:kSHOPConfigInfoThirdRightValue];
    self.firstAlign = [aDecoder decodeDoubleForKey:kSHOPConfigInfoFirstAlign];
    self.footColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoFootColor];
    self.promotionColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoPromotionColor];
    self.iconGrid = [aDecoder decodeObjectForKey:kSHOPConfigInfoIconGrid];
    self.activityText = [aDecoder decodeObjectForKey:kSHOPConfigInfoActivityText];
    self.activityBgColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoActivityBgColor];
    self.firstSwitch = [aDecoder decodeDoubleForKey:kSHOPConfigInfoFirstSwitch];
    self.footSwitch = [aDecoder decodeDoubleForKey:kSHOPConfigInfoFootSwitch];
    self.thirdLeftValue = [aDecoder decodeObjectForKey:kSHOPConfigInfoThirdLeftValue];
    self.promotionBgColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoPromotionBgColor];
    self.value = [aDecoder decodeObjectForKey:kSHOPConfigInfoValue];
    self.activityBorderColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoActivityBorderColor];
    self.iconList = [aDecoder decodeObjectForKey:kSHOPConfigInfoIconList];
    self.thirdSwitch = [aDecoder decodeDoubleForKey:kSHOPConfigInfoThirdSwitch];
    self.baoyouText = [aDecoder decodeObjectForKey:kSHOPConfigInfoBaoyouText];
    self.footAlign = [aDecoder decodeDoubleForKey:kSHOPConfigInfoFootAlign];
    self.promotionBorderColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoPromotionBorderColor];
    self.brandYoupinBgColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoBrandYoupinBgColor];
    self.thirdLeftType = [aDecoder decodeDoubleForKey:kSHOPConfigInfoThirdLeftType];
    self.promotionText = [aDecoder decodeObjectForKey:kSHOPConfigInfoPromotionText];
    self.thirdText = [aDecoder decodeObjectForKey:kSHOPConfigInfoThirdText];
    self.brandYoupinBorderColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoBrandYoupinBorderColor];
    self.thirdRightSwitch = [aDecoder decodeDoubleForKey:kSHOPConfigInfoThirdRightSwitch];
    self.activityColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoActivityColor];
    self.firstText = [aDecoder decodeObjectForKey:kSHOPConfigInfoFirstText];
    self.thirdLeftColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoThirdLeftColor];
    self.brandYoupinText = [aDecoder decodeObjectForKey:kSHOPConfigInfoBrandYoupinText];
    self.brandYoupinColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoBrandYoupinColor];
    self.point = [aDecoder decodeDoubleForKey:kSHOPConfigInfoPoint];
    self.secondText = [aDecoder decodeObjectForKey:kSHOPConfigInfoSecondText];
    self.secondColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoSecondColor];
    self.picGrid = [aDecoder decodeObjectForKey:kSHOPConfigInfoPicGrid];
    self.picType = [aDecoder decodeDoubleForKey:kSHOPConfigInfoPicType];
    self.thirdLeftSwitch = [aDecoder decodeDoubleForKey:kSHOPConfigInfoThirdLeftSwitch];
    self.picList = [aDecoder decodeObjectForKey:kSHOPConfigInfoPicList];
    self.footBgColor = [aDecoder decodeObjectForKey:kSHOPConfigInfoFootBgColor];
    self.footType = [aDecoder decodeDoubleForKey:kSHOPConfigInfoFootType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_thirdRightType forKey:kSHOPConfigInfoThirdRightType];
    [aCoder encodeDouble:_secondSwitch forKey:kSHOPConfigInfoSecondSwitch];
    [aCoder encodeDouble:_secondAlign forKey:kSHOPConfigInfoSecondAlign];
    [aCoder encodeObject:_thirdColor forKey:kSHOPConfigInfoThirdColor];
    [aCoder encodeObject:_footText forKey:kSHOPConfigInfoFootText];
    [aCoder encodeObject:_thirdRightColor forKey:kSHOPConfigInfoThirdRightColor];
    [aCoder encodeObject:_firstColor forKey:kSHOPConfigInfoFirstColor];
    [aCoder encodeObject:_baoyouColor forKey:kSHOPConfigInfoBaoyouColor];
    [aCoder encodeDouble:_thirdAlign forKey:kSHOPConfigInfoThirdAlign];
    [aCoder encodeObject:_thirdRightValue forKey:kSHOPConfigInfoThirdRightValue];
    [aCoder encodeDouble:_firstAlign forKey:kSHOPConfigInfoFirstAlign];
    [aCoder encodeObject:_footColor forKey:kSHOPConfigInfoFootColor];
    [aCoder encodeObject:_promotionColor forKey:kSHOPConfigInfoPromotionColor];
    [aCoder encodeObject:_iconGrid forKey:kSHOPConfigInfoIconGrid];
    [aCoder encodeObject:_activityText forKey:kSHOPConfigInfoActivityText];
    [aCoder encodeObject:_activityBgColor forKey:kSHOPConfigInfoActivityBgColor];
    [aCoder encodeDouble:_firstSwitch forKey:kSHOPConfigInfoFirstSwitch];
    [aCoder encodeDouble:_footSwitch forKey:kSHOPConfigInfoFootSwitch];
    [aCoder encodeObject:_thirdLeftValue forKey:kSHOPConfigInfoThirdLeftValue];
    [aCoder encodeObject:_promotionBgColor forKey:kSHOPConfigInfoPromotionBgColor];
    [aCoder encodeObject:_value forKey:kSHOPConfigInfoValue];
    [aCoder encodeObject:_activityBorderColor forKey:kSHOPConfigInfoActivityBorderColor];
    [aCoder encodeObject:_iconList forKey:kSHOPConfigInfoIconList];
    [aCoder encodeDouble:_thirdSwitch forKey:kSHOPConfigInfoThirdSwitch];
    [aCoder encodeObject:_baoyouText forKey:kSHOPConfigInfoBaoyouText];
    [aCoder encodeDouble:_footAlign forKey:kSHOPConfigInfoFootAlign];
    [aCoder encodeObject:_promotionBorderColor forKey:kSHOPConfigInfoPromotionBorderColor];
    [aCoder encodeObject:_brandYoupinBgColor forKey:kSHOPConfigInfoBrandYoupinBgColor];
    [aCoder encodeDouble:_thirdLeftType forKey:kSHOPConfigInfoThirdLeftType];
    [aCoder encodeObject:_promotionText forKey:kSHOPConfigInfoPromotionText];
    [aCoder encodeObject:_thirdText forKey:kSHOPConfigInfoThirdText];
    [aCoder encodeObject:_brandYoupinBorderColor forKey:kSHOPConfigInfoBrandYoupinBorderColor];
    [aCoder encodeDouble:_thirdRightSwitch forKey:kSHOPConfigInfoThirdRightSwitch];
    [aCoder encodeObject:_activityColor forKey:kSHOPConfigInfoActivityColor];
    [aCoder encodeObject:_firstText forKey:kSHOPConfigInfoFirstText];
    [aCoder encodeObject:_thirdLeftColor forKey:kSHOPConfigInfoThirdLeftColor];
    [aCoder encodeObject:_brandYoupinText forKey:kSHOPConfigInfoBrandYoupinText];
    [aCoder encodeObject:_brandYoupinColor forKey:kSHOPConfigInfoBrandYoupinColor];
    [aCoder encodeDouble:_point forKey:kSHOPConfigInfoPoint];
    [aCoder encodeObject:_secondText forKey:kSHOPConfigInfoSecondText];
    [aCoder encodeObject:_secondColor forKey:kSHOPConfigInfoSecondColor];
    [aCoder encodeObject:_picGrid forKey:kSHOPConfigInfoPicGrid];
    [aCoder encodeDouble:_picType forKey:kSHOPConfigInfoPicType];
    [aCoder encodeDouble:_thirdLeftSwitch forKey:kSHOPConfigInfoThirdLeftSwitch];
    [aCoder encodeObject:_picList forKey:kSHOPConfigInfoPicList];
    [aCoder encodeObject:_footBgColor forKey:kSHOPConfigInfoFootBgColor];
    [aCoder encodeDouble:_footType forKey:kSHOPConfigInfoFootType];
}

- (id)copyWithZone:(NSZone *)zone
{
    SHOPConfigInfo *copy = [[SHOPConfigInfo alloc] init];
    
    if (copy) {

        copy.thirdRightType = self.thirdRightType;
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
        copy.picList = [self.picList copyWithZone:zone];
        copy.footBgColor = [self.footBgColor copyWithZone:zone];
        copy.footType = self.footType;
    }
    
    return copy;
}


@end
