//
//  HomeService.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
class HomeService: BaseService {
    func getHomeInfo(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        let homeURL = BASE_URL + URL_GET_HOME_INFO
        
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleHomeInfoResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let homeList = parsedResponse.data as? HomeLIst {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let homeVM = HomeViewModel(home: homeList)
                        serviceResponse.data = homeVM
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Home Info : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Home Info Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Home Info Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
}
