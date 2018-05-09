import Foundation


enum PrefferedLanguage: String{
    case English = "English"
    case Arabic = "Arabic"
    
}

enum Gender: String{
    case Male = "Male"
    case Female = "Female"
    case Empty = ""
    
}
enum ThingsToDoTabs: String {
    case Overview = "overview"
    case Review = "review"
    case Menu = "menu"
}

enum NotificationTargets: String{
    case GeneralNews = "GeneralNews"
    case BirthNews = "BirthNews"
    case DeathNews = "DeathNews"
    case WeddingNews = "WeddingNews"
    case PollNews = "PollNews"
    case Worthy = "Worthy"
    case PhotoAlbum = "PhotoAlbum"
    case None = ""
    
}

enum JobGender: String {
    case Male = "Male"
    case Female = "Female"
    case Empty = ""
    case Both = "MF"
}

enum DetailFilter:String {
    case All = "All"
    case NonRefundable = "Non Refundable"
    case Breakfast = "Breakfast"
    case RoomOnly = "Room only"
}
enum NetworkOperation {
    case None
    case LoginUser
    case ForgetPassword
    
}


enum NewsLetter: String{
    case Daily = "Daily"
    case Weekly = "Weekly"
    case NotInterested = "NotInterested"
    
}
