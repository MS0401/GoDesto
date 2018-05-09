//
//  HotelService.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 05/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class HotelService: BaseService {
    func getTopHotel(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        
           let homeURL = BASE_URL + URL_GET_TOP_HOTEL
        
        var httpUrl = URLComponents(string: homeURL)
        
        httpUrl?.queryItems = requestMessage.queryItemList
        //httpUrl?.queryItems = [URLQueryItem(name:"region",value:"dubai emirates"),
//                               URLQueryItem(name:"destination",value:"18870"),
//                               URLQueryItem(name:"checkindate",value:"2018-4-15"),
//                               URLQueryItem(name:"checkoutdate",value:"2018-4-20"),
//                               URLQueryItem(name:"nationality",value:"Pakistan"),
//                               URLQueryItem(name:"nationality_code",value:"PK"),
//                               URLQueryItem(name:"num_rooms",value:"1"),
//                               URLQueryItem(name:"room_adults_1",value:"2"),
//                               URLQueryItem(name:"room_childs_1",value:"__10__5|2"),
//                               URLQueryItem(name:"country_code",value:"8939"),
//                               URLQueryItem(name:"session_id",value:"usdasjdoiasjoidjasoidjaosidjiaosjdoi_godesto"),]

       
        let finalUrl = httpUrl?.path
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: finalUrl!, params: params as Dictionary<String, AnyObject>,Url:httpUrl!.url! )
        
        BaseNetwork().performNetworkTaskForTopHotel(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleTopHotelResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let tophotel = parsedResponse.data as? TopHotel {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let topHotelVM = TopHotelViewModel(topHotel: tophotel)
                        serviceResponse.data = topHotelVM
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Top Hotel List : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Top Hotel List Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Top Hotel List Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
    func searchRegionForHotel(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        
        let homeURL = BASE_URL + URL_SEARCH_REGION_FOR_HOTEL
        
        var httpUrl = URLComponents(string: homeURL)
        
        httpUrl?.queryItems = requestMessage.queryItemList

        
        
        let finalUrl = httpUrl?.path
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: finalUrl!, params: params as Dictionary<String, AnyObject>,Url:httpUrl!.url! )
        
        BaseNetwork().performNetworkTaskForTopHotel(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleSearchRegionResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let region = parsedResponse.data as? SearchRegion {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let regionVM = SearchRegionViewModel(region: region)
                        serviceResponse.data = regionVM
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Search Region : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Search Region Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Search Region Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
    func loadMoreHotels(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        
        let homeURL = BASE_URL + URL_LOAD_MORE_HOTEL
        
       
        let params = requestMessage.hotelParams
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.POST, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleLoadMoreResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let moreHotel = parsedResponse.data as? LoadMoreHotel {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let moreHotel = TopHotelViewModel(moreHote: moreHotel)
                        serviceResponse.data = moreHotel
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Load More Hotel List : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Load More Hotel List Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Load More Hotel List Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
    func getHotelDetail(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        
        let homeURL = BASE_URL + URL_GET_HOTEL_DETAIL
        
        var httpUrl = URLComponents(string: homeURL)
        
        httpUrl?.queryItems = requestMessage.queryItemList
        
        
        
        let finalUrl = httpUrl?.path
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: finalUrl!, params: params as Dictionary<String, AnyObject>,Url:httpUrl!.url! )
        
        BaseNetwork().performNetworkTaskForTopHotel(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleHotelDetailResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let detail = parsedResponse.data as? HotelDetail {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let detailVM = HotelDetailViewModel(detail: detail)
                        serviceResponse.data = detailVM
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Hotel Detail : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Hotel Detail Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Hotel Detail Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
    func getHotelRooms(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        
        let homeURL = BASE_URL + URL_GET_HOTEL_ROOM
        
        var httpUrl = URLComponents(string: homeURL)
        
        httpUrl?.queryItems = requestMessage.queryItemList
        
        
        
        let finalUrl = httpUrl?.path
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: finalUrl!, params: params as Dictionary<String, AnyObject>,Url:httpUrl!.url! )
        
        BaseNetwork().performNetworkTaskForTopHotel(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleRoomListResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let list = parsedResponse.data as? HotelRoomList {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let roomList = HotelRoomListViewModel(roomList: list)
                        serviceResponse.data = roomList
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Hotel Room : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Hotel Room Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Hotel Room Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
    func getCancelationApi(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        
        let homeURL = BASE_URL + URL_CANCELATION_REQUEST_ROOM
        
        var httpUrl = URLComponents(string: homeURL)
        
        httpUrl?.queryItems = requestMessage.queryItemList
        
        
        
        let finalUrl = httpUrl?.path
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: finalUrl!, params: params as Dictionary<String, AnyObject>,Url:httpUrl!.url! )
        
        BaseNetwork().performNetworkTaskForTopHotel(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleCancelationResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let list = parsedResponse.data as? CancelationList {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let roomList = CancelationListViewModel(list: list)
                        serviceResponse.data = roomList
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Cancelation Request: Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Cancelation Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Cancelation Request Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
    
    func getDynamicHomeAPI(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        
        let homeURL = BASE_URL + URL_CANCELATION_REQUEST_ROOM
        
        var httpUrl = URLComponents(string: homeURL)
        
        httpUrl?.queryItems = requestMessage.queryItemList
        
        
        
        let finalUrl = httpUrl?.path
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: finalUrl!, params: params as Dictionary<String, AnyObject>,Url:httpUrl!.url! )
        
        BaseNetwork().performNetworkTaskForTopHotel(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleCancelationResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let list = parsedResponse.data as? CancelationList {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let roomList = CancelationListViewModel(list: list)
                        serviceResponse.data = roomList
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Cancelation Request: Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Cancelation Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Cancelation Request Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
    
    //MARK: PreCheckout API
    func getPreCheckOutInformation(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        
        let homeURL = BASE_URL + URL_PREBOOKING_ROOM
        
        var httpUrl = URLComponents(string: homeURL)
        
        httpUrl?.queryItems = requestMessage.queryItemList
        
        let finalUrl = httpUrl?.path
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: finalUrl!, params: params as Dictionary<String, AnyObject>,Url:httpUrl!.url! )
        
        BaseNetwork().performNetworkTaskForTopHotel(requestMessage: networkRequestMessage) { (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handlePreBookingResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let preBookInfo = parsedResponse.data as? PreBookInfo {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let preCheckoutViewModel = PreCheckoutViewModel(preBookInfo: preBookInfo)
                        serviceResponse.data = preCheckoutViewModel
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Booking: Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Booking Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Booking Request Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
   
}
