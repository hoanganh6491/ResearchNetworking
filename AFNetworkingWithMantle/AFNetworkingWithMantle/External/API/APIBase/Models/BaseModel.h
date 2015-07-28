
/**
 *  Description : Base class for model
 */


#import "MTLModifiedModel.h"

@interface BaseModel : MTLModifiedModel
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;
- (NSString *)description;

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;
@end
