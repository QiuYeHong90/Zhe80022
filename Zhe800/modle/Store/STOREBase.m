//
//  STOREBase.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "STOREBase.h"
#import "STOREMeta.h"
#import "STOREObjects.h"


NSString *const kSTOREBaseMeta = @"meta";
NSString *const kSTOREBaseObjects = @"objects";


@interface STOREBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation STOREBase

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
            self.meta = [STOREMeta modelObjectWithDictionary:[dict objectForKey:kSTOREBaseMeta]];
    NSObject *receivedSTOREObjects = [dict objectForKey:kSTOREBaseObjects];
    NSMutableArray *parsedSTOREObjects = [NSMutableArray array];
    if ([receivedSTOREObjects isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSTOREObjects) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSTOREObjects addObject:[STOREObjects modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSTOREObjects isKindOfClass:[NSDictionary class]]) {
       [parsedSTOREObjects addObject:[STOREObjects modelObjectWithDictionary:(NSDictionary *)receivedSTOREObjects]];
    }

    self.objects = [NSArray arrayWithArray:parsedSTOREObjects];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.meta dictionaryRepresentation] forKey:kSTOREBaseMeta];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForObjects] forKey:kSTOREBaseObjects];

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

    self.meta = [aDecoder decodeObjectForKey:kSTOREBaseMeta];
    self.objects = [aDecoder decodeObjectForKey:kSTOREBaseObjects];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_meta forKey:kSTOREBaseMeta];
    [aCoder encodeObject:_objects forKey:kSTOREBaseObjects];
}

- (id)copyWithZone:(NSZone *)zone
{
    STOREBase *copy = [[STOREBase alloc] init];
    
    if (copy) {

        copy.meta = [self.meta copyWithZone:zone];
        copy.objects = [self.objects copyWithZone:zone];
    }
    
    return copy;
}


@end
