//
//  SHOPObjects.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SHOPObjects.h"
#import "SHOPImageUrl.h"
#import "SHOPConfigInfo.h"
#import "SHOPScores.h"
#import "SHOPCouponInfos.h"
#import "NSString+big.h"

NSString *const kSHOPObjectsSquareImage = @"square_image";
NSString *const kSHOPObjectsSalesCount = @"sales_count";
NSString *const kSHOPObjectsExpireTime = @"expire_time";
NSString *const kSHOPObjectsOos = @"oos";
NSString *const kSHOPObjectsZid = @"zid";
NSString *const kSHOPObjectsThemeUrl = @"theme_url";
NSString *const kSHOPObjectsId = @"id";
NSString *const kSHOPObjectsRecommendReason = @"recommend_reason";
NSString *const kSHOPObjectsDetailUrl = @"detail_url";
NSString *const kSHOPObjectsHuiyuangou = @"huiyuangou";
NSString *const kSHOPObjectsBrandId = @"brand_id";
NSString *const kSHOPObjectsPicWidth = @"pic_width";
NSString *const kSHOPObjectsToday = @"today";
NSString *const kSHOPObjectsListPrice = @"list_price";
NSString *const kSHOPObjectsSourceType = @"source_type";
NSString *const kSHOPObjectsImageShare = @"image_share";
NSString *const kSHOPObjectsImageUrl = @"image_url";
NSString *const kSHOPObjectsConfigInfo = @"config_info";
NSString *const kSHOPObjectsShopType = @"shop_type";
NSString *const kSHOPObjectsDealSource = @"deal_source";
NSString *const kSHOPObjectsGoodsType = @"goods_type";
NSString *const kSHOPObjectsOriginDealUrl = @"origin_deal_url";
NSString *const kSHOPObjectsBaoyou = @"baoyou";
NSString *const kSHOPObjectsZhuanxiang = @"zhuanxiang";
NSString *const kSHOPObjectsUrlName = @"url_name";
NSString *const kSHOPObjectsPrice = @"price";
NSString *const kSHOPObjectsDealUrl = @"deal_url";
NSString *const kSHOPObjectsShortTitle = @"short_title";
NSString *const kSHOPObjectsTaobaoId = @"taobao_id";
NSString *const kSHOPObjectsFanjifen = @"fanjifen";
NSString *const kSHOPObjectsPromotion = @"promotion";
NSString *const kSHOPObjectsYoupin = @"youpin";
NSString *const kSHOPObjectsWapUrl = @"wap_url";
NSString *const kSHOPObjectsScores = @"scores";
NSString *const kSHOPObjectsShareUrl = @"share_url";
NSString *const kSHOPObjectsTitle = @"title";
NSString *const kSHOPObjectsBrandProductType = @"brand_product_type";
NSString *const kSHOPObjectsPicHeight = @"pic_height";
NSString *const kSHOPObjectsBeginTime = @"begin_time";
NSString *const kSHOPObjectsCouponInfos = @"coupon_infos";
NSString *const kSHOPObjectsDealType = @"deal_type";
NSString *const kSHOPObjectsDealTypes = @"deal_types";


@interface SHOPObjects ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SHOPObjects

@synthesize squareImage = _squareImage;
@synthesize salesCount = _salesCount;
@synthesize expireTime = _expireTime;
@synthesize oos = _oos;
@synthesize zid = _zid;
@synthesize themeUrl = _themeUrl;
@synthesize objectsIdentifier = _objectsIdentifier;
@synthesize recommendReason = _recommendReason;
@synthesize detailUrl = _detailUrl;
@synthesize huiyuangou = _huiyuangou;
@synthesize brandId = _brandId;
@synthesize picWidth = _picWidth;
@synthesize today = _today;
@synthesize listPrice = _listPrice;
@synthesize sourceType = _sourceType;
@synthesize imageShare = _imageShare;
@synthesize imageUrl = _imageUrl;
@synthesize configInfo = _configInfo;
@synthesize shopType = _shopType;
@synthesize dealSource = _dealSource;
@synthesize goodsType = _goodsType;
@synthesize originDealUrl = _originDealUrl;
@synthesize baoyou = _baoyou;
@synthesize zhuanxiang = _zhuanxiang;
@synthesize urlName = _urlName;
@synthesize price = _price;
@synthesize dealUrl = _dealUrl;
@synthesize shortTitle = _shortTitle;
@synthesize taobaoId = _taobaoId;
@synthesize fanjifen = _fanjifen;
@synthesize promotion = _promotion;
@synthesize youpin = _youpin;
@synthesize wapUrl = _wapUrl;
@synthesize scores = _scores;
@synthesize shareUrl = _shareUrl;
@synthesize title = _title;
@synthesize brandProductType = _brandProductType;
@synthesize picHeight = _picHeight;
@synthesize beginTime = _beginTime;
@synthesize couponInfos = _couponInfos;
@synthesize dealType = _dealType;
@synthesize dealTypes = _dealTypes;


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
            self.squareImage = [self objectOrNilForKey:kSHOPObjectsSquareImage fromDictionary:dict];
            self.salesCount = [[self objectOrNilForKey:kSHOPObjectsSalesCount fromDictionary:dict] doubleValue];
            self.expireTime = [self objectOrNilForKey:kSHOPObjectsExpireTime fromDictionary:dict];
            self.oos = [[self objectOrNilForKey:kSHOPObjectsOos fromDictionary:dict] doubleValue];
            self.zid = [self objectOrNilForKey:kSHOPObjectsZid fromDictionary:dict];
            self.themeUrl = [self objectOrNilForKey:kSHOPObjectsThemeUrl fromDictionary:dict];
            self.objectsIdentifier = [[self objectOrNilForKey:kSHOPObjectsId fromDictionary:dict] doubleValue];
            self.recommendReason = [self objectOrNilForKey:kSHOPObjectsRecommendReason fromDictionary:dict];
            self.detailUrl = [self objectOrNilForKey:kSHOPObjectsDetailUrl fromDictionary:dict];
            self.huiyuangou = [[self objectOrNilForKey:kSHOPObjectsHuiyuangou fromDictionary:dict] boolValue];
            self.brandId = [[self objectOrNilForKey:kSHOPObjectsBrandId fromDictionary:dict] doubleValue];
            self.picWidth = [[self objectOrNilForKey:kSHOPObjectsPicWidth fromDictionary:dict] doubleValue];
            self.today = [[self objectOrNilForKey:kSHOPObjectsToday fromDictionary:dict] doubleValue];
            self.listPrice = [[self objectOrNilForKey:kSHOPObjectsListPrice fromDictionary:dict] doubleValue];
            self.sourceType = [[self objectOrNilForKey:kSHOPObjectsSourceType fromDictionary:dict] doubleValue];
            self.imageShare = [self objectOrNilForKey:kSHOPObjectsImageShare fromDictionary:dict];
            self.imageUrl = [SHOPImageUrl modelObjectWithDictionary:[dict objectForKey:kSHOPObjectsImageUrl]];
            self.configInfo = [SHOPConfigInfo modelObjectWithDictionary:[dict objectForKey:kSHOPObjectsConfigInfo]];
            self.shopType = [[self objectOrNilForKey:kSHOPObjectsShopType fromDictionary:dict] doubleValue];
            self.dealSource = [self objectOrNilForKey:kSHOPObjectsDealSource fromDictionary:dict];
            self.goodsType = [[self objectOrNilForKey:kSHOPObjectsGoodsType fromDictionary:dict] doubleValue];
            self.originDealUrl = [self objectOrNilForKey:kSHOPObjectsOriginDealUrl fromDictionary:dict];
            self.baoyou = [[self objectOrNilForKey:kSHOPObjectsBaoyou fromDictionary:dict] boolValue];
            self.zhuanxiang = [[self objectOrNilForKey:kSHOPObjectsZhuanxiang fromDictionary:dict] boolValue];
            self.urlName = [self objectOrNilForKey:kSHOPObjectsUrlName fromDictionary:dict];
            self.price = [[self objectOrNilForKey:kSHOPObjectsPrice fromDictionary:dict] doubleValue];
            self.dealUrl = [self objectOrNilForKey:kSHOPObjectsDealUrl fromDictionary:dict];
            self.shortTitle = [self objectOrNilForKey:kSHOPObjectsShortTitle fromDictionary:dict];
            self.taobaoId = [self objectOrNilForKey:kSHOPObjectsTaobaoId fromDictionary:dict];
            self.fanjifen = [[self objectOrNilForKey:kSHOPObjectsFanjifen fromDictionary:dict] boolValue];
            self.promotion = [[self objectOrNilForKey:kSHOPObjectsPromotion fromDictionary:dict] boolValue];
            self.youpin = [[self objectOrNilForKey:kSHOPObjectsYoupin fromDictionary:dict] boolValue];
            self.wapUrl = [self objectOrNilForKey:kSHOPObjectsWapUrl fromDictionary:dict];
            self.scores = [SHOPScores modelObjectWithDictionary:[dict objectForKey:kSHOPObjectsScores]];
            self.shareUrl = [self objectOrNilForKey:kSHOPObjectsShareUrl fromDictionary:dict];
            self.title = [self objectOrNilForKey:kSHOPObjectsTitle fromDictionary:dict];
            self.brandProductType = [[self objectOrNilForKey:kSHOPObjectsBrandProductType fromDictionary:dict] doubleValue];
            self.picHeight = [[self objectOrNilForKey:kSHOPObjectsPicHeight fromDictionary:dict] doubleValue];
            self.beginTime = [self objectOrNilForKey:kSHOPObjectsBeginTime fromDictionary:dict];
            self.couponInfos = [SHOPCouponInfos modelObjectWithDictionary:[dict objectForKey:kSHOPObjectsCouponInfos]];
            self.dealType = [[self objectOrNilForKey:kSHOPObjectsDealType fromDictionary:dict] doubleValue];
            self.dealTypes = [self objectOrNilForKey:kSHOPObjectsDealTypes fromDictionary:dict];
        NSString * longStr  = [NSString stringWithFormat:@"¥%.1f",self.price/100];
        self.priceWith = CGRectGetWidth([longStr getRectWithFontSize:20])+10;

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.squareImage forKey:kSHOPObjectsSquareImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.salesCount] forKey:kSHOPObjectsSalesCount];
    [mutableDict setValue:self.expireTime forKey:kSHOPObjectsExpireTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.oos] forKey:kSHOPObjectsOos];
    [mutableDict setValue:self.zid forKey:kSHOPObjectsZid];
    [mutableDict setValue:self.themeUrl forKey:kSHOPObjectsThemeUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.objectsIdentifier] forKey:kSHOPObjectsId];
    [mutableDict setValue:self.recommendReason forKey:kSHOPObjectsRecommendReason];
    [mutableDict setValue:self.detailUrl forKey:kSHOPObjectsDetailUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.huiyuangou] forKey:kSHOPObjectsHuiyuangou];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandId] forKey:kSHOPObjectsBrandId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.picWidth] forKey:kSHOPObjectsPicWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.today] forKey:kSHOPObjectsToday];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listPrice] forKey:kSHOPObjectsListPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceType] forKey:kSHOPObjectsSourceType];
    [mutableDict setValue:self.imageShare forKey:kSHOPObjectsImageShare];
    [mutableDict setValue:[self.imageUrl dictionaryRepresentation] forKey:kSHOPObjectsImageUrl];
    [mutableDict setValue:[self.configInfo dictionaryRepresentation] forKey:kSHOPObjectsConfigInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shopType] forKey:kSHOPObjectsShopType];
    [mutableDict setValue:self.dealSource forKey:kSHOPObjectsDealSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsType] forKey:kSHOPObjectsGoodsType];
    [mutableDict setValue:self.originDealUrl forKey:kSHOPObjectsOriginDealUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.baoyou] forKey:kSHOPObjectsBaoyou];
    [mutableDict setValue:[NSNumber numberWithBool:self.zhuanxiang] forKey:kSHOPObjectsZhuanxiang];
    [mutableDict setValue:self.urlName forKey:kSHOPObjectsUrlName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kSHOPObjectsPrice];
    [mutableDict setValue:self.dealUrl forKey:kSHOPObjectsDealUrl];
    [mutableDict setValue:self.shortTitle forKey:kSHOPObjectsShortTitle];
    [mutableDict setValue:self.taobaoId forKey:kSHOPObjectsTaobaoId];
    [mutableDict setValue:[NSNumber numberWithBool:self.fanjifen] forKey:kSHOPObjectsFanjifen];
    [mutableDict setValue:[NSNumber numberWithBool:self.promotion] forKey:kSHOPObjectsPromotion];
    [mutableDict setValue:[NSNumber numberWithBool:self.youpin] forKey:kSHOPObjectsYoupin];
    [mutableDict setValue:self.wapUrl forKey:kSHOPObjectsWapUrl];
    [mutableDict setValue:[self.scores dictionaryRepresentation] forKey:kSHOPObjectsScores];
    [mutableDict setValue:self.shareUrl forKey:kSHOPObjectsShareUrl];
    [mutableDict setValue:self.title forKey:kSHOPObjectsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandProductType] forKey:kSHOPObjectsBrandProductType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.picHeight] forKey:kSHOPObjectsPicHeight];
    [mutableDict setValue:self.beginTime forKey:kSHOPObjectsBeginTime];
    [mutableDict setValue:[self.couponInfos dictionaryRepresentation] forKey:kSHOPObjectsCouponInfos];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dealType] forKey:kSHOPObjectsDealType];
    if (self.dealTypes) {
        NSLog(@"==%@",self.dealTypes );
        [mutableDict setValue:self.dealTypes forKey:kSHOPObjectsDealTypes];
    }
    

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

    self.squareImage = [aDecoder decodeObjectForKey:kSHOPObjectsSquareImage];
    self.salesCount = [aDecoder decodeDoubleForKey:kSHOPObjectsSalesCount];
    self.expireTime = [aDecoder decodeObjectForKey:kSHOPObjectsExpireTime];
    self.oos = [aDecoder decodeDoubleForKey:kSHOPObjectsOos];
    self.zid = [aDecoder decodeObjectForKey:kSHOPObjectsZid];
    self.themeUrl = [aDecoder decodeObjectForKey:kSHOPObjectsThemeUrl];
    self.objectsIdentifier = [aDecoder decodeDoubleForKey:kSHOPObjectsId];
    self.recommendReason = [aDecoder decodeObjectForKey:kSHOPObjectsRecommendReason];
    self.detailUrl = [aDecoder decodeObjectForKey:kSHOPObjectsDetailUrl];
    self.huiyuangou = [aDecoder decodeBoolForKey:kSHOPObjectsHuiyuangou];
    self.brandId = [aDecoder decodeDoubleForKey:kSHOPObjectsBrandId];
    self.picWidth = [aDecoder decodeDoubleForKey:kSHOPObjectsPicWidth];
    self.today = [aDecoder decodeDoubleForKey:kSHOPObjectsToday];
    self.listPrice = [aDecoder decodeDoubleForKey:kSHOPObjectsListPrice];
    self.sourceType = [aDecoder decodeDoubleForKey:kSHOPObjectsSourceType];
    self.imageShare = [aDecoder decodeObjectForKey:kSHOPObjectsImageShare];
    self.imageUrl = [aDecoder decodeObjectForKey:kSHOPObjectsImageUrl];
    self.configInfo = [aDecoder decodeObjectForKey:kSHOPObjectsConfigInfo];
    self.shopType = [aDecoder decodeDoubleForKey:kSHOPObjectsShopType];
    self.dealSource = [aDecoder decodeObjectForKey:kSHOPObjectsDealSource];
    self.goodsType = [aDecoder decodeDoubleForKey:kSHOPObjectsGoodsType];
    self.originDealUrl = [aDecoder decodeObjectForKey:kSHOPObjectsOriginDealUrl];
    self.baoyou = [aDecoder decodeBoolForKey:kSHOPObjectsBaoyou];
    self.zhuanxiang = [aDecoder decodeBoolForKey:kSHOPObjectsZhuanxiang];
    self.urlName = [aDecoder decodeObjectForKey:kSHOPObjectsUrlName];
    self.price = [aDecoder decodeDoubleForKey:kSHOPObjectsPrice];
    self.dealUrl = [aDecoder decodeObjectForKey:kSHOPObjectsDealUrl];
    self.shortTitle = [aDecoder decodeObjectForKey:kSHOPObjectsShortTitle];
    self.taobaoId = [aDecoder decodeObjectForKey:kSHOPObjectsTaobaoId];
    self.fanjifen = [aDecoder decodeBoolForKey:kSHOPObjectsFanjifen];
    self.promotion = [aDecoder decodeBoolForKey:kSHOPObjectsPromotion];
    self.youpin = [aDecoder decodeBoolForKey:kSHOPObjectsYoupin];
    self.wapUrl = [aDecoder decodeObjectForKey:kSHOPObjectsWapUrl];
    self.scores = [aDecoder decodeObjectForKey:kSHOPObjectsScores];
    self.shareUrl = [aDecoder decodeObjectForKey:kSHOPObjectsShareUrl];
    self.title = [aDecoder decodeObjectForKey:kSHOPObjectsTitle];
    self.brandProductType = [aDecoder decodeDoubleForKey:kSHOPObjectsBrandProductType];
    self.picHeight = [aDecoder decodeDoubleForKey:kSHOPObjectsPicHeight];
    self.beginTime = [aDecoder decodeObjectForKey:kSHOPObjectsBeginTime];
    self.couponInfos = [aDecoder decodeObjectForKey:kSHOPObjectsCouponInfos];
    self.dealType = [aDecoder decodeDoubleForKey:kSHOPObjectsDealType];
    self.dealTypes = [aDecoder decodeObjectForKey:kSHOPObjectsDealTypes];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_squareImage forKey:kSHOPObjectsSquareImage];
    [aCoder encodeDouble:_salesCount forKey:kSHOPObjectsSalesCount];
    [aCoder encodeObject:_expireTime forKey:kSHOPObjectsExpireTime];
    [aCoder encodeDouble:_oos forKey:kSHOPObjectsOos];
    [aCoder encodeObject:_zid forKey:kSHOPObjectsZid];
    [aCoder encodeObject:_themeUrl forKey:kSHOPObjectsThemeUrl];
    [aCoder encodeDouble:_objectsIdentifier forKey:kSHOPObjectsId];
    [aCoder encodeObject:_recommendReason forKey:kSHOPObjectsRecommendReason];
    [aCoder encodeObject:_detailUrl forKey:kSHOPObjectsDetailUrl];
    [aCoder encodeBool:_huiyuangou forKey:kSHOPObjectsHuiyuangou];
    [aCoder encodeDouble:_brandId forKey:kSHOPObjectsBrandId];
    [aCoder encodeDouble:_picWidth forKey:kSHOPObjectsPicWidth];
    [aCoder encodeDouble:_today forKey:kSHOPObjectsToday];
    [aCoder encodeDouble:_listPrice forKey:kSHOPObjectsListPrice];
    [aCoder encodeDouble:_sourceType forKey:kSHOPObjectsSourceType];
    [aCoder encodeObject:_imageShare forKey:kSHOPObjectsImageShare];
    [aCoder encodeObject:_imageUrl forKey:kSHOPObjectsImageUrl];
    [aCoder encodeObject:_configInfo forKey:kSHOPObjectsConfigInfo];
    [aCoder encodeDouble:_shopType forKey:kSHOPObjectsShopType];
    [aCoder encodeObject:_dealSource forKey:kSHOPObjectsDealSource];
    [aCoder encodeDouble:_goodsType forKey:kSHOPObjectsGoodsType];
    [aCoder encodeObject:_originDealUrl forKey:kSHOPObjectsOriginDealUrl];
    [aCoder encodeBool:_baoyou forKey:kSHOPObjectsBaoyou];
    [aCoder encodeBool:_zhuanxiang forKey:kSHOPObjectsZhuanxiang];
    [aCoder encodeObject:_urlName forKey:kSHOPObjectsUrlName];
    [aCoder encodeDouble:_price forKey:kSHOPObjectsPrice];
    [aCoder encodeObject:_dealUrl forKey:kSHOPObjectsDealUrl];
    [aCoder encodeObject:_shortTitle forKey:kSHOPObjectsShortTitle];
    [aCoder encodeObject:_taobaoId forKey:kSHOPObjectsTaobaoId];
    [aCoder encodeBool:_fanjifen forKey:kSHOPObjectsFanjifen];
    [aCoder encodeBool:_promotion forKey:kSHOPObjectsPromotion];
    [aCoder encodeBool:_youpin forKey:kSHOPObjectsYoupin];
    [aCoder encodeObject:_wapUrl forKey:kSHOPObjectsWapUrl];
    [aCoder encodeObject:_scores forKey:kSHOPObjectsScores];
    [aCoder encodeObject:_shareUrl forKey:kSHOPObjectsShareUrl];
    [aCoder encodeObject:_title forKey:kSHOPObjectsTitle];
    [aCoder encodeDouble:_brandProductType forKey:kSHOPObjectsBrandProductType];
    [aCoder encodeDouble:_picHeight forKey:kSHOPObjectsPicHeight];
    [aCoder encodeObject:_beginTime forKey:kSHOPObjectsBeginTime];
    [aCoder encodeObject:_couponInfos forKey:kSHOPObjectsCouponInfos];
    [aCoder encodeDouble:_dealType forKey:kSHOPObjectsDealType];
    [aCoder encodeObject:_dealTypes forKey:kSHOPObjectsDealTypes];
}

- (id)copyWithZone:(NSZone *)zone
{
    SHOPObjects *copy = [[SHOPObjects alloc] init];
    
    if (copy) {

        copy.squareImage = [self.squareImage copyWithZone:zone];
        copy.salesCount = self.salesCount;
        copy.expireTime = [self.expireTime copyWithZone:zone];
        copy.oos = self.oos;
        copy.zid = [self.zid copyWithZone:zone];
        copy.themeUrl = [self.themeUrl copyWithZone:zone];
        copy.objectsIdentifier = self.objectsIdentifier;
        copy.recommendReason = [self.recommendReason copyWithZone:zone];
        copy.detailUrl = [self.detailUrl copyWithZone:zone];
        copy.huiyuangou = self.huiyuangou;
        copy.brandId = self.brandId;
        copy.picWidth = self.picWidth;
        copy.today = self.today;
        copy.listPrice = self.listPrice;
        copy.sourceType = self.sourceType;
        copy.imageShare = [self.imageShare copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.configInfo = [self.configInfo copyWithZone:zone];
        copy.shopType = self.shopType;
        copy.dealSource = [self.dealSource copyWithZone:zone];
        copy.goodsType = self.goodsType;
        copy.originDealUrl = [self.originDealUrl copyWithZone:zone];
        copy.baoyou = self.baoyou;
        copy.zhuanxiang = self.zhuanxiang;
        copy.urlName = [self.urlName copyWithZone:zone];
        copy.price = self.price;
        copy.dealUrl = [self.dealUrl copyWithZone:zone];
        copy.shortTitle = [self.shortTitle copyWithZone:zone];
        copy.taobaoId = [self.taobaoId copyWithZone:zone];
        copy.fanjifen = self.fanjifen;
        copy.promotion = self.promotion;
        copy.youpin = self.youpin;
        copy.wapUrl = [self.wapUrl copyWithZone:zone];
        copy.scores = [self.scores copyWithZone:zone];
        copy.shareUrl = [self.shareUrl copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.brandProductType = self.brandProductType;
        copy.picHeight = self.picHeight;
        copy.beginTime = [self.beginTime copyWithZone:zone];
        copy.couponInfos = [self.couponInfos copyWithZone:zone];
        copy.dealType = self.dealType;
        copy.dealTypes = [self.dealTypes copyWithZone:zone];
    }
    
    return copy;
}


@end
