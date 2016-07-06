//
//  CLASSBase.m
//
//  Created by mac  on 16/7/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CLASSBase.h"
#import "CLASSMeta.h"
#import "CLASSObjects.h"


NSString *const kCLASSBaseMeta = @"meta";
NSString *const kCLASSBaseObjects = @"objects";


@interface CLASSBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLASSBase

@synthesize meta = _meta;
@synthesize objects = _objects;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.meta = [CLASSMeta modelObjectWithDictionary:[dict objectForKey:kCLASSBaseMeta]];
    NSObject *receivedCLASSObjects = [dict objectForKey:kCLASSBaseObjects];
    NSMutableArray *parsedCLASSObjects = [NSMutableArray array];
    if ([receivedCLASSObjects isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCLASSObjects) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCLASSObjects addObject:[CLASSObjects modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCLASSObjects isKindOfClass:[NSDictionary class]]) {
       [parsedCLASSObjects addObject:[CLASSObjects modelObjectWithDictionary:(NSDictionary *)receivedCLASSObjects]];
    }

    self.objects = [NSArray arrayWithArray:parsedCLASSObjects];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.meta dictionaryRepresentation] forKey:kCLASSBaseMeta];
    NSMutableArray *tempArrayForObjects = [NSMutableArray array];
    for (NSObject *subArrayObject in self.objects) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForObjects addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForObjects addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForObjects] forKey:kCLASSBaseObjects];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.meta = [aDecoder decodeObjectForKey:kCLASSBaseMeta];
    self.objects = [aDecoder decodeObjectForKey:kCLASSBaseObjects];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_meta forKey:kCLASSBaseMeta];
    [aCoder encodeObject:_objects forKey:kCLASSBaseObjects];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLASSBase *copy = [[CLASSBase alloc] init];
    
    if (copy) {

        copy.meta = [self.meta copyWithZone:zone];
        copy.objects = [self.objects copyWithZone:zone];
    }
    
    return copy;
}


@end
