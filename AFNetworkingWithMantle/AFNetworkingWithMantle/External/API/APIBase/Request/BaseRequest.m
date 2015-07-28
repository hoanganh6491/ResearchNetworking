
#import "BaseRequest.h"

@implementation BaseRequest

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    // override this in the model if property names in JSON don't match model
    return @{};
}
@end
