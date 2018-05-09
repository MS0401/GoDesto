//
//  HelpScreenViewModel.swift
//  GoDesto
//
//  Created by Sohail on 01/05/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HelpScreenViewModel: NSObject {
    var helpData : AppHelpResponseData?
    weak var viewController : HelpViewController?

    override init() {
        super.init()
    }
    
    convenience init(vc : HelpViewController) {
        self.init()
        self.viewController = vc
    }
    
    func getAppHelp()
    {
        let query:String = ""
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.query = query
        
        if let request = requestMessage
        {
            GCD.async(.Default){
                GCD.async(.Main, execute: {
                    if let container = self.viewController?.mainContainer{
                        container.startActivity()
                    }
                })
                let service = HelpService()
                service.GetAppHelpFromApi(requestMessage: request, complete: {[unowned self] (responseMessage) in
                    
                    GCD.async(.Main)
                    {
                        // do ui work
                        if let container = self.viewController?.mainContainer
                        {
                            container.stopActivity()
                        }
                    }
                    switch responseMessage.serviceResponseType
                    {
                        
                    case .Success:
                        GCD.async(.Main)
                        {
                            // do UI Work
                            if let responsedata = responseMessage.data as? AppHelpResponse
                            {
                                self.helpData = responsedata.data
                                self.viewController?.webViewHelp.loadHTMLString(responsedata.data.helpTtext, baseURL: nil)
                                self.viewController?.setImageWithUrl(imageView:  self.viewController!.mainImgV, url: responsedata.data.image,profile: "Image-2")
                            }
                            
                            
                        }
                    case .Failure:
                        GCD.async(.Main)
                        {
                        }
                    default:
                        GCD.async(.Main)
                        {
                            
                        }
                    }
                })
            }
            
            
        }
    }
}
