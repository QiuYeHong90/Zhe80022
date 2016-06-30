//
//  YSBase.m
//
//  Created by mac  on 16/6/26
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "YSBase.h"
#import "YSDealParams.h"


NSString *const kYSBaseDealUrl = @"deal_url";
NSString *const kYSBaseImagePluginUrl = @"image_plugin_url";
NSString *const kYSBaseImageCategoryIosUrl = @"image_category_ios_url";
NSString *const kYSBaseTitle = @"title";
NSString *const kYSBaseParentUrlName = @"parent_url_name";
NSString *const kYSBaseCategoryName = @"category_name";
NSString *const kYSBaseImageYoupinhuiUrl = @"image_youpinhui_url";
NSString *const kYSBaseImageLittleAndroidUrl = @"image_little_android_url";
NSString *const kYSBaseChildTopics = @"child_topics";
NSString *const kYSBaseIsPlugin = @"is_plugin";
NSString *const kYSBaseBannerType = @"banner_type";
NSString *const kYSBaseDealParams = @"deal_params";
NSString *const kYSBaseImageLargestAndroidUrl = @"image_largest_android_url";
NSString *const kYSBaseShowModel = @"show_model";
NSString *const kYSBaseImageMiddleIosUrl = @"image_middle_ios_url";
NSString *const kYSBaseImageBigAndroidUrl = @"image_big_android_url";
NSString *const kYSBaseId = @"id";
NSString *const kYSBaseImageLargestIosUrl = @"image_largest_ios_url";
NSString *const kYSBaseImageRegistrationAndroidUrl = @"image_registration_android_url";
NSString *const kYSBaseValue = @"value";
NSString *const kYSBaseWapUrl = @"wap_url";
NSString *const kYSBaseDetail = @"detail";
NSString *const kYSBaseImageCategoryAndroidUrl = @"image_category_android_url";
NSString *const kYSBaseImageRegistrationIosUrl = @"image_registration_ios_url";
NSString *const kYSBaseImageMiddleAndroidUrl = @"image_middle_android_url";
NSString *const kYSBaseImageLittleIosUrl = @"image_little_ios_url";
NSString *const kYSBaseImageBigIosUrl = @"image_big_ios_url";


@interface YSBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation YSBase

@synthesize dealUrl = _dealUrl;
@synthesize imagePluginUrl = _imagePluginUrl;
@synthesize imageCategoryIosUrl = _imageCategoryIosUrl;
@synthesize title = _title;
@synthesize parentUrlName = _parentUrlName;
@synthesize categoryName = _categoryName;
@synthesize imageYoupinhuiUrl = _imageYoupinhuiUrl;
@synthesize imageLittleAndroidUrl = _imageLittleAndroidUrl;
@synthesize childTopics = _childTopics;
@synthesize isPlugin = _isPlugin;
@synthesize bannerType = _bannerType;
@synthesize dealParams = _dealParams;
@synthesize imageLargestAndroidUrl = _imageLargestAndroidUrl;
@synthesize showModel = _showModel;
@synthesize imageMiddleIosUrl = _imageMiddleIosUrl;
@synthesize imageBigAndroidUrl = _imageBigAndroidUrl;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize imageLargestIosUrl = _imageLargestIosUrl;
@synthesize imageRegistrationAndroidUrl = _imageRegistrationAndroidUrl;
@synthesize value = _value;
@synthesize wapUrl = _wapUrl;
@synthesize detail = _detail;
@synthesize imageCategoryAndroidUrl = _imageCategoryAndroidUrl;
@synthesize imageRegistrationIosUrl = _imageRegistrationIosUrl;
@synthesize imageMiddleAndroidUrl = _imageMiddleAndroidUrl;
@synthesize imageLittleIosUrl = _imageLittleIosUrl;
@synthesize imageBigIosUrl = _imageBigIosUrl;


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
            self.dealUrl = [self objectOrNilForKey:kYSBaseDealUrl fromDictionary:dict];
            self.imagePluginUrl = [self objectOrNilForKey:kYSBaseImagePluginUrl fromDictionary:dict];
            self.imageCategoryIosUrl = [self objectOrNilForKey:kYSBaseImageCategoryIosUrl fromDictionary:dict];
            self.title = [self objectOrNilForKey:kYSBaseTitle fromDictionary:dict];
            self.parentUrlName = [self objectOrNilForKey:kYSBaseParentUrlName fromDictionary:dict];
            self.categoryName = [self objectOrNilForKey:kYSBaseCategoryName fromDictionary:dict];
            self.imageYoupinhuiUrl = [self objectOrNilForKey:kYSBaseImageYoupinhuiUrl fromDictionary:dict];
            self.imageLittleAndroidUrl = [self objectOrNilForKey:kYSBaseImageLittleAndroidUrl fromDictionary:dict];
            self.childTopics = [self objectOrNilForKey:kYSBaseChildTopics fromDictionary:dict];
            self.isPlugin = [[self objectOrNilForKey:kYSBaseIsPlugin fromDictionary:dict] doubleValue];
            self.bannerType = [[self objectOrNilForKey:kYSBaseBannerType fromDictionary:dict] doubleValue];
            self.dealParams = [YSDealParams modelObjectWithDictionary:[dict objectForKey:kYSBaseDealParams]];
            self.imageLargestAndroidUrl = [self objectOrNilForKey:kYSBaseImageLargestAndroidUrl fromDictionary:dict];
            self.showModel = [[self objectOrNilForKey:kYSBaseShowModel fromDictionary:dict] doubleValue];
            self.imageMiddleIosUrl = [self objectOrNilForKey:kYSBaseImageMiddleIosUrl fromDictionary:dict];
            self.imageBigAndroidUrl = [self objectOrNilForKey:kYSBaseImageBigAndroidUrl fromDictionary:dict];
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:kYSBaseId fromDictionary:dict] doubleValue];
            self.imageLargestIosUrl = [self objectOrNilForKey:kYSBaseImageLargestIosUrl fromDictionary:dict];
            self.imageRegistrationAndroidUrl = [self objectOrNilForKey:kYSBaseImageRegistrationAndroidUrl fromDictionary:dict];
            self.value = [self objectOrNilForKey:kYSBaseValue fromDictionary:dict];
            self.wapUrl = [self objectOrNilForKey:kYSBaseWapUrl fromDictionary:dict];
            self.detail = [self objectOrNilForKey:kYSBaseDetail fromDictionary:dict];
            self.imageCategoryAndroidUrl = [self objectOrNilForKey:kYSBaseImageCategoryAndroidUrl fromDictionary:dict];
            self.imageRegistrationIosUrl = [self objectOrNilForKey:kYSBaseImageRegistrationIosUrl fromDictionary:dict];
            self.imageMiddleAndroidUrl = [self objectOrNilForKey:kYSBaseImageMiddleAndroidUrl fromDictionary:dict];
            self.imageLittleIosUrl = [self objectOrNilForKey:kYSBaseImageLittleIosUrl fromDictionary:dict];
            self.imageBigIosUrl = [self objectOrNilForKey:kYSBaseImageBigIosUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dealUrl forKey:kYSBaseDealUrl];
    [mutableDict setValue:self.imagePluginUrl forKey:kYSBaseImagePluginUrl];
    [mutableDict setValue:self.imageCategoryIosUrl forKey:kYSBaseImageCategoryIosUrl];
    [mutableDict setValue:self.title forKey:kYSBaseTitle];
    [mutableDict setValue:self.parentUrlName forKey:kYSBaseParentUrlName];
    [mutableDict setValue:self.categoryName forKey:kYSBaseCategoryName];
    [mutableDict setValue:self.imageYoupinhuiUrl forKey:kYSBaseImageYoupinhuiUrl];
    [mutableDict setValue:self.imageLittleAndroidUrl forKey:kYSBaseImageLittleAndroidUrl];
    NSMutableArray *tempArrayForChildTopics = [NSMutableArray array];
    for (NSObject *subArrayObject in self.childTopics) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForChildTopics addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForChildTopics addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForChildTopics] forKey:kYSBaseChildTopics];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isPlugin] forKey:kYSBaseIsPlugin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bannerType] forKey:kYSBaseBannerType];
    [mutableDict setValue:[self.dealParams dictionaryRepresentation] forKey:kYSBaseDealParams];
    [mutableDict setValue:self.imageLargestAndroidUrl forKey:kYSBaseImageLargestAndroidUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.showModel] forKey:kYSBaseShowModel];
    [mutableDict setValue:self.imageMiddleIosUrl forKey:kYSBaseImageMiddleIosUrl];
    [mutableDict setValue:self.imageBigAndroidUrl forKey:kYSBaseImageBigAndroidUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kYSBaseId];
    [mutableDict setValue:self.imageLargestIosUrl forKey:kYSBaseImageLargestIosUrl];
    [mutableDict setValue:self.imageRegistrationAndroidUrl forKey:kYSBaseImageRegistrationAndroidUrl];
    [mutableDict setValue:self.value forKey:kYSBaseValue];
    [mutableDict setValue:self.wapUrl forKey:kYSBaseWapUrl];
    [mutableDict setValue:self.detail forKey:kYSBaseDetail];
    [mutableDict setValue:self.imageCategoryAndroidUrl forKey:kYSBaseImageCategoryAndroidUrl];
    [mutableDict setValue:self.imageRegistrationIosUrl forKey:kYSBaseImageRegistrationIosUrl];
    [mutableDict setValue:self.imageMiddleAndroidUrl forKey:kYSBaseImageMiddleAndroidUrl];
    [mutableDict setValue:self.imageLittleIosUrl forKey:kYSBaseImageLittleIosUrl];
    [mutableDict setValue:self.imageBigIosUrl forKey:kYSBaseImageBigIosUrl];

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

    self.dealUrl = [aDecoder decodeObjectForKey:kYSBaseDealUrl];
    self.imagePluginUrl = [aDecoder decodeObjectForKey:kYSBaseImagePluginUrl];
    self.imageCategoryIosUrl = [aDecoder decodeObjectForKey:kYSBaseImageCategoryIosUrl];
    self.title = [aDecoder decodeObjectForKey:kYSBaseTitle];
    self.parentUrlName = [aDecoder decodeObjectForKey:kYSBaseParentUrlName];
    self.categoryName = [aDecoder decodeObjectForKey:kYSBaseCategoryName];
    self.imageYoupinhuiUrl = [aDecoder decodeObjectForKey:kYSBaseImageYoupinhuiUrl];
    self.imageLittleAndroidUrl = [aDecoder decodeObjectForKey:kYSBaseImageLittleAndroidUrl];
    self.childTopics = [aDecoder decodeObjectForKey:kYSBaseChildTopics];
    self.isPlugin = [aDecoder decodeDoubleForKey:kYSBaseIsPlugin];
    self.bannerType = [aDecoder decodeDoubleForKey:kYSBaseBannerType];
    self.dealParams = [aDecoder decodeObjectForKey:kYSBaseDealParams];
    self.imageLargestAndroidUrl = [aDecoder decodeObjectForKey:kYSBaseImageLargestAndroidUrl];
    self.showModel = [aDecoder decodeDoubleForKey:kYSBaseShowModel];
    self.imageMiddleIosUrl = [aDecoder decodeObjectForKey:kYSBaseImageMiddleIosUrl];
    self.imageBigAndroidUrl = [aDecoder decodeObjectForKey:kYSBaseImageBigAndroidUrl];
    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kYSBaseId];
    self.imageLargestIosUrl = [aDecoder decodeObjectForKey:kYSBaseImageLargestIosUrl];
    self.imageRegistrationAndroidUrl = [aDecoder decodeObjectForKey:kYSBaseImageRegistrationAndroidUrl];
    self.value = [aDecoder decodeObjectForKey:kYSBaseValue];
    self.wapUrl = [aDecoder decodeObjectForKey:kYSBaseWapUrl];
    self.detail = [aDecoder decodeObjectForKey:kYSBaseDetail];
    self.imageCategoryAndroidUrl = [aDecoder decodeObjectForKey:kYSBaseImageCategoryAndroidUrl];
    self.imageRegistrationIosUrl = [aDecoder decodeObjectForKey:kYSBaseImageRegistrationIosUrl];
    self.imageMiddleAndroidUrl = [aDecoder decodeObjectForKey:kYSBaseImageMiddleAndroidUrl];
    self.imageLittleIosUrl = [aDecoder decodeObjectForKey:kYSBaseImageLittleIosUrl];
    self.imageBigIosUrl = [aDecoder decodeObjectForKey:kYSBaseImageBigIosUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dealUrl forKey:kYSBaseDealUrl];
    [aCoder encodeObject:_imagePluginUrl forKey:kYSBaseImagePluginUrl];
    [aCoder encodeObject:_imageCategoryIosUrl forKey:kYSBaseImageCategoryIosUrl];
    [aCoder encodeObject:_title forKey:kYSBaseTitle];
    [aCoder encodeObject:_parentUrlName forKey:kYSBaseParentUrlName];
    [aCoder encodeObject:_categoryName forKey:kYSBaseCategoryName];
    [aCoder encodeObject:_imageYoupinhuiUrl forKey:kYSBaseImageYoupinhuiUrl];
    [aCoder encodeObject:_imageLittleAndroidUrl forKey:kYSBaseImageLittleAndroidUrl];
    [aCoder encodeObject:_childTopics forKey:kYSBaseChildTopics];
    [aCoder encodeDouble:_isPlugin forKey:kYSBaseIsPlugin];
    [aCoder encodeDouble:_bannerType forKey:kYSBaseBannerType];
    [aCoder encodeObject:_dealParams forKey:kYSBaseDealParams];
    [aCoder encodeObject:_imageLargestAndroidUrl forKey:kYSBaseImageLargestAndroidUrl];
    [aCoder encodeDouble:_showModel forKey:kYSBaseShowModel];
    [aCoder encodeObject:_imageMiddleIosUrl forKey:kYSBaseImageMiddleIosUrl];
    [aCoder encodeObject:_imageBigAndroidUrl forKey:kYSBaseImageBigAndroidUrl];
    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kYSBaseId];
    [aCoder encodeObject:_imageLargestIosUrl forKey:kYSBaseImageLargestIosUrl];
    [aCoder encodeObject:_imageRegistrationAndroidUrl forKey:kYSBaseImageRegistrationAndroidUrl];
    [aCoder encodeObject:_value forKey:kYSBaseValue];
    [aCoder encodeObject:_wapUrl forKey:kYSBaseWapUrl];
    [aCoder encodeObject:_detail forKey:kYSBaseDetail];
    [aCoder encodeObject:_imageCategoryAndroidUrl forKey:kYSBaseImageCategoryAndroidUrl];
    [aCoder encodeObject:_imageRegistrationIosUrl forKey:kYSBaseImageRegistrationIosUrl];
    [aCoder encodeObject:_imageMiddleAndroidUrl forKey:kYSBaseImageMiddleAndroidUrl];
    [aCoder encodeObject:_imageLittleIosUrl forKey:kYSBaseImageLittleIosUrl];
    [aCoder encodeObject:_imageBigIosUrl forKey:kYSBaseImageBigIosUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    YSBase *copy = [[YSBase alloc] init];
    
    if (copy) {

        copy.dealUrl = [self.dealUrl copyWithZone:zone];
        copy.imagePluginUrl = [self.imagePluginUrl copyWithZone:zone];
        copy.imageCategoryIosUrl = [self.imageCategoryIosUrl copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.parentUrlName = [self.parentUrlName copyWithZone:zone];
        copy.categoryName = [self.categoryName copyWithZone:zone];
        copy.imageYoupinhuiUrl = [self.imageYoupinhuiUrl copyWithZone:zone];
        copy.imageLittleAndroidUrl = [self.imageLittleAndroidUrl copyWithZone:zone];
        copy.childTopics = [self.childTopics copyWithZone:zone];
        copy.isPlugin = self.isPlugin;
        copy.bannerType = self.bannerType;
        copy.dealParams = [self.dealParams copyWithZone:zone];
        copy.imageLargestAndroidUrl = [self.imageLargestAndroidUrl copyWithZone:zone];
        copy.showModel = self.showModel;
        copy.imageMiddleIosUrl = [self.imageMiddleIosUrl copyWithZone:zone];
        copy.imageBigAndroidUrl = [self.imageBigAndroidUrl copyWithZone:zone];
        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.imageLargestIosUrl = [self.imageLargestIosUrl copyWithZone:zone];
        copy.imageRegistrationAndroidUrl = [self.imageRegistrationAndroidUrl copyWithZone:zone];
        copy.value = [self.value copyWithZone:zone];
        copy.wapUrl = [self.wapUrl copyWithZone:zone];
        copy.detail = [self.detail copyWithZone:zone];
        copy.imageCategoryAndroidUrl = [self.imageCategoryAndroidUrl copyWithZone:zone];
        copy.imageRegistrationIosUrl = [self.imageRegistrationIosUrl copyWithZone:zone];
        copy.imageMiddleAndroidUrl = [self.imageMiddleAndroidUrl copyWithZone:zone];
        copy.imageLittleIosUrl = [self.imageLittleIosUrl copyWithZone:zone];
        copy.imageBigIosUrl = [self.imageBigIosUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
