//
//  UpdateProfileService.swift
//  GoDesto
//
//  Created by Nomi Malik on 10/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class UpdateProfileService:BaseService{
    
    func updateProfile(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        let homeURL = BASE_URL + URL_UPDATE_PROFILE
        
        let params = ["bill_city":requestMessage.city,
                      "bill_country":requestMessage.country,
                      "bill_title":requestMessage.title,
                      "bill_email":requestMessage.email,
                      "bill_phone":requestMessage.phoneNumber,
                      "bill_fname":requestMessage.firstName,
                      "bill_sname":requestMessage.lastName,
                      "bill_addr1":requestMessage.address,
                      "bill_region":requestMessage.region,
                      "user_id":Global.shared.login!.loginId,
                      "customer_email":Global.shared.login!.email
                      ] as [String : Any]
        
        
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
                        let responseVM = LoginViewModel(login: login)
                        serviceResponse.data = responseVM
                        print(serviceResponse)
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Profile Details Update : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Profile Details Update Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Profile Details Update Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
    
    
    func updateNewsletterPref(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void)){
        
        let homeURL = BASE_URL + URL_NEWSLETTER_CHOICE
        
        print(homeURL)
        let params = ["user_id":Global.shared.login!.loginId,
                      "newsletter_pref":requestMessage.newsLetterPref]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.POST, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleLoginResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let update = parsedResponse.data as? Login {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let loginVM = LoginViewModel(login: update)
                        serviceResponse.data = loginVM
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Newsletter Update : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Newsletter Update Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Newsletter Update Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
        
        
        
    }
    
    func updatePassword(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void)){
        
        let homeURL = BASE_URL + URL_RESET_PASSWORD
        
        print(homeURL)
        let params = ["user_id":Global.shared.login!.loginId,
                      "password":requestMessage.password]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.POST, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleLoginResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let update = parsedResponse.data as? Login {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let loginVM = LoginViewModel(login: update)
                        serviceResponse.data = loginVM
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Password Reset : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Password Reset Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Password Reset Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
        
        
        
    }
    
}
