//
//  TokenRegistrationService.swift
//  Fooding
//
//  Created by Ghafar Tanveer on 15/08/2017.
//  Copyright © 2017 Ghafar Tanveer. All rights reserved.
//

import Foundation

class TokenRegistrationService: BaseService {
    func tokenRegistration(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void)){
        
        let homeURL = BASE_URL + URL_REGISTER_FCM_TOKEN
        
        let params = ["driver_id":"",
                      "client_id":requestMessage.clientId,
                      "gcmregistrationid":requestMessage.FCMToken,
                      "type":requestMessage.type]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.POST, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handlePostResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let data = parsedResponse.data  {
                        
                        let serviceResponse = self.getSuccessResponseMessage()
                        serviceResponse.data = data
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Token Registration : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Token Registration Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Token Registration Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
}
