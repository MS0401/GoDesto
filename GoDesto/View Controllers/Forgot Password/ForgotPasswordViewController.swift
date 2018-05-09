//
//  ForgotPasswordViewController.swift
//  JayEat
//
//  Created by Ghafar Tanveer on 15/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {

    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var txtEmail:UITextField!
    @IBOutlet weak var viewBackground:UIView!
    
    var isSucsess = false
    override func viewDidLoad() {
        super.viewDidLoad()
  
        self.viewBackground.layer.cornerRadius = 20
        
        self.addTapGesture()
    }
   
    func checkFormValidation() -> Bool {
        if(self.txtEmail.text!.isEmpty){
            self.showAlertVIew(message: ENTER_EMAIL_MESSAGE, title: "")
            return false
        }else if(!self.isValidEmail(testStr: self.txtEmail.text!)){
            self.showAlertVIew(message: VALID_EMAIL_MESSAGE, title: "")
            return false
        }
        return true
    }
    override func closeAlertMessage() {
        if(isSucsess){
            self.navigationController?.popViewController(animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionSubmit(_ sender:UIButton){
        if(self.checkFormValidation()){
            if(self.checkInternetConnection()){
                self.getPassword()
            }
        }
    }
    @IBAction func actionBack(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }

}
//MARK:- FORGOT PASSWORD API
extension ForgotPasswordViewController{
    func getPassword()  {
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.email = self.txtEmail!.text!
        if let request = requestMessage{
            GCD.async(.Default){
                
                GCD.async(.Main){
                    self.startActivity()
                    
                }
                let service = RegistrationService()
                service.fogotPassword(requestMessage: request, complete: { (responseMessage) in
                    GCD.async(.Main){
                        self.stopActivity()
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let response = responseMessage.data as? DefaultResponseViewModel{
                                self.showAlertVIew(message: response.message, title: "")
                                if(response.status == "1"){
                                    self.isSucsess = true
                                }
                            }else{
                                self.showAlertVIew(message: responseMessage.message, title: "")
                            }
                        }
                    case .Failure:
                        GCD.async(.Main){
                            self.showAlertVIew(message: responseMessage.message, title: "")
                            
                        }
                    default:
                        GCD.async(.Main){
                            self.showAlertVIew(message: FAILED_MESSAGE, title: "")
                            
                        }
                    }
                })
            }
            
        }
        
    }
}
extension ForgotPasswordViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

