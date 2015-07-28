
/**
 *  Description :  Including Application constant
 */


// Api domain
#define API_MAIN_URL            @"http://service.vanphongonline.vn"

#define API_LOGIN_URL           @""API_MAIN_URL"?app_token=adef214324abcef&device=true&service=mobile&action=login&is_app=1&"



#pragma mark- API response CODE
#define API_ERROR_CODE_203      203
#define API_ERROR_CODE_200      200

#define kString_NotReachable        @"NotReachable"


#pragma mark- API HASH LINK
#define API_HASH_LINK_SETUP                 @"/appcrm/setup?"
#define API_HASH_LINK_LIST_CUSTOMER         @"/appcrm/customer?"
#define API_HASH_LINK_LIST_CUSTOMER_OTHER   @"/appcrm/customer/listother?"
#define API_HASH_LINK_LIST_STORAGE          @"/appcrm/inventory/view?"
#define API_HASH_LINK_LIST_BILL             @"/appcrm/purchase?"
#define API_HASH_LINK_LIST_NOTE             @"/appcrm/note?"

#define API_HASH_LINK_ADD_NEW_CUSTOMER      @"/appcrm/customer/add?"
#define API_HASH_LINK_ADD_NEW_PURCHASE      @"/appcrm/purchase/add?"
#define API_HASH_LINK_LIST_DISCOUNT         @"/appcrm/marketing?"
#define API_HASH_LINK_PURCHASE_ITEM         @"/appcrm/purchase/view?"

#define API_HASH_LINK_ADD_NEW_TAKE_NOTE     @"/appcrm/note/add?"
#define API_HASH_LINK_REPORT_ADD            @"/appcrm/report?"

#define API_HASH_LINK_START_AT_RESELLER     @"/appcrm/supplier/start?"

#define API_HASH_LINK_UPDATE_CUSTOMER_LOCATION     @"/appcrm/customer/location?"

#define API_HASH_LINK_CUSTOMER_DETAIL       @"/appcrm/customer/view?"

#define API_HASH_LINK_PURCHASE_DELETE       @"/appcrm/purchase/delete?"

#define API_HASH_LINK_REPORT_STORAGE        @"/appcrm/inventory/add?"

#define API_HASH_LINK_PURCHASE_EDIT         @"/appcrm/purchase/edit?"

