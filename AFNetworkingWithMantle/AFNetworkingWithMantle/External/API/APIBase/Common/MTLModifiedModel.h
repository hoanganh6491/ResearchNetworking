
/**
 *  Description : Including object extended from MTLModel
 */
#import "MTLModel.h"
#import "MTLJSONAdapter.h"
#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"

@interface MTLModifiedModel : MTLModel <MTLJSONSerializing>

@end
