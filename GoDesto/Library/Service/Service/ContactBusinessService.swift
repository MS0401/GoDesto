//
//  ContactBusinessService.swift
//  GoDesto
//
//  Created by Sohail on 01/05/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class ContactBusinessService: BaseService {
    
    func SendContactBusinessInfo(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void)){
        
        let homeURL = BASE_URL + URL_CONTACT_BUSINESS
        
        print(homeURL)
        
        
        
        
        
        let params = ["name":requestMessage.firstName,"email":requestMessage.email,"phone":requestMessage.phoneNumber,"message":requestMessage.message]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.POST, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.HandleSendContactBusinessResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let list = parsedResponse.data as? ContactBusinessResponse {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        serviceResponse.data = list
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Get Help : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Get Help Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Get Help Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
    
}
