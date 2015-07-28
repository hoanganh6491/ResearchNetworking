//
//  ResearchNetworkingItems.m
//
//  Created by macbook  on 7/28/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ResearchNetworkingItems.h"
#import "ResearchNetworkingMoreItems.h"


NSString *const kResearchNetworkingItemsID = @"ID";
NSString *const kResearchNetworkingItemsUserName = @"user_name";
NSString *const kResearchNetworkingItemsMoreItems = @"more_items";


@interface ResearchNetworkingItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ResearchNetworkingItems

@synthesize iDProperty = _iDProperty;
@synthesize userName = _userName;
@synthesize moreItems = _moreItems;


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
            self.iDProperty = [[self objectOrNilForKey:kResearchNetworkingItemsID fromDictionary:dict] doubleValue];
            self.userName = [self objectOrNilForKey:kResearchNetworkingItemsUserName fromDictionary:dict];
    NSObject *receivedResearchNetworkingMoreItems = [dict objectForKey:kResearchNetworkingItemsMoreItems];
    NSMutableArray *parsedResearchNetworkingMoreItems = [NSMutableArray array];
    if ([receivedResearchNetworkingMoreItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedResearchNetworkingMoreItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedResearchNetworkingMoreItems addObject:[ResearchNetworkingMoreItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedResearchNetworkingMoreItems isKindOfClass:[NSDictionary class]]) {
       [parsedResearchNetworkingMoreItems addObject:[ResearchNetworkingMoreItems modelObjectWithDictionary:(NSDictionary *)receivedResearchNetworkingMoreItems]];
    }

    self.moreItems = [NSArray arrayWithArray:parsedResearchNetworkingMoreItems];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.iDProperty] forKey:kResearchNetworkingItemsID];
    [mutableDict setValue:self.userName forKey:kResearchNetworkingItemsUserName];
    NSMutableArray *tempArrayForMoreItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.moreItems) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMoreItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMoreItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMoreItems] forKey:kResearchNetworkingItemsMoreItems];

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

    self.iDProperty = [aDecoder decodeDoubleForKey:kResearchNetworkingItemsID];
    self.userName = [aDecoder decodeObjectForKey:kResearchNetworkingItemsUserName];
    self.moreItems = [aDecoder decodeObjectForKey:kResearchNetworkingItemsMoreItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_iDProperty forKey:kResearchNetworkingItemsID];
    [aCoder encodeObject:_userName forKey:kResearchNetworkingItemsUserName];
    [aCoder encodeObject:_moreItems forKey:kResearchNetworkingItemsMoreItems];
}

- (id)copyWithZone:(NSZone *)zone
{
    ResearchNetworkingItems *copy = [[ResearchNetworkingItems alloc] init];
    
    if (copy) {

        copy.iDProperty = self.iDProperty;
        copy.userName = [self.userName copyWithZone:zone];
        copy.moreItems = [self.moreItems copyWithZone:zone];
    }
    
    return copy;
}


@end
