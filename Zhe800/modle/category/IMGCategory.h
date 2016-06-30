//
//  IMGCategory.h
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface IMGCategory : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *categoryDesc;
@property (nonatomic, strong) NSString *query;
@property (nonatomic, assign) double specialTag;
@property (nonatomic, assign) double tagId;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, assign) double level;
@property (nonatomic, assign) double isMuying;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *urlName;
@property (nonatomic, assign) double nowCount;
@property (nonatomic, strong) NSString *parentUrlName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
