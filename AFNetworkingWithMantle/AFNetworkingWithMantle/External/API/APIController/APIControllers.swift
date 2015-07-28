//
//  APIControllers.swift
//  AFNetworkingWithMantle
//
//  Created by  on 7/28/15.
//  Copyright (c) 2015 Framgia. All rights reserved.
//

import Foundation

class APIController: NSObject {
    class func callApiSomething(request: ResearchNetworkingRequest, callBack:MBCallback) -> AFHTTPRequestOperation {
        return ApiBusiness.getWithURL(request.requestURL, parameter: request.requestParameter, responseClass: nil, callback: { (success: Bool, result: AnyObject!) -> Void in
            if (success) {
                if let jsonResult = result as? Dictionary<String, AnyObject> {
                    var model: ResearchNetworkingModel = ResearchNetworkingModel()
                    callBack(success, APIParserUtil.jsonDict(jsonResult, toObject: ApiBusiness.castMBClass(ResearchNetworkingModel)))
                }
            } else {
                callBack(success,result)
            }
        })
    }
}