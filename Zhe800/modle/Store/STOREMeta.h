//
//  STOREMeta.h
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface STOREMeta : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double count;
@property (nonatomic, assign) BOOL hasNext;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
