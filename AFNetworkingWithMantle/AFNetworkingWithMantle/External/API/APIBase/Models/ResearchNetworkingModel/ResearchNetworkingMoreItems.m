//
//  ResearchNetworkingMoreItems.m
//
//  Created by macbook  on 7/28/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ResearchNetworkingMoreItems.h"


NSString *const kResearchNetworkingMoreItemsTitle = @"title";
NSString *const kResearchNetworkingMoreItemsID = @"ID";


@interface ResearchNetworkingMoreItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ResearchNetworkingMoreItems

@synthesize title = _title;
@synthesize iDProperty = _iDProperty;


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
            self.title = [self objectOrNilForKey:kResearchNetworkingMoreItemsTitle fromDictionary:dict];
            self.iDProperty = [[self objectOrNilForKey:kResearchNetworkingMoreItemsID fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kResearchNetworkingMoreItemsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iDProperty] forKey:kResearchNetworkingMoreItemsID];

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

    self.title = [aDecoder decodeObjectForKey:kResearchNetworkingMoreItemsTitle];
    self.iDProperty = [aDecoder decodeDoubleForKey:kResearchNetworkingMoreItemsID];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kResearchNetworkingMoreItemsTitle];
    [aCoder encodeDouble:_iDProperty forKey:kResearchNetworkingMoreItemsID];
}

- (id)copyWithZone:(NSZone *)zone
{
    ResearchNetworkingMoreItems *copy = [[ResearchNetworkingMoreItems alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.iDProperty = self.iDProperty;
    }
    
    return copy;
}


@end
