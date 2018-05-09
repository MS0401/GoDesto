//
//  GolfService.swift
//  GoDesto
//
//  Created by Muhammad Rashid on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class GolfService: BaseService {
    
    func getGolfListing(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        
        let golfListingURL = BASE_URL + URL_GET_GOLF_LISTING
        let params = requestMessage.hotelParams
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: golfListingURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleLoadGolfListingItemResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType {
                    
                case .Success:
                    
                    if let responseData = parsedResponse.data as? [GolfCourseListingViewModel] {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        serviceResponse.data = responseData as AnyObject
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Golf List : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Golf List Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Golf List Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }

    
    func getGolfDetails(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        
        let golfListingURL = BASE_URL + URL_GET_GOLF_DETAIL
        let params = requestMessage.hotelParams
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: golfListingURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleLoadGolfCourseDetailsResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType {
                    
                case .Success:
                    
                    if let responseData = parsedResponse.data as? [GolfCourseDetailViewModel] {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        serviceResponse.data = responseData as AnyObject
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Golf List : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Golf List Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Golf List Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }

}
