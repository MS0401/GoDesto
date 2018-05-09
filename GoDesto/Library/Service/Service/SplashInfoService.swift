//
//  SplashInfoService.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 22/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class SplashInfoService:BaseService{
    func getSplashInfo(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        let homeURL = BASE_URL + URL_Splash_Info  + requestMessage.city
        
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleSplashResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let splash = parsedResponse.data as? SplashInfo {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let splashVM = SplashViewModel(splash: splash)
                        serviceResponse.data = splashVM
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Splash : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Splash Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Splash Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
}
