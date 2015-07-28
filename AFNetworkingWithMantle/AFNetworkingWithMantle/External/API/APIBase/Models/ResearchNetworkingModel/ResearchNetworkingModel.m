//
//  ResearchNetworkingModel.m
//
//  Created by macbook  on 7/28/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ResearchNetworkingModel.h"
#import "ResearchNetworkingItems.h"


NSString *const kResearchNetworkingModelTitle = @"title";
NSString *const kResearchNetworkingModelItems = @"items";


@interface ResearchNetworkingModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ResearchNetworkingModel

@synthesize title = _title;
@synthesize items = _items;


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
            self.title = [self objectOrNilForKey:kResearchNetworkingModelTitle fromDictionary:dict];
    NSObject *receivedResearchNetworkingItems = [dict objectForKey:kResearchNetworkingModelItems];
    NSMutableArray *parsedResearchNetworkingItems = [NSMutableArray array];
    if ([receivedResearchNetworkingItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedResearchNetworkingItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedResearchNetworkingItems addObject:[ResearchNetworkingItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedResearchNetworkingItems isKindOfClass:[NSDictionary class]]) {
       [parsedResearchNetworkingItems addObject:[ResearchNetworkingItems modelObjectWithDictionary:(NSDictionary *)receivedResearchNetworkingItems]];
    }

    self.items = [NSArray arrayWithArray:parsedResearchNetworkingItems];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kResearchNetworkingModelTitle];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kResearchNetworkingModelItems];

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

    self.title = [aDecoder decodeObjectForKey:kResearchNetworkingModelTitle];
    self.items = [aDecoder decodeObjectForKey:kResearchNetworkingModelItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kResearchNetworkingModelTitle];
    [aCoder encodeObject:_items forKey:kResearchNetworkingModelItems];
}

- (id)copyWithZone:(NSZone *)zone
{
    ResearchNetworkingModel *copy = [[ResearchNetworkingModel alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.items = [self.items copyWithZone:zone];
    }
    
    return copy;
}


@end
