//
//  ReviewService.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 12/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
class ReviewService: BaseService {
    func submitReview(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        let homeURL = BASE_URL + URL_SUBMIT_REVIEW
        
        let params = ["rating_value":requestMessage.rating,
                      "review_text":requestMessage.text,
                      "user_id":requestMessage.loginId,
                      "hub_id":requestMessage.hubId
            ] as [String : Any]
        
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.POST, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleDefaultResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let response = parsedResponse.data as? DefaultResponse {
                        
                        let serviceResponse = self.getSuccessResponseMessage()
                        let responseVM = DefaultResponseViewModel(response: response)
                        serviceResponse.data = responseVM
                        print(serviceResponse)
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Add Review : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Add Review Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Add Review Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
    
}
