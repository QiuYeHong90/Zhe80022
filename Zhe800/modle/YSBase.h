//
//  YSBase.h
//
//  Created by mac  on 16/6/26
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YSDealParams;

@interface YSBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dealUrl;
@property (nonatomic, strong) NSString *imagePluginUrl;
@property (nonatomic, strong) NSString *imageCategoryIosUrl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *parentUrlName;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *imageYoupinhuiUrl;
@property (nonatomic, strong) NSString *imageLittleAndroidUrl;
@property (nonatomic, strong) NSArray *childTopics;
@property (nonatomic, assign) double isPlugin;
@property (nonatomic, assign) double bannerType;
@property (nonatomic, strong) YSDealParams *dealParams;
@property (nonatomic, strong) NSString *imageLargestAndroidUrl;
@property (nonatomic, assign) double showModel;
@property (nonatomic, strong) NSString *imageMiddleIosUrl;
@property (nonatomic, strong) NSString *imageBigAndroidUrl;
@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *imageLargestIosUrl;
@property (nonatomic, strong) NSString *imageRegistrationAndroidUrl;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *wapUrl;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSString *imageCategoryAndroidUrl;
@property (nonatomic, strong) NSString *imageRegistrationIosUrl;
@property (nonatomic, strong) NSString *imageMiddleAndroidUrl;
@property (nonatomic, strong) NSString *imageLittleIosUrl;
@property (nonatomic, strong) NSString *imageBigIosUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
