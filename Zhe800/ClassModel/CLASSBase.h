//
//  CLASSBase.h
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLASSMeta;

@interface CLASSBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) CLASSMeta *meta;
@property (nonatomic, strong) NSArray *objects;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
