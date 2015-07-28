
/**
 *  Description : Including macro for API controller
 */

typedef void (^MBCallback)(BOOL success, id result);

#define DateFomatServer @"dd/MM/yyyy HH:mm:ss"
#define DateFomatClient @"dd/MM/yyyy"
#define WINDOW [[UIApplication sharedApplication] keyWindow]
#define IPHONE4 ([[UIScreen mainScreen] bounds].size.height == 480)?YES:NO
#define IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)?YES:NO

#define MBClass(_class)                 [_class class]
#define MBParams(_request)              [MTLJSONAdapter JSONDictionaryFromModel:_request]
#define MBArrayParams(_array)           [MTLJSONAdapter JSONArrayFromModels:_array]

#define MBFillMessage(obj,result)       obj.message = [MTLJSONAdapter modelOfClass:MBClass(Message) fromJSONDictionary:result[@"Message"] error:nil];
#define IS_STRING_EMPTY(str)            (!str || str == 0)
