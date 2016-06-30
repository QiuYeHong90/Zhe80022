//
//  SCModule.m
//
//  Created by mac  on 16/6/26
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SCModule.h"


NSString *const kSCModuleId = @"id";
NSString *const kSCModuleTitle = @"title";
NSString *const kSCModulePic = @"pic";
NSString *const kSCModuleHomekey = @"homekey";
NSString *const kSCModuleValue = @"value";


@interface SCModule ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SCModule

@synthesize moduleIdentifier = _moduleIdentifier;
@synthesize title = _title;
@synthesize pic = _pic;
@synthesize homekey = _homekey;
@synthesize value = _value;


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
            self.moduleIdentifier = [[self objectOrNilForKey:kSCModuleId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kSCModuleTitle fromDictionary:dict];
            self.pic = [self objectOrNilForKey:kSCModulePic fromDictionary:dict];
            self.homekey = [[self objectOrNilForKey:kSCModuleHomekey fromDictionary:dict] doubleValue];
            self.value = [self objectOrNilForKey:kSCModuleValue fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.moduleIdentifier] forKey:kSCModuleId];
    [mutableDict setValue:self.title forKey:kSCModuleTitle];
    [mutableDict setValue:self.pic forKey:kSCModulePic];
    [mutableDict setValue:[NSNumber numberWithDouble:self.homekey] forKey:kSCModuleHomekey];
    [mutableDict setValue:self.value forKey:kSCModuleValue];

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

    self.moduleIdentifier = [aDecoder decodeDoubleForKey:kSCModuleId];
    self.title = [aDecoder decodeObjectForKey:kSCModuleTitle];
    self.pic = [aDecoder decodeObjectForKey:kSCModulePic];
    self.homekey = [aDecoder decodeDoubleForKey:kSCModuleHomekey];
    self.value = [aDecoder decodeObjectForKey:kSCModuleValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_moduleIdentifier forKey:kSCModuleId];
    [aCoder encodeObject:_title forKey:kSCModuleTitle];
    [aCoder encodeObject:_pic forKey:kSCModulePic];
    [aCoder encodeDouble:_homekey forKey:kSCModuleHomekey];
    [aCoder encodeObject:_value forKey:kSCModuleValue];
}

- (id)copyWithZone:(NSZone *)zone
{
    SCModule *copy = [[SCModule alloc] init];
    
    if (copy) {

        copy.moduleIdentifier = self.moduleIdentifier;
        copy.title = [self.title copyWithZone:zone];
        copy.pic = [self.pic copyWithZone:zone];
        copy.homekey = self.homekey;
        copy.value = [self.value copyWithZone:zone];
    }
    
    return copy;
}


@end
