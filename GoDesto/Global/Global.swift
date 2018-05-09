import Foundation
//import SDWebImage

class Global {
    class var shared : Global {
        
        struct Static {
            static let instance : Global = Global()
        }
        return Static.instance
    }
    var isFbLogin:Bool? = false
    var deviceId:String? = ""
    var isFromNotification:Bool? = false
    var isCountryAdded:Bool? = false
    var login:LoginViewModel?
    var signup:SignupViewModel?
    var FCMToken:String? = ""
    var detail:DetailViewModel = DetailViewModel()
    var detailGolf:DetailViewModel = DetailViewModel()
    var splashInfo:SplashViewModel?
    var filter = FilterViewModel()
    var searchRegion:SearchRegionViewModel?
    var countryListModel: CountryListViewModel?
    var HotelSearchRoomList:RoomListViewModel = RoomListViewModel()
    var hotelDetail:HotelDetailViewModel?
    var toDoFilters:ToDoFilterViewModel = ToDoFilterViewModel()
    var hotelSearchDetail: HotelSearchDetail? = nil
    var currentCurrency : String = ""
    //var fcmNotification:FCMNotificationViewModel?
  }

