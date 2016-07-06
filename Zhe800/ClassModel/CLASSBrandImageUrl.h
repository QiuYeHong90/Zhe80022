//
//  CLASSBrandImageUrl.h
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CLASSBrandImageUrl : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *big;
@property (nonatomic, strong) NSString *small;
@property (nonatomic, strong) NSString *normal;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
