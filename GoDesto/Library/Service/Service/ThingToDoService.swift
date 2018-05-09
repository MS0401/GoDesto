//
//  ThingToDoService.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
class ThingToDoService: BaseService {
    func getThingToDoList(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        let homeURL = BASE_URL + URL_GET_THINGS_TO_DO_LIST
        
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleThingsToDoResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let list = parsedResponse.data as? ThingsToDoList {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let todoList = HomeViewModel(list: list)
                        serviceResponse.data = todoList
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Things To Do List : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Things To Do List Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Things To Do List Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
    func getThingToDoListForHome(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        let homeURL =  requestMessage.address
        
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleThingsToDoResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let list = parsedResponse.data as? ThingsToDoList {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let todoList = HomeViewModel(list: list)
                        serviceResponse.data = todoList
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Things To Do List : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Things To Do List Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Things To Do List Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
    func getThingsToDoDetail(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        let homeURL = BASE_URL + URL_GET_THINGS_TO_DO_DETAIL
        
        var httpUrl = URLComponents(string: homeURL)
        
        httpUrl?.queryItems = requestMessage.queryItemList
        let finalUrl = httpUrl?.path
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: finalUrl!, params: params as Dictionary<String, AnyObject>,Url:httpUrl!.url! )
        
        BaseNetwork().performNetworkTaskForTopHotel(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleThingsToDoDetailResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let detail = parsedResponse.data as? ThingToDoDetail {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let detailVM = ThingToDoDetailViewModel(thingToDo: detail)
                        serviceResponse.data = detailVM
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("Things To Do Detail : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("Things To Do Detail Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("Things To Do Detail Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
    func getOpenTime(requestMessage: RequestMessage, complete: @escaping ((_ responseMessage: ServiceResponseMessage)->Void))
    {
        let homeURL = BASE_URL + URL_GET_OPEN_TIME + requestMessage.type
        let params = ["":""]
        
        let networkRequestMessage = NetworkRequestMessage(requestType: RequestType.GET, contentType: ContentType.HTML, url: homeURL, params: params as Dictionary<String, AnyObject> )
        
        BaseNetwork().performNetworkTask(requestMessage: networkRequestMessage) {
            (networkResponseMessage) in
            
            switch networkResponseMessage.statusCode {
                
            case .Success:
                
                let parsedResponse = ResponseHandler.handleOpeningTimeResponse(networkResponseMessage: networkResponseMessage)
                switch parsedResponse.serviceResponseType{
                    
                case .Success:
                    
                    if let list = parsedResponse.data as? TImeList {
                        
                        let serviceResponse = self.getSuccessResponseMessage(parsedResponse.message)
                        let dayVM = ToDoFilterDayViewModel(timeList: list)
                        serviceResponse.data = dayVM
                        complete(serviceResponse)
                    }
                    else{
                        let response = self.getErrorResponseMessage("GET Opening Time : Invalid Response from server" as AnyObject)
                        complete(response)
                    }
                    
                default:
                    let response = self.getDefaultServiceResponse(parsedResponse)
                    complete(response)
                    
                }
            case .Failure:
                let response = self.getErrorResponseMessage("GET Opening Time Request Failed" as AnyObject)
                complete(response)
            case .Timeout:
                let response = self.getTimeoutErrorResponseMessage("GET Opening Time Request Timeout" as AnyObject)
                complete(response)
            }
        }
        
    }
}
