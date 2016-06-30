//
//  STOREScores.h
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface STOREScores : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double z2;
@property (nonatomic, assign) double z5;
@property (nonatomic, assign) double z1;
@property (nonatomic, assign) double z4;
@property (nonatomic, assign) double z0;
@property (nonatomic, assign) double z3;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
