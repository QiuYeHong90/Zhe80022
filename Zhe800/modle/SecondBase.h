//
//  SecondBase.h
//
//  Created by mac  on 16/6/26
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SecondBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *homepromotionV3;
@property (nonatomic, strong) NSString *v6BrandTop;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
