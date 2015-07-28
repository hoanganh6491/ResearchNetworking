
/**
 *  Description : Including main method for working with server
 */

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Reachability.h"
#import "ApiConstant.h"
#import "ApiHeaderUtil.h"
#import "APIMacro.h"
#import "MTLJSONAdapter.h"
#import "APIParserUtil.h"

#import "BaseModel.h"
#import "BaseRequest.h"
#import "BaseResponse.h"

#import "MTLModifiedModel.h"

#import "MBProgressHUD.h"

typedef void (^PostPathSuccess)(AFHTTPRequestOperation *, id);
typedef void (^PostPathFailure)(AFHTTPRequestOperation *, NSError *);

@interface ApiBusiness : NSObject

+ (Class) castMBClass:(Class)obj;

/**
 *  Call a POST request with params -> parser response data -> call callback to send data
 *
 *  @param url           url of this request
 *  @param params        NSDictionary/NSArray params
 *  @param responseClass a class of response
 *  @param callBack      a MBCallback
 */
+ (AFHTTPRequestOperation *)postWithURL:(NSString *)url parameter:(id)params responseClass:(Class)responseClass callback:(MBCallback)callBack;


/**
 *  Call a POST request with params -> parser response data -> call callback to send data
 *
 *  @param url           url of this request
 *  @param params        NSDictionary/NSArray params
 *  @param progressHud   a MBProgressHUD to show progress
 *  @param responseClass a class of response
 *  @param callBack      a MBCallback
 */
+ (AFHTTPRequestOperation *)postWithURL:(NSString *)url
                              parameter:(id)params
                                    hud:(MBProgressHUD*)progressHud
                          responseClass:(Class)responseClass
                               callback:(MBCallback)callBack;

+ (AFHTTPRequestOperation *)postWithURLNoFormData:(NSString *)url
                                        parameter:(id)params
                                    responseClass:(Class)responseClass
                                         callback:(MBCallback)callBack;

/**
 *  Call a GET request with params -> parser response data -> call callback to send data
 *
 *  @param url           url of this request
 *  @param params        NSDictionary/NSArray params
 *  @param responseClass a class of response
 *  @param callBack      a MBCallback
 */
+ (AFHTTPRequestOperation *)getWithURL:(NSString *)url
                             parameter:(id)params
                         responseClass:(Class)responseClass
                              callback:(MBCallback)callBack;

@end
