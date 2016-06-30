//
//  STOREConfigInfo.h
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface STOREConfigInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *picList;
@property (nonatomic, assign) double secondSwitch;
@property (nonatomic, assign) double secondAlign;
@property (nonatomic, strong) NSString *thirdColor;
@property (nonatomic, strong) NSString *footText;
@property (nonatomic, strong) NSString *thirdRightColor;
@property (nonatomic, strong) NSString *firstColor;
@property (nonatomic, strong) NSString *baoyouColor;
@property (nonatomic, assign) double thirdAlign;
@property (nonatomic, strong) NSString *thirdRightValue;
@property (nonatomic, assign) double firstAlign;
@property (nonatomic, strong) NSString *footColor;
@property (nonatomic, strong) NSString *promotionColor;
@property (nonatomic, strong) NSString *iconGrid;
@property (nonatomic, strong) NSString *activityText;
@property (nonatomic, strong) NSString *activityBgColor;
@property (nonatomic, assign) double firstSwitch;
@property (nonatomic, assign) double footSwitch;
@property (nonatomic, strong) NSString *thirdLeftValue;
@property (nonatomic, strong) NSString *promotionBgColor;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *activityBorderColor;
@property (nonatomic, strong) NSString *iconList;
@property (nonatomic, assign) double thirdSwitch;
@property (nonatomic, strong) NSString *baoyouText;
@property (nonatomic, assign) double footAlign;
@property (nonatomic, strong) NSString *promotionBorderColor;
@property (nonatomic, strong) NSString *brandYoupinBgColor;
@property (nonatomic, assign) double thirdLeftType;
@property (nonatomic, strong) NSString *promotionText;
@property (nonatomic, strong) NSString *thirdText;
@property (nonatomic, strong) NSString *brandYoupinBorderColor;
@property (nonatomic, assign) double thirdRightSwitch;
@property (nonatomic, strong) NSString *activityColor;
@property (nonatomic, strong) NSString *firstText;
@property (nonatomic, strong) NSString *thirdLeftColor;
@property (nonatomic, strong) NSString *brandYoupinText;
@property (nonatomic, strong) NSString *brandYoupinColor;
@property (nonatomic, assign) double point;
@property (nonatomic, strong) NSString *secondText;
@property (nonatomic, strong) NSString *secondColor;
@property (nonatomic, strong) NSString *picGrid;
@property (nonatomic, assign) double picType;
@property (nonatomic, assign) double thirdLeftSwitch;
@property (nonatomic, strong) NSString *footBgColor;
@property (nonatomic, assign) double footType;
@property (nonatomic, assign) double thirdRightType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
