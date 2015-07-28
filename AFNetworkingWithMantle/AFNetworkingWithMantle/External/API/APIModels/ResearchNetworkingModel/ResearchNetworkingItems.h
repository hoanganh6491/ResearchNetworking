//
//  ResearchNetworkingItems.h
//
//  Created by macbook  on 7/28/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ResearchNetworkingItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double iDProperty;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSArray *moreItems;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
