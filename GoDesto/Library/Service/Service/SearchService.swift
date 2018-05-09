//
//  SearchService.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class SearchService:BaseService {
    func searchCountry(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        let homeURL = BASE_URL + URL_SEARCH_COUNTRY + requestMessage.query
        
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleSearchCityResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let list = parsedResponse.data as? CountryList {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let countryListVM = CountryListViewModel(list: list)
                        serviceResponse.data = countryListVM
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Search City : Invalid Response from server" as AnyObject)
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
    func getAllCountry(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        let homeURL = BASE_URL + URL_GET_ALL_COUNTRY
        
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleSearchCityResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let list = parsedResponse.data as? CountryList {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let countryListVM = CountryListViewModel(list: list)
                        serviceResponse.data = countryListVM
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Search City : Invalid Response from server" as AnyObject)
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

