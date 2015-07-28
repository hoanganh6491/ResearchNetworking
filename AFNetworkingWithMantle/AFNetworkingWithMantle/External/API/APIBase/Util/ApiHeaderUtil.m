
#import "ApiHeaderUtil.h"

@implementation ApiHeaderUtil

/**
 *  Add header for request with url
 *
 *  @param requestManager AFHTTPRequestOperationManager
 *  @param url            Url
 */
+ (void)addHeaderForRequest:(AFHTTPRequestOperationManager *)requestManager withURL:(NSString *)url {
    

    // AuthorizationAppKey
    // sample [requestManager.requestSerializer setValue:AuthorizationAppKey forHTTPHeaderField:@"AuthorizationAppKey"];
    DLog(@"Header\nDeviceId : %@ \nAuthorizationAppKey : %@ \nLanguage : %@ \nAccessToken : %@ \nTimestamp : %@ \nSignature : %@",
         [requestManager.requestSerializer valueForHTTPHeaderField:@"DeviceId"],
         [requestManager.requestSerializer valueForHTTPHeaderField:@"AuthorizationAppKey"],
         [requestManager.requestSerializer valueForHTTPHeaderField:@"Language"],
         [requestManager.requestSerializer valueForHTTPHeaderField:@"AccessToken"],
         [requestManager.requestSerializer valueForHTTPHeaderField:@"Timestamp"],
         [requestManager.requestSerializer valueForHTTPHeaderField:@"Signature"]
         );
}

@end
