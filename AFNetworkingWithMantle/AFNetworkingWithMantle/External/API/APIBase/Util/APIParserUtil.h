#import "BaseUtil.h"
#import "BaseModel.h"

@interface APIParserUtil : BaseUtil

/**
 *  Turn json array to object array with given object class
 *
 *  @param arrJson     json array
 *  @param objectClass object class confirm to BaseModel
 *
 *  @return NSArray of given object
 */
+ (NSArray *)jsonArray:(NSArray *)arrJson toObjectArray:(id)objectClass;


/**
 *  Parser dictionary to Object
 *
 *  @param dictJson    NSDictionary json
 *  @param objectClass object class confirm to BaseModel
 *
 *  @return an Object
 */
+ (id)jsonDict:(NSDictionary *)dictJson toObject:(Class)objectClass;

+ (id)jsonDictToResearchNetworkingModel:(NSDictionary *)dictJson;

@end
