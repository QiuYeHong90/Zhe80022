//
//  STOREScores.m
//
//  Created by mac  on 16/6/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "STOREScores.h"


NSString *const kSTOREScoresZ2 = @"z2";
NSString *const kSTOREScoresZ5 = @"z5";
NSString *const kSTOREScoresZ1 = @"z1";
NSString *const kSTOREScoresZ4 = @"z4";
NSString *const kSTOREScoresZ0 = @"z0";
NSString *const kSTOREScoresZ3 = @"z3";


@interface STOREScores ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation STOREScores

@synthesize z2 = _z2;
@synthesize z5 = _z5;
@synthesize z1 = _z1;
@synthesize z4 = _z4;
@synthesize z0 = _z0;
@synthesize z3 = _z3;


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
            self.z2 = [[self objectOrNilForKey:kSTOREScoresZ2 fromDictionary:dict] doubleValue];
            self.z5 = [[self objectOrNilForKey:kSTOREScoresZ5 fromDictionary:dict] doubleValue];
            self.z1 = [[self objectOrNilForKey:kSTOREScoresZ1 fromDictionary:dict] doubleValue];
            self.z4 = [[self objectOrNilForKey:kSTOREScoresZ4 fromDictionary:dict] doubleValue];
            self.z0 = [[self objectOrNilForKey:kSTOREScoresZ0 fromDictionary:dict] doubleValue];
            self.z3 = [[self objectOrNilForKey:kSTOREScoresZ3 fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.z2] forKey:kSTOREScoresZ2];
    [mutableDict setValue:[NSNumber numberWithDouble:self.z5] forKey:kSTOREScoresZ5];
    [mutableDict setValue:[NSNumber numberWithDouble:self.z1] forKey:kSTOREScoresZ1];
    [mutableDict setValue:[NSNumber numberWithDouble:self.z4] forKey:kSTOREScoresZ4];
    [mutableDict setValue:[NSNumber numberWithDouble:self.z0] forKey:kSTOREScoresZ0];
    [mutableDict setValue:[NSNumber numberWithDouble:self.z3] forKey:kSTOREScoresZ3];

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

    self.z2 = [aDecoder decodeDoubleForKey:kSTOREScoresZ2];
    self.z5 = [aDecoder decodeDoubleForKey:kSTOREScoresZ5];
    self.z1 = [aDecoder decodeDoubleForKey:kSTOREScoresZ1];
    self.z4 = [aDecoder decodeDoubleForKey:kSTOREScoresZ4];
    self.z0 = [aDecoder decodeDoubleForKey:kSTOREScoresZ0];
    self.z3 = [aDecoder decodeDoubleForKey:kSTOREScoresZ3];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_z2 forKey:kSTOREScoresZ2];
    [aCoder encodeDouble:_z5 forKey:kSTOREScoresZ5];
    [aCoder encodeDouble:_z1 forKey:kSTOREScoresZ1];
    [aCoder encodeDouble:_z4 forKey:kSTOREScoresZ4];
    [aCoder encodeDouble:_z0 forKey:kSTOREScoresZ0];
    [aCoder encodeDouble:_z3 forKey:kSTOREScoresZ3];
}

- (id)copyWithZone:(NSZone *)zone
{
    STOREScores *copy = [[STOREScores alloc] init];
    
    if (copy) {

        copy.z2 = self.z2;
        copy.z5 = self.z5;
        copy.z1 = self.z1;
        copy.z4 = self.z4;
        copy.z0 = self.z0;
        copy.z3 = self.z3;
    }
    
    return copy;
}


@end
