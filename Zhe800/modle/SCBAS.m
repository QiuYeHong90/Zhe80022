//
//  SCBAS.m
//
//  Created by mac  on 16/6/26
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SCBAS.h"
#import "SCModule.h"


NSString *const kSCBASId = @"id";
NSString *const kSCBASKey = @"key";
NSString *const kSCBASModule = @"module";
NSString *const kSCBASHeight = @"height";


@interface SCBAS ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SCBAS

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize key = _key;
@synthesize module = _module;
@synthesize height = _height;


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
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:kSCBASId fromDictionary:dict] doubleValue];
            self.key = [self objectOrNilForKey:kSCBASKey fromDictionary:dict];
    NSObject *receivedSCModule = [dict objectForKey:kSCBASModule];
    NSMutableArray *parsedSCModule = [NSMutableArray array];
    if ([receivedSCModule isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSCModule) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSCModule addObject:[SCModule modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSCModule isKindOfClass:[NSDictionary class]]) {
       [parsedSCModule addObject:[SCModule modelObjectWithDictionary:(NSDictionary *)receivedSCModule]];
    }

    self.module = [NSArray arrayWithArray:parsedSCModule];
            self.height = [[self objectOrNilForKey:kSCBASHeight fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kSCBASId];
    [mutableDict setValue:self.key forKey:kSCBASKey];
    NSMutableArray *tempArrayForModule = [NSMutableArray array];
    for (NSObject *subArrayObject in self.module) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForModule addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForModule addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForModule] forKey:kSCBASModule];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kSCBASHeight];

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

    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kSCBASId];
    self.key = [aDecoder decodeObjectForKey:kSCBASKey];
    self.module = [aDecoder decodeObjectForKey:kSCBASModule];
    self.height = [aDecoder decodeDoubleForKey:kSCBASHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kSCBASId];
    [aCoder encodeObject:_key forKey:kSCBASKey];
    [aCoder encodeObject:_module forKey:kSCBASModule];
    [aCoder encodeDouble:_height forKey:kSCBASHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    SCBAS *copy = [[SCBAS alloc] init];
    
    if (copy) {

        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.key = [self.key copyWithZone:zone];
        copy.module = [self.module copyWithZone:zone];
        copy.height = self.height;
    }
    
    return copy;
}


@end
