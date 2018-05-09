//
//  CurrencyService.swift
//  GoDesto
//
//  Created by Sohail on 01/05/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class CurrencyService: BaseService {
    
    func changeCurrency(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void)){
        
        let homeURL = BASE_URL + URL_CHANGE_CURRENCY + "?searchedValue=" + requestMessage.query
        
        print(homeURL)
        
        let params = ["searchedValue":requestMessage.query]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.JSON, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleChangeCurrencyResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let list = parsedResponse.data as? ChangeCurrencyResponse {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        serviceResponse.data = list
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Change Currency : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Change Currency Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Change Currency Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }

}
