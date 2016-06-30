//
//  STOREBase.h
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class STOREMeta;

@interface STOREBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) STOREMeta *meta;
@property (nonatomic, strong) NSArray *objects;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
