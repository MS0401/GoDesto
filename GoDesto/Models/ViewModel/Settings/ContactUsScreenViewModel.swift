//
//  ContactUsScreenViewModel.swift
//  GoDesto
//
//  Created by Sohail on 01/05/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class ContactUsScreenViewModel: NSObject {

    var contactData : ContactBusinessResponse?
    weak var viewController : ContactUsViewController?
    
    override init() {
        super.init()
    }
    
    convenience init(vc : ContactUsViewController) {
        self.init()
        self.viewController = vc
    }
    
    func sendContactBusinessRequest()
    {
        
        let query:String = ""
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.query = query
        requestMessage?.firstName = "iOS_USer"
        requestMessage?.email = (viewController?.emailAddressTextField.text)!
        requestMessage?.phoneNumber = (viewController?.phoneTextField.text)!
        requestMessage?.message = (viewController?.messageTextField.text)!
        
        if  requestMessage?.email == "" || requestMessage?.phoneNumber == "" || requestMessage?.message == ""
        {
            self.viewController?.showAlertVIew(message: "Please fill in data first", title: "")
            return

        }


        
        if let request = requestMessage
        {
            GCD.async(.Default){
                GCD.async(.Main, execute: {
                    if let container = self.viewController?.mainContainer{
                        container.startActivity()
                    }
                })
                let service = ContactBusinessService()
                service.SendContactBusinessInfo(requestMessage: request, complete: {[unowned self] (responseMessage) in
                    
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
                            if let responsedata = responseMessage.data as? ContactBusinessResponse
                            {
                                self.contactData = responsedata
                                self.viewController?.showAlertVIew(message: responsedata.message, title: "")
                                self.viewController?.emailAddressTextField.text = ""
                                self.viewController?.phoneTextField.text = ""
                                self.viewController?.messageTextField.text = ""

                            }
                            
                            
                        }
                    case .Failure:
                        GCD.async(.Main)
                        {
                            self.viewController?.showAlertVIew(message: responseMessage.message, title: "")
                        }
                    default:
                        GCD.async(.Main)
                        {
                            self.viewController?.showAlertVIew(message: FAILED_MESSAGE, title: "")

                        }
                    }
                })
            }
            
            
        }
    }
}
