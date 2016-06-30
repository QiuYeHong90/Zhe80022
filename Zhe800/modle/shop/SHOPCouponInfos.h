//
//  SHOPCouponInfos.h
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SHOPCouponInfos : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *couponWapUrl;
@property (nonatomic, assign) double couponPrice;
@property (nonatomic, assign) double lijianPrice;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
