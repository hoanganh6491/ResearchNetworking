
#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "ApiConstant.h"
#import "APIMacro.h"
#import "BaseUtil.h"

@interface ApiHeaderUtil : BaseUtil

/**
 *  Add header for request with url
 *
 *  @param requestManager AFHTTPRequestOperationManager
 *  @param url            Url
 */
+ (void)addHeaderForRequest:(AFHTTPRequestOperationManager *)requestManager withURL:(NSString *)url;
@end
