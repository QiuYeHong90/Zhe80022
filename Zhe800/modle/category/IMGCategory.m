//
//  IMGCategory.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "IMGCategory.h"


NSString *const kIMGCategoryId = @"id";
NSString *const kIMGCategoryCategoryDesc = @"category_desc";
NSString *const kIMGCategoryQuery = @"query";
NSString *const kIMGCategorySpecialTag = @"special_tag";
NSString *const kIMGCategoryTagId = @"tag_id";
NSString *const kIMGCategoryPic = @"pic";
NSString *const kIMGCategoryLevel = @"level";
NSString *const kIMGCategoryIsMuying = @"is_muying";
NSString *const kIMGCategoryCategoryName = @"category_name";
NSString *const kIMGCategoryUrlName = @"url_name";
NSString *const kIMGCategoryNowCount = @"now_count";
NSString *const kIMGCategoryParentUrlName = @"parent_url_name";


@interface IMGCategory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation IMGCategory

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize categoryDesc = _categoryDesc;
@synthesize query = _query;
@synthesize specialTag = _specialTag;
@synthesize tagId = _tagId;
@synthesize pic = _pic;
@synthesize level = _level;
@synthesize isMuying = _isMuying;
@synthesize categoryName = _categoryName;
@synthesize urlName = _urlName;
@synthesize nowCount = _nowCount;
@synthesize parentUrlName = _parentUrlName;


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
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:kIMGCategoryId fromDictionary:dict] doubleValue];
            self.categoryDesc = [self objectOrNilForKey:kIMGCategoryCategoryDesc fromDictionary:dict];
            self.query = [self objectOrNilForKey:kIMGCategoryQuery fromDictionary:dict];
            self.specialTag = [[self objectOrNilForKey:kIMGCategorySpecialTag fromDictionary:dict] doubleValue];
            self.tagId = [[self objectOrNilForKey:kIMGCategoryTagId fromDictionary:dict] doubleValue];
            self.pic = [self objectOrNilForKey:kIMGCategoryPic fromDictionary:dict];
            self.level = [[self objectOrNilForKey:kIMGCategoryLevel fromDictionary:dict] doubleValue];
            self.isMuying = [[self objectOrNilForKey:kIMGCategoryIsMuying fromDictionary:dict] doubleValue];
            self.categoryName = [self objectOrNilForKey:kIMGCategoryCategoryName fromDictionary:dict];
            self.urlName = [self objectOrNilForKey:kIMGCategoryUrlName fromDictionary:dict];
            self.nowCount = [[self objectOrNilForKey:kIMGCategoryNowCount fromDictionary:dict] doubleValue];
            self.parentUrlName = [self objectOrNilForKey:kIMGCategoryParentUrlName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kIMGCategoryId];
    [mutableDict setValue:self.categoryDesc forKey:kIMGCategoryCategoryDesc];
    [mutableDict setValue:self.query forKey:kIMGCategoryQuery];
    [mutableDict setValue:[NSNumber numberWithDouble:self.specialTag] forKey:kIMGCategorySpecialTag];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tagId] forKey:kIMGCategoryTagId];
    [mutableDict setValue:self.pic forKey:kIMGCategoryPic];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kIMGCategoryLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isMuying] forKey:kIMGCategoryIsMuying];
    [mutableDict setValue:self.categoryName forKey:kIMGCategoryCategoryName];
    [mutableDict setValue:self.urlName forKey:kIMGCategoryUrlName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.nowCount] forKey:kIMGCategoryNowCount];
    [mutableDict setValue:self.parentUrlName forKey:kIMGCategoryParentUrlName];

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

    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kIMGCategoryId];
    self.categoryDesc = [aDecoder decodeObjectForKey:kIMGCategoryCategoryDesc];
    self.query = [aDecoder decodeObjectForKey:kIMGCategoryQuery];
    self.specialTag = [aDecoder decodeDoubleForKey:kIMGCategorySpecialTag];
    self.tagId = [aDecoder decodeDoubleForKey:kIMGCategoryTagId];
    self.pic = [aDecoder decodeObjectForKey:kIMGCategoryPic];
    self.level = [aDecoder decodeDoubleForKey:kIMGCategoryLevel];
    self.isMuying = [aDecoder decodeDoubleForKey:kIMGCategoryIsMuying];
    self.categoryName = [aDecoder decodeObjectForKey:kIMGCategoryCategoryName];
    self.urlName = [aDecoder decodeObjectForKey:kIMGCategoryUrlName];
    self.nowCount = [aDecoder decodeDoubleForKey:kIMGCategoryNowCount];
    self.parentUrlName = [aDecoder decodeObjectForKey:kIMGCategoryParentUrlName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kIMGCategoryId];
    [aCoder encodeObject:_categoryDesc forKey:kIMGCategoryCategoryDesc];
    [aCoder encodeObject:_query forKey:kIMGCategoryQuery];
    [aCoder encodeDouble:_specialTag forKey:kIMGCategorySpecialTag];
    [aCoder encodeDouble:_tagId forKey:kIMGCategoryTagId];
    [aCoder encodeObject:_pic forKey:kIMGCategoryPic];
    [aCoder encodeDouble:_level forKey:kIMGCategoryLevel];
    [aCoder encodeDouble:_isMuying forKey:kIMGCategoryIsMuying];
    [aCoder encodeObject:_categoryName forKey:kIMGCategoryCategoryName];
    [aCoder encodeObject:_urlName forKey:kIMGCategoryUrlName];
    [aCoder encodeDouble:_nowCount forKey:kIMGCategoryNowCount];
    [aCoder encodeObject:_parentUrlName forKey:kIMGCategoryParentUrlName];
}

- (id)copyWithZone:(NSZone *)zone
{
    IMGCategory *copy = [[IMGCategory alloc] init];
    
    if (copy) {

        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.categoryDesc = [self.categoryDesc copyWithZone:zone];
        copy.query = [self.query copyWithZone:zone];
        copy.specialTag = self.specialTag;
        copy.tagId = self.tagId;
        copy.pic = [self.pic copyWithZone:zone];
        copy.level = self.level;
        copy.isMuying = self.isMuying;
        copy.categoryName = [self.categoryName copyWithZone:zone];
        copy.urlName = [self.urlName copyWithZone:zone];
        copy.nowCount = self.nowCount;
        copy.parentUrlName = [self.parentUrlName copyWithZone:zone];
    }
    
    return copy;
}


@end
