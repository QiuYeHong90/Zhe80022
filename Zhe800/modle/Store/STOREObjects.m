//
//  STOREObjects.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "STOREObjects.h"
#import "STOREImageUrl.h"
#import "STOREConfigInfo.h"
#import "STOREScores.h"
#import "STORECouponInfos.h"


NSString *const kSTOREObjectsDealType = @"deal_type";
NSString *const kSTOREObjectsSalesCount = @"sales_count";
NSString *const kSTOREObjectsExpireTime = @"expire_time";
NSString *const kSTOREObjectsDealTypes = @"deal_types";
NSString *const kSTOREObjectsZid = @"zid";
NSString *const kSTOREObjectsThemeUrl = @"theme_url";
NSString *const kSTOREObjectsId = @"id";
NSString *const kSTOREObjectsRecommendReason = @"recommend_reason";
NSString *const kSTOREObjectsDetailUrl = @"detail_url";
NSString *const kSTOREObjectsHuiyuangou = @"huiyuangou";
NSString *const kSTOREObjectsBrandId = @"brand_id";
NSString *const kSTOREObjectsPicWidth = @"pic_width";
NSString *const kSTOREObjectsToday = @"today";
NSString *const kSTOREObjectsListPrice = @"list_price";
NSString *const kSTOREObjectsSourceType = @"source_type";
NSString *const kSTOREObjectsImageShare = @"image_share";
NSString *const kSTOREObjectsImageUrl = @"image_url";
NSString *const kSTOREObjectsConfigInfo = @"config_info";
NSString *const kSTOREObjectsShopType = @"shop_type";
NSString *const kSTOREObjectsDealSource = @"deal_source";
NSString *const kSTOREObjectsGoodsType = @"goods_type";
NSString *const kSTOREObjectsOriginDealUrl = @"origin_deal_url";
NSString *const kSTOREObjectsBaoyou = @"baoyou";
NSString *const kSTOREObjectsZhuanxiang = @"zhuanxiang";
NSString *const kSTOREObjectsUrlName = @"url_name";
NSString *const kSTOREObjectsPrice = @"price";
NSString *const kSTOREObjectsShortTitle = @"short_title";
NSString *const kSTOREObjectsDealUrl = @"deal_url";
NSString *const kSTOREObjectsBrandEndTime = @"brand_end_time";
NSString *const kSTOREObjectsTaobaoId = @"taobao_id";
NSString *const kSTOREObjectsFanjifen = @"fanjifen";
NSString *const kSTOREObjectsPromotion = @"promotion";
NSString *const kSTOREObjectsYoupin = @"youpin";
NSString *const kSTOREObjectsWapUrl = @"wap_url";
NSString *const kSTOREObjectsBrandDealNum = @"brand_deal_num";
NSString *const kSTOREObjectsScores = @"scores";
NSString *const kSTOREObjectsShareUrl = @"share_url";
NSString *const kSTOREObjectsTitle = @"title";
NSString *const kSTOREObjectsBrandProductType = @"brand_product_type";
NSString *const kSTOREObjectsPicHeight = @"pic_height";
NSString *const kSTOREObjectsBeginTime = @"begin_time";
NSString *const kSTOREObjectsCouponInfos = @"coupon_infos";
NSString *const kSTOREObjectsSquareImage = @"square_image";
NSString *const kSTOREObjectsOos = @"oos";


@interface STOREObjects ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation STOREObjects

@synthesize dealType = _dealType;
@synthesize salesCount = _salesCount;
@synthesize expireTime = _expireTime;
@synthesize dealTypes = _dealTypes;
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
@synthesize shortTitle = _shortTitle;
@synthesize dealUrl = _dealUrl;
@synthesize brandEndTime = _brandEndTime;
@synthesize taobaoId = _taobaoId;
@synthesize fanjifen = _fanjifen;
@synthesize promotion = _promotion;
@synthesize youpin = _youpin;
@synthesize wapUrl = _wapUrl;
@synthesize brandDealNum = _brandDealNum;
@synthesize scores = _scores;
@synthesize shareUrl = _shareUrl;
@synthesize title = _title;
@synthesize brandProductType = _brandProductType;
@synthesize picHeight = _picHeight;
@synthesize beginTime = _beginTime;
@synthesize couponInfos = _couponInfos;
@synthesize squareImage = _squareImage;
@synthesize oos = _oos;


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
            self.dealType = [[self objectOrNilForKey:kSTOREObjectsDealType fromDictionary:dict] doubleValue];
            self.salesCount = [[self objectOrNilForKey:kSTOREObjectsSalesCount fromDictionary:dict] doubleValue];
            self.expireTime = [self objectOrNilForKey:kSTOREObjectsExpireTime fromDictionary:dict];
            self.dealTypes = [self objectOrNilForKey:kSTOREObjectsDealTypes fromDictionary:dict];
            self.zid = [self objectOrNilForKey:kSTOREObjectsZid fromDictionary:dict];
            self.themeUrl = [self objectOrNilForKey:kSTOREObjectsThemeUrl fromDictionary:dict];
            self.objectsIdentifier = [[self objectOrNilForKey:kSTOREObjectsId fromDictionary:dict] doubleValue];
            self.recommendReason = [self objectOrNilForKey:kSTOREObjectsRecommendReason fromDictionary:dict];
            self.detailUrl = [self objectOrNilForKey:kSTOREObjectsDetailUrl fromDictionary:dict];
            self.huiyuangou = [[self objectOrNilForKey:kSTOREObjectsHuiyuangou fromDictionary:dict] boolValue];
            self.brandId = [[self objectOrNilForKey:kSTOREObjectsBrandId fromDictionary:dict] doubleValue];
            self.picWidth = [[self objectOrNilForKey:kSTOREObjectsPicWidth fromDictionary:dict] doubleValue];
            self.today = [[self objectOrNilForKey:kSTOREObjectsToday fromDictionary:dict] doubleValue];
            self.listPrice = [[self objectOrNilForKey:kSTOREObjectsListPrice fromDictionary:dict] doubleValue];
            self.sourceType = [[self objectOrNilForKey:kSTOREObjectsSourceType fromDictionary:dict] doubleValue];
            self.imageShare = [self objectOrNilForKey:kSTOREObjectsImageShare fromDictionary:dict];
            self.imageUrl = [STOREImageUrl modelObjectWithDictionary:[dict objectForKey:kSTOREObjectsImageUrl]];
            self.configInfo = [STOREConfigInfo modelObjectWithDictionary:[dict objectForKey:kSTOREObjectsConfigInfo]];
            self.shopType = [[self objectOrNilForKey:kSTOREObjectsShopType fromDictionary:dict] doubleValue];
            self.dealSource = [self objectOrNilForKey:kSTOREObjectsDealSource fromDictionary:dict];
            self.goodsType = [[self objectOrNilForKey:kSTOREObjectsGoodsType fromDictionary:dict] doubleValue];
            self.originDealUrl = [self objectOrNilForKey:kSTOREObjectsOriginDealUrl fromDictionary:dict];
            self.baoyou = [[self objectOrNilForKey:kSTOREObjectsBaoyou fromDictionary:dict] boolValue];
            self.zhuanxiang = [[self objectOrNilForKey:kSTOREObjectsZhuanxiang fromDictionary:dict] boolValue];
            self.urlName = [self objectOrNilForKey:kSTOREObjectsUrlName fromDictionary:dict];
            self.price = [[self objectOrNilForKey:kSTOREObjectsPrice fromDictionary:dict] doubleValue];
            self.shortTitle = [self objectOrNilForKey:kSTOREObjectsShortTitle fromDictionary:dict];
            self.dealUrl = [self objectOrNilForKey:kSTOREObjectsDealUrl fromDictionary:dict];
            self.brandEndTime = [self objectOrNilForKey:kSTOREObjectsBrandEndTime fromDictionary:dict];
            self.taobaoId = [self objectOrNilForKey:kSTOREObjectsTaobaoId fromDictionary:dict];
            self.fanjifen = [[self objectOrNilForKey:kSTOREObjectsFanjifen fromDictionary:dict] boolValue];
            self.promotion = [[self objectOrNilForKey:kSTOREObjectsPromotion fromDictionary:dict] boolValue];
            self.youpin = [[self objectOrNilForKey:kSTOREObjectsYoupin fromDictionary:dict] boolValue];
            self.wapUrl = [self objectOrNilForKey:kSTOREObjectsWapUrl fromDictionary:dict];
            self.brandDealNum = [[self objectOrNilForKey:kSTOREObjectsBrandDealNum fromDictionary:dict] doubleValue];
            self.scores = [STOREScores modelObjectWithDictionary:[dict objectForKey:kSTOREObjectsScores]];
            self.shareUrl = [self objectOrNilForKey:kSTOREObjectsShareUrl fromDictionary:dict];
            self.title = [self objectOrNilForKey:kSTOREObjectsTitle fromDictionary:dict];
            self.brandProductType = [[self objectOrNilForKey:kSTOREObjectsBrandProductType fromDictionary:dict] doubleValue];
            self.picHeight = [[self objectOrNilForKey:kSTOREObjectsPicHeight fromDictionary:dict] doubleValue];
            self.beginTime = [self objectOrNilForKey:kSTOREObjectsBeginTime fromDictionary:dict];
            self.couponInfos = [STORECouponInfos modelObjectWithDictionary:[dict objectForKey:kSTOREObjectsCouponInfos]];
            self.squareImage = [self objectOrNilForKey:kSTOREObjectsSquareImage fromDictionary:dict];
            self.oos = [[self objectOrNilForKey:kSTOREObjectsOos fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dealType] forKey:kSTOREObjectsDealType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.salesCount] forKey:kSTOREObjectsSalesCount];
    [mutableDict setValue:self.expireTime forKey:kSTOREObjectsExpireTime];
    NSMutableArray *tempArrayForDealTypes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.dealTypes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDealTypes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDealTypes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDealTypes] forKey:kSTOREObjectsDealTypes];
    [mutableDict setValue:self.zid forKey:kSTOREObjectsZid];
    [mutableDict setValue:self.themeUrl forKey:kSTOREObjectsThemeUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.objectsIdentifier] forKey:kSTOREObjectsId];
    [mutableDict setValue:self.recommendReason forKey:kSTOREObjectsRecommendReason];
    [mutableDict setValue:self.detailUrl forKey:kSTOREObjectsDetailUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.huiyuangou] forKey:kSTOREObjectsHuiyuangou];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandId] forKey:kSTOREObjectsBrandId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.picWidth] forKey:kSTOREObjectsPicWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.today] forKey:kSTOREObjectsToday];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listPrice] forKey:kSTOREObjectsListPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceType] forKey:kSTOREObjectsSourceType];
    [mutableDict setValue:self.imageShare forKey:kSTOREObjectsImageShare];
    [mutableDict setValue:[self.imageUrl dictionaryRepresentation] forKey:kSTOREObjectsImageUrl];
    [mutableDict setValue:[self.configInfo dictionaryRepresentation] forKey:kSTOREObjectsConfigInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.shopType] forKey:kSTOREObjectsShopType];
    [mutableDict setValue:self.dealSource forKey:kSTOREObjectsDealSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsType] forKey:kSTOREObjectsGoodsType];
    [mutableDict setValue:self.originDealUrl forKey:kSTOREObjectsOriginDealUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.baoyou] forKey:kSTOREObjectsBaoyou];
    [mutableDict setValue:[NSNumber numberWithBool:self.zhuanxiang] forKey:kSTOREObjectsZhuanxiang];
    [mutableDict setValue:self.urlName forKey:kSTOREObjectsUrlName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kSTOREObjectsPrice];
    [mutableDict setValue:self.shortTitle forKey:kSTOREObjectsShortTitle];
    [mutableDict setValue:self.dealUrl forKey:kSTOREObjectsDealUrl];
    [mutableDict setValue:self.brandEndTime forKey:kSTOREObjectsBrandEndTime];
    [mutableDict setValue:self.taobaoId forKey:kSTOREObjectsTaobaoId];
    [mutableDict setValue:[NSNumber numberWithBool:self.fanjifen] forKey:kSTOREObjectsFanjifen];
    [mutableDict setValue:[NSNumber numberWithBool:self.promotion] forKey:kSTOREObjectsPromotion];
    [mutableDict setValue:[NSNumber numberWithBool:self.youpin] forKey:kSTOREObjectsYoupin];
    [mutableDict setValue:self.wapUrl forKey:kSTOREObjectsWapUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandDealNum] forKey:kSTOREObjectsBrandDealNum];
    [mutableDict setValue:[self.scores dictionaryRepresentation] forKey:kSTOREObjectsScores];
    [mutableDict setValue:self.shareUrl forKey:kSTOREObjectsShareUrl];
    [mutableDict setValue:self.title forKey:kSTOREObjectsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandProductType] forKey:kSTOREObjectsBrandProductType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.picHeight] forKey:kSTOREObjectsPicHeight];
    [mutableDict setValue:self.beginTime forKey:kSTOREObjectsBeginTime];
    [mutableDict setValue:[self.couponInfos dictionaryRepresentation] forKey:kSTOREObjectsCouponInfos];
    [mutableDict setValue:self.squareImage forKey:kSTOREObjectsSquareImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.oos] forKey:kSTOREObjectsOos];

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

    self.dealType = [aDecoder decodeDoubleForKey:kSTOREObjectsDealType];
    self.salesCount = [aDecoder decodeDoubleForKey:kSTOREObjectsSalesCount];
    self.expireTime = [aDecoder decodeObjectForKey:kSTOREObjectsExpireTime];
    self.dealTypes = [aDecoder decodeObjectForKey:kSTOREObjectsDealTypes];
    self.zid = [aDecoder decodeObjectForKey:kSTOREObjectsZid];
    self.themeUrl = [aDecoder decodeObjectForKey:kSTOREObjectsThemeUrl];
    self.objectsIdentifier = [aDecoder decodeDoubleForKey:kSTOREObjectsId];
    self.recommendReason = [aDecoder decodeObjectForKey:kSTOREObjectsRecommendReason];
    self.detailUrl = [aDecoder decodeObjectForKey:kSTOREObjectsDetailUrl];
    self.huiyuangou = [aDecoder decodeBoolForKey:kSTOREObjectsHuiyuangou];
    self.brandId = [aDecoder decodeDoubleForKey:kSTOREObjectsBrandId];
    self.picWidth = [aDecoder decodeDoubleForKey:kSTOREObjectsPicWidth];
    self.today = [aDecoder decodeDoubleForKey:kSTOREObjectsToday];
    self.listPrice = [aDecoder decodeDoubleForKey:kSTOREObjectsListPrice];
    self.sourceType = [aDecoder decodeDoubleForKey:kSTOREObjectsSourceType];
    self.imageShare = [aDecoder decodeObjectForKey:kSTOREObjectsImageShare];
    self.imageUrl = [aDecoder decodeObjectForKey:kSTOREObjectsImageUrl];
    self.configInfo = [aDecoder decodeObjectForKey:kSTOREObjectsConfigInfo];
    self.shopType = [aDecoder decodeDoubleForKey:kSTOREObjectsShopType];
    self.dealSource = [aDecoder decodeObjectForKey:kSTOREObjectsDealSource];
    self.goodsType = [aDecoder decodeDoubleForKey:kSTOREObjectsGoodsType];
    self.originDealUrl = [aDecoder decodeObjectForKey:kSTOREObjectsOriginDealUrl];
    self.baoyou = [aDecoder decodeBoolForKey:kSTOREObjectsBaoyou];
    self.zhuanxiang = [aDecoder decodeBoolForKey:kSTOREObjectsZhuanxiang];
    self.urlName = [aDecoder decodeObjectForKey:kSTOREObjectsUrlName];
    self.price = [aDecoder decodeDoubleForKey:kSTOREObjectsPrice];
    self.shortTitle = [aDecoder decodeObjectForKey:kSTOREObjectsShortTitle];
    self.dealUrl = [aDecoder decodeObjectForKey:kSTOREObjectsDealUrl];
    self.brandEndTime = [aDecoder decodeObjectForKey:kSTOREObjectsBrandEndTime];
    self.taobaoId = [aDecoder decodeObjectForKey:kSTOREObjectsTaobaoId];
    self.fanjifen = [aDecoder decodeBoolForKey:kSTOREObjectsFanjifen];
    self.promotion = [aDecoder decodeBoolForKey:kSTOREObjectsPromotion];
    self.youpin = [aDecoder decodeBoolForKey:kSTOREObjectsYoupin];
    self.wapUrl = [aDecoder decodeObjectForKey:kSTOREObjectsWapUrl];
    self.brandDealNum = [aDecoder decodeDoubleForKey:kSTOREObjectsBrandDealNum];
    self.scores = [aDecoder decodeObjectForKey:kSTOREObjectsScores];
    self.shareUrl = [aDecoder decodeObjectForKey:kSTOREObjectsShareUrl];
    self.title = [aDecoder decodeObjectForKey:kSTOREObjectsTitle];
    self.brandProductType = [aDecoder decodeDoubleForKey:kSTOREObjectsBrandProductType];
    self.picHeight = [aDecoder decodeDoubleForKey:kSTOREObjectsPicHeight];
    self.beginTime = [aDecoder decodeObjectForKey:kSTOREObjectsBeginTime];
    self.couponInfos = [aDecoder decodeObjectForKey:kSTOREObjectsCouponInfos];
    self.squareImage = [aDecoder decodeObjectForKey:kSTOREObjectsSquareImage];
    self.oos = [aDecoder decodeDoubleForKey:kSTOREObjectsOos];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_dealType forKey:kSTOREObjectsDealType];
    [aCoder encodeDouble:_salesCount forKey:kSTOREObjectsSalesCount];
    [aCoder encodeObject:_expireTime forKey:kSTOREObjectsExpireTime];
    [aCoder encodeObject:_dealTypes forKey:kSTOREObjectsDealTypes];
    [aCoder encodeObject:_zid forKey:kSTOREObjectsZid];
    [aCoder encodeObject:_themeUrl forKey:kSTOREObjectsThemeUrl];
    [aCoder encodeDouble:_objectsIdentifier forKey:kSTOREObjectsId];
    [aCoder encodeObject:_recommendReason forKey:kSTOREObjectsRecommendReason];
    [aCoder encodeObject:_detailUrl forKey:kSTOREObjectsDetailUrl];
    [aCoder encodeBool:_huiyuangou forKey:kSTOREObjectsHuiyuangou];
    [aCoder encodeDouble:_brandId forKey:kSTOREObjectsBrandId];
    [aCoder encodeDouble:_picWidth forKey:kSTOREObjectsPicWidth];
    [aCoder encodeDouble:_today forKey:kSTOREObjectsToday];
    [aCoder encodeDouble:_listPrice forKey:kSTOREObjectsListPrice];
    [aCoder encodeDouble:_sourceType forKey:kSTOREObjectsSourceType];
    [aCoder encodeObject:_imageShare forKey:kSTOREObjectsImageShare];
    [aCoder encodeObject:_imageUrl forKey:kSTOREObjectsImageUrl];
    [aCoder encodeObject:_configInfo forKey:kSTOREObjectsConfigInfo];
    [aCoder encodeDouble:_shopType forKey:kSTOREObjectsShopType];
    [aCoder encodeObject:_dealSource forKey:kSTOREObjectsDealSource];
    [aCoder encodeDouble:_goodsType forKey:kSTOREObjectsGoodsType];
    [aCoder encodeObject:_originDealUrl forKey:kSTOREObjectsOriginDealUrl];
    [aCoder encodeBool:_baoyou forKey:kSTOREObjectsBaoyou];
    [aCoder encodeBool:_zhuanxiang forKey:kSTOREObjectsZhuanxiang];
    [aCoder encodeObject:_urlName forKey:kSTOREObjectsUrlName];
    [aCoder encodeDouble:_price forKey:kSTOREObjectsPrice];
    [aCoder encodeObject:_shortTitle forKey:kSTOREObjectsShortTitle];
    [aCoder encodeObject:_dealUrl forKey:kSTOREObjectsDealUrl];
    [aCoder encodeObject:_brandEndTime forKey:kSTOREObjectsBrandEndTime];
    [aCoder encodeObject:_taobaoId forKey:kSTOREObjectsTaobaoId];
    [aCoder encodeBool:_fanjifen forKey:kSTOREObjectsFanjifen];
    [aCoder encodeBool:_promotion forKey:kSTOREObjectsPromotion];
    [aCoder encodeBool:_youpin forKey:kSTOREObjectsYoupin];
    [aCoder encodeObject:_wapUrl forKey:kSTOREObjectsWapUrl];
    [aCoder encodeDouble:_brandDealNum forKey:kSTOREObjectsBrandDealNum];
    [aCoder encodeObject:_scores forKey:kSTOREObjectsScores];
    [aCoder encodeObject:_shareUrl forKey:kSTOREObjectsShareUrl];
    [aCoder encodeObject:_title forKey:kSTOREObjectsTitle];
    [aCoder encodeDouble:_brandProductType forKey:kSTOREObjectsBrandProductType];
    [aCoder encodeDouble:_picHeight forKey:kSTOREObjectsPicHeight];
    [aCoder encodeObject:_beginTime forKey:kSTOREObjectsBeginTime];
    [aCoder encodeObject:_couponInfos forKey:kSTOREObjectsCouponInfos];
    [aCoder encodeObject:_squareImage forKey:kSTOREObjectsSquareImage];
    [aCoder encodeDouble:_oos forKey:kSTOREObjectsOos];
}

- (id)copyWithZone:(NSZone *)zone
{
    STOREObjects *copy = [[STOREObjects alloc] init];
    
    if (copy) {

        copy.dealType = self.dealType;
        copy.salesCount = self.salesCount;
        copy.expireTime = [self.expireTime copyWithZone:zone];
        copy.dealTypes = [self.dealTypes copyWithZone:zone];
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
        copy.shortTitle = [self.shortTitle copyWithZone:zone];
        copy.dealUrl = [self.dealUrl copyWithZone:zone];
        copy.brandEndTime = [self.brandEndTime copyWithZone:zone];
        copy.taobaoId = [self.taobaoId copyWithZone:zone];
        copy.fanjifen = self.fanjifen;
        copy.promotion = self.promotion;
        copy.youpin = self.youpin;
        copy.wapUrl = [self.wapUrl copyWithZone:zone];
        copy.brandDealNum = self.brandDealNum;
        copy.scores = [self.scores copyWithZone:zone];
        copy.shareUrl = [self.shareUrl copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.brandProductType = self.brandProductType;
        copy.picHeight = self.picHeight;
        copy.beginTime = [self.beginTime copyWithZone:zone];
        copy.couponInfos = [self.couponInfos copyWithZone:zone];
        copy.squareImage = [self.squareImage copyWithZone:zone];
        copy.oos = self.oos;
    }
    
    return copy;
}


@end
