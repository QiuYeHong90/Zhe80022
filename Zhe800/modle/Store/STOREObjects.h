//
//  STOREObjects.h
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class STOREImageUrl, STOREConfigInfo, STOREScores, STORECouponInfos;

@interface STOREObjects : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double dealType;
@property (nonatomic, assign) double salesCount;
@property (nonatomic, strong) NSString *expireTime;
@property (nonatomic, strong) NSArray *dealTypes;
@property (nonatomic, strong) NSString *zid;
@property (nonatomic, strong) NSString *themeUrl;
@property (nonatomic, assign) double objectsIdentifier;
@property (nonatomic, strong) NSString *recommendReason;
@property (nonatomic, strong) NSString *detailUrl;
@property (nonatomic, assign) BOOL huiyuangou;
@property (nonatomic, assign) double brandId;
@property (nonatomic, assign) double picWidth;
@property (nonatomic, assign) double today;
@property (nonatomic, assign) double listPrice;
@property (nonatomic, assign) double sourceType;
@property (nonatomic, strong) NSString *imageShare;
@property (nonatomic, strong) STOREImageUrl *imageUrl;
@property (nonatomic, strong) STOREConfigInfo *configInfo;
@property (nonatomic, assign) double shopType;
@property (nonatomic, strong) NSString *dealSource;
@property (nonatomic, assign) double goodsType;
@property (nonatomic, strong) NSString *originDealUrl;
@property (nonatomic, assign) BOOL baoyou;
@property (nonatomic, assign) BOOL zhuanxiang;
@property (nonatomic, strong) NSString *urlName;
@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSString *shortTitle;
@property (nonatomic, strong) NSString *dealUrl;
@property (nonatomic, strong) NSString *brandEndTime;
@property (nonatomic, strong) NSString *taobaoId;
@property (nonatomic, assign) BOOL fanjifen;
@property (nonatomic, assign) BOOL promotion;
@property (nonatomic, assign) BOOL youpin;
@property (nonatomic, strong) NSString *wapUrl;
@property (nonatomic, assign) double brandDealNum;
@property (nonatomic, strong) STOREScores *scores;
@property (nonatomic, strong) NSString *shareUrl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double brandProductType;
@property (nonatomic, assign) double picHeight;
@property (nonatomic, strong) NSString *beginTime;
@property (nonatomic, strong) STORECouponInfos *couponInfos;
@property (nonatomic, strong) NSString *squareImage;
@property (nonatomic, assign) double oos;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
