//
//  SHOPBase.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SHOPBase.h"
#import "SHOPMeta.h"
#import "SHOPObjects.h"


NSString *const kSHOPBaseMeta = @"meta";
NSString *const kSHOPBaseObjects = @"objects";


@interface SHOPBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SHOPBase

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
            self.meta = [SHOPMeta modelObjectWithDictionary:[dict objectForKey:kSHOPBaseMeta]];
    NSObject *receivedSHOPObjects = [dict objectForKey:kSHOPBaseObjects];
    NSMutableArray *parsedSHOPObjects = [NSMutableArray array];
    if ([receivedSHOPObjects isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSHOPObjects) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSHOPObjects addObject:[SHOPObjects modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSHOPObjects isKindOfClass:[NSDictionary class]]) {
       [parsedSHOPObjects addObject:[SHOPObjects modelObjectWithDictionary:(NSDictionary *)receivedSHOPObjects]];
    }

    self.objects = [NSArray arrayWithArray:parsedSHOPObjects];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.meta dictionaryRepresentation] forKey:kSHOPBaseMeta];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForObjects] forKey:kSHOPBaseObjects];

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

    self.meta = [aDecoder decodeObjectForKey:kSHOPBaseMeta];
    self.objects = [aDecoder decodeObjectForKey:kSHOPBaseObjects];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_meta forKey:kSHOPBaseMeta];
    [aCoder encodeObject:_objects forKey:kSHOPBaseObjects];
}

- (id)copyWithZone:(NSZone *)zone
{
    SHOPBase *copy = [[SHOPBase alloc] init];
    
    if (copy) {

        copy.meta = [self.meta copyWithZone:zone];
        copy.objects = [self.objects copyWithZone:zone];
    }
    
    return copy;
}


@end
