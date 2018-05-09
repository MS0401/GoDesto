import Foundation
import UIKit
struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}
struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    
    static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
}

let STRING_SUCCESS = ""
let STRING_UNEXPECTED_ERROR = ""

let ERROR_NO_NETWORK = "Internet connection is currently unavailable."
let FILL_ALL_FIELDS_MESSAGE = "Please fill all fields"
let FAILED_MESSAGE = "Failed Please Try Again!"
let ENTER_EMAIL_MESSAGE = "Please enter email"
let MEMBER_REGISTERED_MESSAGE = "Member Registerd Successfully"
let VALID_PHONE_MESSAGE = "Please enter valid phone number"
let VALID_EMAIL_MESSAGE = "Please enter valid email"
let VALID_CNIC_MESSAGE = "Please enter valid CNIC"
let VALID_PASSWORD_MESSAGE = "Password and confirm password must be same"
let VALID_LOCATION_MESSAGE = "Please select both Locations"
let PROFILE_UPDATED_MESSAGE = "Profile Updated Successfuly"
let MESSAGE = "Message"


let DailyNewsletter1 = "Daily - "
let DailyNewsletter2 = "Get dail recommendations and deals"

let Weekly_Newsletter_1 = "Weekly - "
let Weekly_Newsletter_2 = "One personalised emails packed with offers"

let NotInterested_Newsletter_1 = "Not Interested - "
let NotInterested_Newsletter_2 = "If you're not in to deals emails select this option "


let FB_NOT_INSTALLED_MESSAGE = "Could not found a installed app 'Facebook' to proceed with sharing."
let TWITTER_NOT_INSTALLED_MESSAGE = "Could not found a installed app 'Twitter' to proceed with sharing."
let INSTA_NOT_INSTALLED_MESSAGE = "Please install the instagram application"
let WHATSAPP_NOT_INSTALLED_MESSAGE = "Could not found a installed app 'Whatsapp' to proceed with sharing."

let EMAIL_REGULAR_EXPRESSION = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

let COPIED_TO_CLIP_BOARD = "Copied to Clip Board"


let KEEP_LOGIN = "keepLogin"
let IS_USER_LOGIN = "isUSerLogin"
let LOGIN_KEY = "login"
let TOKEN_KEY = "token"

struct FontName {
    static let munaRegular = "Muna"
    static let munaBold = "MunaBold"
    static let munaBlack = "MunaBlack"
    static let helveticaNeueRegular = "HelveticaNeue"
    static let helveticaMediam = "HelveticaNeue-Medium"
    static let helveticaBold = "HelveticaNeue-Bold"
    static let MyriadProBold = "MyriadPro-Bold"
    static let MyriadProRegular = "MyriadPro-Regular"
}



//let COMPANY_NAME = "rapidzz"
let COMPANY_NAME = "astro"
let FCM_TYPE = "200"

let GOOGLE_CLIENT_ID = "1065171826387-4rkttu2d6lkbdaso95mm6v6lh3iietd8.apps.googleusercontent.com"

let APPLICATION_THEME_COLOR = UIColor(red: 30/255, green: 142/255, blue: 213/255, alpha: 1.0)
let ORANGE_COLOR = UIColor(red: 255/255, green: 71/255, blue: 18/255, alpha: 1.0)
let DARK_RED_COLOR = UIColor(red: 187/255, green: 15/255, blue: 32/255, alpha: 1.0)

let PRINT_API_RESPONSE = false

let GOOGLE_NEAR_BY_URL                      = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="
let GOOGLE_NEAR_BY_PLACE_QUERY              = "&radius=100&keyword=&key=AIzaSyBTfypSbx_zNMhWSBXMTA2BJBMQO7_9_T8"
let GOOGLE_MAP_POLYLINE_URL                 = "http://maps.googleapis.com/maps/api/directions/json?origin="
let GOOGLE_MAP_DESTINATION_KEY              = "&destination="
let BASE_PHOTO_URL                          = "https://d1ol2bl3a4a1ax.cloudfront.net/golf_holidays/"
let BASE_URL                                = "https://www.godesto.com/AdminApps/"
let BASE_SHARE_THINGS_TO_DO_URL             = "https://www.godesto.com/dubai/thingstodo/"

let URL_Splash_Info                         = "welcome?city="
let URL_Login                               = "app_login"
let URL_SIGNUP                              = "register"
let URL_FORGET_PASSWORD                     = "get_password"
let URL_SEARCH_COUNTRY                      = "suggest_hub?query="
let URL_GET_ALL_COUNTRY                     = "suggest_country"
let URL_GET_TOP_HOTEL                       = "search_top_hotel"
let URL_SEARCH_REGION_FOR_HOTEL             = "search_region_for_hotel"
let URL_LOAD_MORE_HOTEL                     = "load_listing_hotels"
let URL_GET_HOTEL_DETAIL                    = "api_hotel_detail"
let URL_GET_HOTEL_ROOM                      = "room_details"
let URL_CANCELATION_REQUEST_ROOM            = "cancellation_request"
let URL_GET_GOLF_LISTING                    = "load_golf_listing" //
let URL_GET_GOLF_DETAIL                     = "golf_detail" //
let URL_UPDATE_PROFILE                      = "update_account"
let URL_RESET_PASSWORD                      = "reset_password"
let URL_NEWSLETTER_CHOICE                   = "reset_newsletter_pre"
let URL_GET_HOME_INFO                       = "dubai_landing"
let URL_GET_THINGS_TO_DO_LIST               = "load_thingstodo"
let URL_GET_THINGS_TO_DO_DETAIL             = "thingstodo_detail"
let URL_SUBMIT_REVIEW                       = "add_review"
let URL_GET_OPEN_TIME                       = "/load_free_drinks_timings/?opt="

let URL_REGISTER_FCM_TOKEN                  = "gcmregistration"
let URL_CHANGE_PASSWORD                     = "changepassword"
let URL_TIME_OUT                            = "timeout"
let URL_GET_NEAR_BY_DRIVERS                 = "cabnearby"
let URL_GET_HISTORY                         = "bookedjob"
let URL_CANCLE_JOB                          = "customerjobcanceled"
let URL_SUBMIR_REVIEW                       = "customerjobcanceled"
let URL_COMPLETE_JOB                        = "jobcomplete"
let URL_SUBMIT_BOOKING                      = "bookinginfo"
let URL_GET_SETTING_INFO                    = "settinglist"
let URL_GET_DRIVER_LOCATION                 = "driverlocationlist"
let URL_CHANGE_CURRENCY                     = "currency_change"
let URL_GET_APP_HELP    = "app_help"
let URL_CONTACT_BUSINESS    = "contact_business"

let URL_POST_JOB                            = "postjob"
let URL_JOB_NOTIFICATION                    = "driverjobnotification"

let URL_GOLFLISTING_IMAGES                  = "https://d1ol2bl3a4a1ax.cloudfront.net/golf_holidays/"

let URL_PREBOOKING_ROOM                     = "prebook_request"



let kFacebookURL = "fb://"
let kTwitterURL = "twitter://"
let kInstagramURL = "instagram://app"




