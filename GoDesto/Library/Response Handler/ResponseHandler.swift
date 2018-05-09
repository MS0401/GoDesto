import Foundation

let KEY_RESULT_TYPE = "result"
let KEY_EXCEPTION = "Exception"
let KEY_MESSAGE = "message"
let KEY_VALIDATION_ERROR = "ValidationErrors"
let KEY_DATA = "Data"

let ERROR_SERVER_NO_DATA = "Server didn't give response"
let ERROR_SERVER_WRONG_DATA = "Server didn't give proper response"
let ERROR_SERVER_WRONG_DATA_AR = "لم الملقم لا تعطي الرد المناسب"

class ResponseHandler {
    
    class func handleResponseStructure(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        //var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
        
        let parsedResponse = ParsedResponseMessage()
        
        if let data = networkResponseMessage.data as? NSData {
            
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
                
                // let jsonObject: AnyObject = try JSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)
                
                let jsonDict = jsonObject
                
                if let resultType = jsonDict[KEY_RESULT_TYPE] as? String {
                    
                    if let msg = jsonDict[KEY_MESSAGE] as? String{
                        parsedResponse.message = msg
                    }
                    
                    switch resultType {
                        
                    case ServiceResponseType.Success.rawValue:
                        
                        parsedResponse.serviceResponseType = .Success
                        parsedResponse.data = jsonDict as AnyObject?
                        
                    case ServiceResponseType.Failure.rawValue:
                        parsedResponse.serviceResponseType = .Failure
                        
                    case ServiceResponseType.DeActivated.rawValue:
                        parsedResponse.serviceResponseType = .DeActivated
                        
                    case ServiceResponseType.Warning.rawValue:
                        parsedResponse.serviceResponseType = .Warning
                        
                    case ServiceResponseType.Exception.rawValue:
                        parsedResponse.serviceResponseType = .Exception
                        if let exp = jsonDict[KEY_EXCEPTION] as? [String: AnyObject] {
                            parsedResponse.exception = exp.description
                        }
                        
                    case ServiceResponseType.ValidationError.rawValue:
                        parsedResponse.serviceResponseType = .ValidationError
                        if let valErrors = jsonDict[KEY_VALIDATION_ERROR] as? [AnyObject] {
                            var errArray = [String]()
                            
                            for err in valErrors{
                                if let errObj = err as? [String:AnyObject]{
                                    if let friendlyMsg = errObj["errorMessage"] as? String{
                                        errArray.append(friendlyMsg)
                                    }
                                }
                            }
                            parsedResponse.validationErrors = errArray
                        }
                        
                    default:
                        parsedResponse.message = ERROR_SERVER_WRONG_DATA
                    }
                }
                else{
                    parsedResponse.message = ERROR_SERVER_WRONG_DATA
                }
            } catch _ {
                /* TODO: Finish migration: handle the expression passed to error arg: error */
                // Server didn't give proper response
                parsedResponse.message = ERROR_SERVER_WRONG_DATA
            }
        }
        else{
            // Server Didn't give us response
            parsedResponse.message = ERROR_SERVER_NO_DATA
        }
        
        return parsedResponse
    }
    
    



    class func handleLoginResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {

        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)

        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
                if  let jsonDate = jsonDict["data"] as? [String:AnyObject]{
                    var error2 : NSError? = nil

                    let login : Login!
                    do {
                        login = try Login(dictionary: jsonDate)
                    } catch let error as NSError {
                        error2 = error
                        login = nil
                    }

                    if let err = error2 {
                        print(err)
                        parsedResponse.serviceResponseType = .Failure
                        parsedResponse.message = ERROR_SERVER_WRONG_DATA
                        parsedResponse.data = nil
                    }
                    else{
                        parsedResponse.data = login
                    }
                }

            }

        }
        return parsedResponse
    }
    class func handleSplashResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
                if  let jsonDate = jsonDict["data"] as? [String:AnyObject]{
                    var error2 : NSError? = nil
                    
                    let splash : SplashInfo!
                    do {
                        splash = try SplashInfo(dictionary: jsonDate)
                    } catch let error as NSError {
                        error2 = error
                        splash = nil
                    }
                    
                    if let err = error2 {
                        print(err)
                        parsedResponse.serviceResponseType = .Failure
                        parsedResponse.message = ERROR_SERVER_WRONG_DATA
                        parsedResponse.data = nil
                    }
                    else{
                        parsedResponse.data = splash
                    }
                }
                
            }
            
        }
        return parsedResponse
    }
    class func handleHomeInfoResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
                if  let jsonDate = jsonDict["data"] as? [String:AnyObject]{
                    var error2 : NSError? = nil
                    
                    let homelist : HomeLIst!
                    do {
                        homelist = try HomeLIst(dictionary: jsonDate)
                    } catch let error as NSError {
                        error2 = error
                        homelist = nil
                    }
                    
                    if let err = error2 {
                        print(err)
                        parsedResponse.serviceResponseType = .Failure
                        parsedResponse.message = ERROR_SERVER_WRONG_DATA
                        parsedResponse.data = nil
                    }
                    else{
                        parsedResponse.data = homelist
                    }
                }
                
            }
            
        }
        return parsedResponse
    }
    
    class func handleSearchCityResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
                
                var error2 : NSError? = nil
                
                let countryList : CountryList!
                do {
                    countryList = try CountryList(dictionary: jsonDict)
                } catch let error as NSError {
                    error2 = error
                    countryList = nil
                }
                
                if let err = error2 {
                    print(err)
                    parsedResponse.serviceResponseType = .Failure
                    parsedResponse.message = ERROR_SERVER_WRONG_DATA
                    parsedResponse.data = nil
                }
                else{
                    parsedResponse.data = countryList
                }
                
                
            }
            
        }
        return parsedResponse
    }
    class func handleTopHotelResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
                if  let jsonDate = jsonDict["data"] as? [String:AnyObject]{
                    
                    var error2 : NSError? = nil
                    
                    let topHotel : TopHotel!
                    do {
                        topHotel = try TopHotel(dictionary: jsonDate)
                    } catch let error as NSError {
                        error2 = error
                        topHotel = nil
                    }
                    
                    if let err = error2 {
                        print(err)
                        parsedResponse.serviceResponseType = .Failure
                        parsedResponse.message = ERROR_SERVER_WRONG_DATA
                        parsedResponse.data = nil
                    }
                    else{
                        parsedResponse.data = topHotel
                    }
                }
                
            }
            
        }
        return parsedResponse
    }
    class func handleSearchRegionResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
                if  let jsonDate = jsonDict["data"] as? [String:AnyObject]{
                    
                    var error2 : NSError? = nil
                    
                    let region : SearchRegion!
                    do {
                        region = try SearchRegion(dictionary: jsonDate)
                    } catch let error as NSError {
                        error2 = error
                        region = nil
                    }
                    
                    if let err = error2 {
                        print(err)
                        parsedResponse.serviceResponseType = .Failure
                        parsedResponse.message = ERROR_SERVER_WRONG_DATA
                        parsedResponse.data = nil
                    }
                    else{
                        parsedResponse.data = region
                    }
                }
                
            }
            
        }
        return parsedResponse
    }
    class func handleLoadMoreResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
                //if  let jsonDate = jsonDict["data"] as? [String:AnyObject]{
                    
                    var error2 : NSError? = nil
                    
                    let loadHotel : LoadMoreHotel!
                    do {
                        loadHotel = try LoadMoreHotel(dictionary: jsonDict)
                    } catch let error as NSError {
                        error2 = error
                        loadHotel = nil
                    }
                    
                    if let err = error2 {
                        print(err)
                        parsedResponse.serviceResponseType = .Failure
                        parsedResponse.message = ERROR_SERVER_WRONG_DATA
                        parsedResponse.data = nil
                    }
                    else{
                        parsedResponse.data = loadHotel
                    }
                }
                
            //}
            
        }
        return parsedResponse
    }
    
    class func handleLoadGolfCourseDetailsResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success {
         
            if let jsonDict = parsedResponse.data as? [String: AnyObject] {
                
                if  let jsonDate = jsonDict["data"] as? [String:AnyObject]{
               
                    var error2 : NSError? = nil
                    
                    var detail : GolfCourseDetail!
                    do {
                        detail = try GolfCourseDetail(dictionary: jsonDate)
                    } catch let error as NSError {
                        error2 = error
                        detail = nil
                    }
                    
                    if let err = error2 {
                        print(err)
                        parsedResponse.serviceResponseType = .Failure
                        parsedResponse.message = ERROR_SERVER_WRONG_DATA
                        parsedResponse.data = nil
                    }
                    else{
                        parsedResponse.data = detail as AnyObject
                    }
                }
            }
        }
        return parsedResponse
    }
    
    class func handleLoadGolfListingItemResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success {
            
            if let jsonDict = parsedResponse.data as? [String: AnyObject] {
                
                if  let jsonDate = jsonDict["data"] as? [String:AnyObject]{
                    
                    if  let jsonData = jsonDate["data"] as? [[String:AnyObject]]{
                        
                        var error2 : NSError? = nil
                        
                        var listData = [GolfCourseListingViewModel]()
                        
                        for item in jsonData {
                            
                            var detail : GolfCourseList!
                            do {
                                detail = try GolfCourseList(dictionary: item)
                            } catch let error as NSError {
                                error2 = error
                                detail = nil
                            }
                            
                            if let err = error2 {
                                print(err)
                                parsedResponse.serviceResponseType = .Failure
                                parsedResponse.message = ERROR_SERVER_WRONG_DATA
                                parsedResponse.data = nil
                            }
                            else{
                                listData.append(GolfCourseListingViewModel(golf: detail))
                            }
                        }
                        
                        parsedResponse.data = listData as AnyObject
                    }
                }
            }
        }
        return parsedResponse
    }

    
    class func handleHotelDetailResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
                if  let jsonDate = jsonDict["data"] as? [String:AnyObject]{
                
                var error2 : NSError? = nil
                
                let detail : HotelDetail!
                do {
                    detail = try HotelDetail(dictionary: jsonDate)
                } catch let error as NSError {
                    error2 = error
                    detail = nil
                }
                
                if let err = error2 {
                    print(err)
                    parsedResponse.serviceResponseType = .Failure
                    parsedResponse.message = ERROR_SERVER_WRONG_DATA
                    parsedResponse.data = nil
                }
                else{
                    parsedResponse.data = detail
                }
            }
            
            }
            
        }
        return parsedResponse
    }
    class func handleRoomListResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
                if  let jsonDate = jsonDict["data"] as? [String:AnyObject]{
                    
                    var error2 : NSError? = nil
                    
                    let list : HotelRoomList!
                    do {
                        list = try HotelRoomList(dictionary: jsonDate)
                    } catch let error as NSError {
                        error2 = error
                        list = nil
                    }
                    
                    if let err = error2 {
                        print(err)
                        parsedResponse.serviceResponseType = .Failure
                        parsedResponse.message = ERROR_SERVER_WRONG_DATA
                        parsedResponse.data = nil
                    }
                    else{
                        parsedResponse.data = list
                    }
                }
                
            }
            
        }
        return parsedResponse
    }
    class func handleCancelationResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
               // if  let jsonDate = jsonDict["data"] as? [String:AnyObject]{
                    
                    var error2 : NSError? = nil
                    
                    let list : CancelationList!
                    do {
                        list = try CancelationList(dictionary: jsonDict)
                    } catch let error as NSError {
                        error2 = error
                        list = nil
                    }
                    
                    if let err = error2 {
                        print(err)
                        parsedResponse.serviceResponseType = .Failure
                        parsedResponse.message = ERROR_SERVER_WRONG_DATA
                        parsedResponse.data = nil
                    }
                    else{
                        parsedResponse.data = list
                    }
               // }
                
            }
            
        }
        return parsedResponse
    }
    class func handleThingsToDoResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
                if  let jsonDate = jsonDict["data"] as? [String:AnyObject]{
                    var error2 : NSError? = nil
                    
                    let todolist : ThingsToDoList!
                    do {
                        todolist = try ThingsToDoList(dictionary: jsonDate)
                    } catch let error as NSError {
                        error2 = error
                        todolist = nil
                    }
                    
                    if let err = error2 {
                        print(err)
                        parsedResponse.serviceResponseType = .Failure
                        parsedResponse.message = ERROR_SERVER_WRONG_DATA
                        parsedResponse.data = nil
                    }
                    else{
                        parsedResponse.data = todolist
                    }
                }
                
            }
            
        }
        return parsedResponse
    }
    class func handleThingsToDoDetailResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
                if  let jsonDate = jsonDict["data"] as? [String:AnyObject]{
                    var error2 : NSError? = nil
                    
                    let detail : ThingToDoDetail!
                    do {
                        detail = try ThingToDoDetail(dictionary: jsonDate)
                    } catch let error as NSError {
                        error2 = error
                        detail = nil
                    }
                    
                    if let err = error2 {
                        print(err)
                        parsedResponse.serviceResponseType = .Failure
                        parsedResponse.message = ERROR_SERVER_WRONG_DATA
                        parsedResponse.data = nil
                    }
                    else{
                        parsedResponse.data = detail
                    }
                }
                
            }
            
        }
        return parsedResponse
    }
    class func handleOpeningTimeResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
                if  let jsonDate = jsonDict["data"] as? [String:AnyObject]{
                    var error2 : NSError? = nil
                    
                    let list : TImeList!
                    do {
                        list = try TImeList(dictionary: jsonDate)
                    } catch let error as NSError {
                        error2 = error
                        list = nil
                    }
                    
                    if let err = error2 {
                        print(err)
                        parsedResponse.serviceResponseType = .Failure
                        parsedResponse.message = ERROR_SERVER_WRONG_DATA
                        parsedResponse.data = nil
                    }
                    else{
                        parsedResponse.data = list
                    }
                }
                
            }
            
        }
        return parsedResponse
    }
    class func handleDefaultResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
                //if  let jsonDate = jsonDict["data"] as? [String:AnyObject]{
                    var error2 : NSError? = nil
                    
                    let response : DefaultResponse!
                    do {
                        response = try DefaultResponse(dictionary: jsonDict)
                    } catch let error as NSError {
                        error2 = error
                        response = nil
                    }
                    
                    if let err = error2 {
                        print(err)
                        parsedResponse.serviceResponseType = .Failure
                        parsedResponse.message = ERROR_SERVER_WRONG_DATA
                        parsedResponse.data = nil
                    }
                    else{
                        parsedResponse.data = response
                    }
                }
                
           // }
            
        }
        return parsedResponse
    }
    
    class func handlePostResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String:AnyObject]{
                print(jsonDict)
            }
        }else{
            parsedResponse.serviceResponseType = .Failure
            // parsedResponse.message = ERROR_SERVER_WRONG_DATA
            
        }
        
        return parsedResponse
    }
    
    class func handlePreBookingResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success {
            if let jsonDict = parsedResponse.data as? [String: AnyObject],  let jsonData = jsonDict["data"] as? [String:AnyObject] {
                
                var error2 : NSError? = nil
                
                let preBookingInfo: PreBookInfo!
                do {
                    preBookingInfo = try PreBookInfo(dictionary: jsonData)
                } catch let error as NSError {
                    error2 = error
                    preBookingInfo = nil
                }
                
                if let err = error2 {
                    print(err)
                    parsedResponse.serviceResponseType = .Failure
                    parsedResponse.message = ERROR_SERVER_WRONG_DATA
                    parsedResponse.data = nil
                }
                else{
                    parsedResponse.data = preBookingInfo
                }
                
            }
            
        }
        return parsedResponse
    }
    
    
    class func handleChangeCurrencyResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
                
                var error2 : NSError? = nil
                
                let currencyResponse : ChangeCurrencyResponse!
                do {
                    currencyResponse = try ChangeCurrencyResponse(dictionary: jsonDict)
                } catch let error as NSError {
                    error2 = error
                    currencyResponse = nil
                }
                
                if let err = error2 {
                    print(err)
                    parsedResponse.serviceResponseType = .Failure
                    parsedResponse.message = ERROR_SERVER_WRONG_DATA
                    parsedResponse.data = nil
                }
                else{
                    parsedResponse.data = currencyResponse
                }
                
                
            }
            
        }
        return parsedResponse
    }
    
    class func HandleGetHelpResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
                
                var error2 : NSError? = nil
                
                let appHelpResponse : AppHelpResponse!
                do {
                    appHelpResponse = try AppHelpResponse(dictionary: jsonDict)
                } catch let error as NSError {
                    error2 = error
                    appHelpResponse = nil
                }
                
                if let err = error2 {
                    print(err)
                    parsedResponse.serviceResponseType = .Failure
                    parsedResponse.message = ERROR_SERVER_WRONG_DATA
                    parsedResponse.data = nil
                }
                else{
                    parsedResponse.data = appHelpResponse
                }
                
                
            }
            
        }
        return parsedResponse
    }
    
    class func HandleSendContactBusinessResponse(networkResponseMessage: NetworkResponseMessage) ->(ParsedResponseMessage) {
        
        let parsedResponse = ResponseHandler.handleResponseStructure(networkResponseMessage: networkResponseMessage)
        
        if parsedResponse.serviceResponseType == .Success{
            if let jsonDict = parsedResponse.data as? [String: AnyObject]{
                
                var error2 : NSError? = nil
                
                let appHelpResponse : ContactBusinessResponse!
                do {
                    appHelpResponse = try ContactBusinessResponse(dictionary: jsonDict)
                } catch let error as NSError {
                    error2 = error
                    appHelpResponse = nil
                }
                
                if let err = error2 {
                    print(err)
                    parsedResponse.serviceResponseType = .Failure
                    parsedResponse.message = ERROR_SERVER_WRONG_DATA
                    parsedResponse.data = nil
                }
                else{
                    parsedResponse.data = appHelpResponse
                }
                
                
            }
            
        }
        return parsedResponse
    }

}

