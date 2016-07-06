//
//  SHOPObjects.h
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class SHOPImageUrl, SHOPConfigInfo, SHOPScores, SHOPCouponInfos;

@interface SHOPObjects : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *squareImage;
@property (nonatomic, assign) double salesCount;
@property (nonatomic, strong) NSString *expireTime;
@property (nonatomic, assign) double oos;
@property (nonatomic, strong) NSString *zid;
@property (nonatomic, strong) NSString *themeUrl;
@property (nonatomic, assign) double objectsIdentifier;
@property (nonatomic, strong) NSString *recommendReason;
@property (nonatomic, strong) NSString *detailUrl;
@property (nonatomic, assign) BOOL huiyuangou;
@property (nonatomic, assign) double brandId;

///图片宽度
@property (nonatomic, assign) double picWidth;

///今天
@property (nonatomic, assign) double today;

///以前的价格
@property (nonatomic, assign) double listPrice;
@property (nonatomic, assign) double sourceType;
@property (nonatomic, strong) NSString *imageShare;
@property (nonatomic, strong) SHOPImageUrl *imageUrl;
@property (nonatomic, strong) SHOPConfigInfo *configInfo;
@property (nonatomic, assign) double shopType;
@property (nonatomic, strong) NSString *dealSource;
@property (nonatomic, assign) double goodsType;
@property (nonatomic, strong) NSString *originDealUrl;
@property (nonatomic, assign) BOOL baoyou;
@property (nonatomic, assign) BOOL zhuanxiang;
@property (nonatomic, strong) NSString *urlName;
@property (nonatomic, assign) double price;

@property (nonatomic,assign) double priceWith;


@property (nonatomic, strong) NSString *dealUrl;
@property (nonatomic, strong) NSString *shortTitle;
///淘宝id
@property (nonatomic, strong) NSString *taobaoId;
@property (nonatomic, assign) BOOL fanjifen;
@property (nonatomic, assign) BOOL promotion;
@property (nonatomic, assign) BOOL youpin;
@property (nonatomic, strong) NSString *wapUrl;
@property (nonatomic, strong) SHOPScores *scores;
@property (nonatomic, strong) NSString *shareUrl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double brandProductType;
@property (nonatomic, assign) double picHeight;
@property (nonatomic, strong) NSString *beginTime;
@property (nonatomic, strong) SHOPCouponInfos *couponInfos;
@property (nonatomic, assign) double dealType;
@property (nonatomic, strong) id dealTypes;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
