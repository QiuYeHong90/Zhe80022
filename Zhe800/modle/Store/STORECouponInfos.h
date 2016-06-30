//
//  STORECouponInfos.h
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface STORECouponInfos : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double lijianPrice;
@property (nonatomic, assign) double couponPrice;
@property (nonatomic, strong) NSString *couponWapUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
