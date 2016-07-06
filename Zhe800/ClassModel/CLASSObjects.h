//
//  CLASSObjects.h
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLASSBrandImageUrl;

@interface CLASSObjects : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) CLASSBrandImageUrl *brandImageUrl;
@property (nonatomic, assign) double objectsIdentifier;
@property (nonatomic, strong) NSArray *discountType;
@property (nonatomic, strong) NSString *discount;
@property (nonatomic, assign) double brandLibraryId;
@property (nonatomic, strong) NSString *beginTime;
@property (nonatomic, assign) double lowPrice;
@property (nonatomic, strong) NSString *specialName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *logoImage;
@property (nonatomic, strong) NSString *squareImage;
@property (nonatomic, assign) double today;
@property (nonatomic, assign) double dealCounts;
@property (nonatomic, assign) double brandSalesCount;
@property (nonatomic, strong) NSString *endTime;
@property (nonatomic, strong) NSString *brandUrlName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *discountRule;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
