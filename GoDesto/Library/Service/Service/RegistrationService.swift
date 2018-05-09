//
//  RegistrationService.swift
//  InsafiansPTI
//
//  Created by Ghafar Tanveer on 23/12/2017.
//  Copyright © 2017 Ghafar Tanveer. All rights reserved.
//

import Foundation

class RegistrationService: BaseService {
    func resgisterService(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        let homeURL = BASE_URL + URL_SIGNUP

        let params = ["first_name":requestMessage.firstName,
                      "last_name":requestMessage.lastName,
                      "email":requestMessage.email,
                      "password":requestMessage.password] as [String : Any]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.POST, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )

        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in

            switch networkResponseMessage.statusCode {

            case .Success:

                let parsedResponse = ResponseHandler.handleLoginResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{

                case .Success:

                    if let login = parsedResponse.data as? Login {

                        let serviceResponse = self.getSuccessResponseMessage()
                        let loginVM = LoginViewModel(login: login)
                        serviceResponse.data = loginVM
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("SignUP : Invalid Response from server" as AnyObject)
                        complete(response)
                    }

                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)

                }
            case .Failure:
                let response = self.getErrorResponseMessage("SignUP Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("SignUP Request Timeout" as AnyObject)
                complete(response)
            }
        }

    }
    func fogotPassword(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        let homeURL = BASE_URL + URL_FORGET_PASSWORD
        
        let params = ["email":requestMessage.email] as [String : Any]
        
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
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Forgot Password: Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Forgot Password: Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Forgot Password: Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
    
    
}
