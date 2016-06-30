//
//  SCModule.h
//
//  Created by mac  on 16/6/26
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SCModule : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double moduleIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, assign) double homekey;
@property (nonatomic, strong) NSString *value;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
