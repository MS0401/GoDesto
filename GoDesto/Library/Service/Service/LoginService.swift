//
//  LoginService.swift
//  InsafiansPTI
//
//  Created by Ghafar Tanveer on 26/12/2017.
//  Copyright © 2017 Ghafar Tanveer. All rights reserved.
//

import Foundation
class  LoginService:BaseService{
    func doLogin(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        let homeURL = BASE_URL + URL_Login

        let params = ["password":requestMessage.password,
                      "email":requestMessage.email]

        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.POST, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )

        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in

            switch networkResponseMessage.statusCode {

            case .Success:

                let parsedResponse = ResponseHandler.handleLoginResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{

                case .Success:

                    if let login = parsedResponse.data as? Login {

                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let loginVM = LoginViewModel(login: login)
                        serviceResponse.data = loginVM
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Login : Invalid Response from server" as AnyObject)
                        complete(response)
                    }

                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)

                }
            case .Failure:
                let response = self.getErrorResponseMessage("Login Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Login Request Timeout" as AnyObject)
                complete(response)
            }
        }

    }


}
