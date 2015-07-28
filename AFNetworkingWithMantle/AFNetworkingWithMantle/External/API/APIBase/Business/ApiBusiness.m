
#import "ApiBusiness.h"

@implementation ApiBusiness
+ (Class)castMBClass:(Class)obj {return MBClass(obj);}

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
                               callback:(MBCallback)callBack {
    
    // handle network
    NetworkStatus networkStatus = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        callBack(NO, [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorNotConnectedToInternet userInfo:nil]);
        return nil;
    }
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //Logging
    DLog(@"url : %@ \n params:%@", url, params);
    
    // header
    //[ApiHeaderUtil addHeaderForRequest:manager withURL:url];
    
    if ([params isKindOfClass:MBClass(NSArray)]) {
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    AFHTTPRequestOperation *operation = [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        for (NSString *strKey in params) {
            id paramValue = params[strKey];
            if ([paramValue isKindOfClass:MBClass(NSData)]) {
                [formData appendPartWithFileData:paramValue
                                            name:strKey
                                        fileName:@"image.png"
                                        mimeType:@"image/png"];
            }
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        DLog(@"url: %@\n response %@", url, [responseObject description]);
        
        // Parser in Business layer manual
        if (!responseClass) {
            callBack(YES, responseObject);
            return;
        }
        
        // auto parser using MTL
        NSError *error = nil;
        id response = nil;
        if ([responseObject isKindOfClass:[NSArray class]]) {
            response = [MTLJSONAdapter modelsOfClass:[responseClass class] fromJSONArray:responseObject error:&error];
        }
        else {
            response = [MTLJSONAdapter modelOfClass:[responseClass class] fromJSONDictionary:responseObject error:&error];
        }
        
        if (!error) {
            callBack(YES, response);
        }
        else {
            callBack(NO, error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"Url: %@\n Error: %@\n response %@", url, error, operation.responseObject);
        
        if ([operation.responseObject isKindOfClass:[NSDictionary class]]) {
            callBack(NO, operation.responseObject);
        }
        else {
            callBack(NO, error);
        }
    }];
    
    // 4. Set the progress block of the operation.
    [operation setUploadProgressBlock:^(NSUInteger __unused bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
        if (progressHud) {
            progressHud.mode = MBProgressHUDModeAnnularDeterminate;
            float percentDone = (float)totalBytesWritten / (float)totalBytesExpectedToWrite;
            progressHud.progress = percentDone;
            DLog(@"progress %f", percentDone);
        }
    }];
    
    // 5. Begin!
    [operation start];
    
    return operation;
    
}


/**
 *  Call a Post request with params -> parser response data -> call callback to send data
 *
 *  @param url           url of this request
 *  @param params        NSDictionary/NSArray params
 *  @param responseClass a class of response
 *  @param callBack      a MBCallback
 */
+ (AFHTTPRequestOperation *)postWithURL:(NSString *)url
                              parameter:(id)params
                          responseClass:(Class)responseClass
                               callback:(MBCallback)callBack {
    return [ApiBusiness postWithURL:url parameter:params hud:nil responseClass:responseClass callback:callBack];
}

+ (AFHTTPRequestOperation *)getWithURL:(NSString *)url
                             parameter:(id)params
                         responseClass:(Class)responseClass
                              callback:(MBCallback)callBack {
	// handle network
	NetworkStatus networkStatus = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
	if (networkStatus == NotReachable) {
		callBack(NO, kString_NotReachable);
		return nil;
	}
    
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    /**
     *  Not used
        TODO: in case needed
     */
	// header
//	[ApiHeaderUtil addHeaderForRequest:manager withURL:url];

	if ([params isKindOfClass:MBClass(NSArray)]) {
		manager.requestSerializer = [AFJSONRequestSerializer serializer];
	}
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    DLog(@"url : %@ \n params:%@", url, params);
    
	return [manager GET:url parameters:params success: ^(AFHTTPRequestOperation *operation, id responseObject) {
	    //Logging
//        DLog(@"url: %@\n response %@", url, [responseObject description]);

	    // Parser in Business layer manual
	    if (!responseClass) {
	        callBack(YES, responseObject);
	        return;
		}

	    // auto parser using MTL
	    NSError *error = nil;
	    id response = nil;
	    if ([responseObject isKindOfClass:[NSArray class]]) {
	        response = [MTLJSONAdapter modelsOfClass:[responseClass class] fromJSONArray:responseObject error:&error];
		}
	    else {
	        response = [MTLJSONAdapter modelOfClass:[responseClass class] fromJSONDictionary:responseObject error:&error];
		}

	    if (!error) {
	        callBack(YES, response);
		}
	    else {
	        callBack(NO, error);
		}
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    //Logging
	    DLog(@"Url: %@\n Error: %@\n response %@", url, error, operation.responseObject);

	    if ([operation.responseObject isKindOfClass:[NSDictionary class]]) {
	        callBack(NO, operation.responseObject);
		}
	    else {
	        callBack(NO, error);
		}
	}];
}

@end
