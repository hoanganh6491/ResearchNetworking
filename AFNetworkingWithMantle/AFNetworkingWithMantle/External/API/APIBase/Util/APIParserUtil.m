
#import "APIParserUtil.h"

#import "ResearchNetworkingDataModels.h"

@implementation APIParserUtil

/**
 *  Turn json array to object array with given object class
 *
 *  @param arrJson     json array
 *  @param objectClass object class confirm to BaseModel
 *
 *  @return NSArray of given object
 */
+ (NSArray *)jsonArray:(NSArray *)arrJson toObjectArray:(Class)objectClass {
    NSMutableArray *arrObjects = [NSMutableArray new];
    for (NSDictionary *dictJson in arrJson) {
        [arrObjects addObject:[objectClass modelObjectWithDictionary:dictJson]];
    }
    return arrObjects;
}

/**
 *  Parser dictionary to Object
 *
 *  @param dictJson    NSDictionary json
 *  @param objectClass object class confirm to BaseModel
 *
 *  @return an Object
 */
+ (id)jsonDict:(NSDictionary *)dictJson toObject:(Class)objectClass {
    return [objectClass modelObjectWithDictionary:dictJson];
}

+ (id)jsonDictToResearchNetworkingModel:(NSDictionary *)dictJson {
    return [ResearchNetworkingModel modelObjectWithDictionary:dictJson];
}

@end
