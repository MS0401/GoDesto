//
//  EditProfileViewController.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 3/27/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class EditProfileViewController: BaseViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmailAddress: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtStreetAddress: UITextField!
    @IBOutlet weak var txtCityAddress: UITextField!
    @IBOutlet weak var txtZipCode: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var dailyCheckBTN:UIButton!
    @IBOutlet weak var weeklyCheckBTN:UIButton!
    @IBOutlet weak var notInterestedCheckBTN:UIButton!
    @IBOutlet weak var dailyCheckLBL:UILabel!
    @IBOutlet weak var weeklyCheckLBL:UILabel!
    @IBOutlet weak var notInterestedCheckLBL:UILabel!
    
    
    var selectedChoice = "Daily"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.setupUI()
        
        if self.checkInternetConnection(){
            
            self.fillData()
    
        }
        
        
    }
    
    
    
    private func setupUI()
    {
        self.dailyCheckBTN.layer.cornerRadius = self.dailyCheckBTN.frame.size.height / 2
        self.dailyCheckBTN.layer.borderColor = UIColor.black.cgColor
        self.dailyCheckBTN.layer.borderWidth = 1.0
        self.dailyCheckBTN.backgroundColor = #colorLiteral(red: 0.8883545995, green: 0.3426011801, blue: 0.1455500126, alpha: 1)
        
        self.weeklyCheckBTN.layer.cornerRadius = self.weeklyCheckBTN.frame.size.height / 2
        self.weeklyCheckBTN.layer.borderColor = UIColor.black.cgColor
        self.weeklyCheckBTN.layer.borderWidth = 1.0
        
        self.notInterestedCheckBTN.layer.cornerRadius = self.notInterestedCheckBTN.frame.size.height / 2
        self.notInterestedCheckBTN.layer.borderColor = UIColor.black.cgColor
        self.notInterestedCheckBTN.layer.borderWidth = 1.0
        
        
        // NewsLetter Label Text
        
        
        self.dailyCheckLBL.attributedText = setAtributedString(start: DailyNewsletter1, End:DailyNewsletter2 )
        self.weeklyCheckLBL.attributedText = setAtributedString(start: Weekly_Newsletter_1, End: Weekly_Newsletter_2 )
        self.notInterestedCheckLBL.attributedText = setAtributedString(start: NotInterested_Newsletter_1, End: NotInterested_Newsletter_2 )
        
        
    }
    

    private func setAtributedString(start:String,End:String) -> NSMutableAttributedString
    {
        
        let attrs1 = [NSAttributedStringKey.font : UIFont.init(name: FontName.MyriadProBold, size: 15), NSAttributedStringKey.foregroundColor : UIColor.black]
        
        let attrs2 = [NSAttributedStringKey.font : UIFont.init(name: FontName.MyriadProRegular, size: 15), NSAttributedStringKey.foregroundColor : UIColor.black]
        
        let attributedString1 = NSMutableAttributedString(string:start, attributes:attrs1)
        
        let attributedString2 = NSMutableAttributedString(string:End, attributes:attrs2)
        
        attributedString1.append(attributedString2)
        
        return attributedString1
        
    }
    
    
    func checkFormValidation() -> Bool {
        var isFormFilled = true
//        if(self.txtEmailAddress.text!.isEmpty || self.txtName.text!.isEmpty){
//            self.showAlertVIew(message: FILL_ALL_FIELDS_MESSAGE, title: "")
//            isFormFilled = false
//        }else
        if(!self.isValidEmail(testStr: self.txtEmailAddress.text!)){
            self.showAlertVIew(message: VALID_EMAIL_MESSAGE, title: "")
            isFormFilled = false
        }
        return isFormFilled
    }
    
    
    @IBAction func newsLetterChoice(sender:UIButton)
    {
        if sender.tag == 0
        {
            self.selectedChoice = "Daily"
            self.dailyCheckBTN.backgroundColor = #colorLiteral(red: 0.8883545995, green: 0.3426011801, blue: 0.1455500126, alpha: 1)
            self.notInterestedCheckBTN.backgroundColor = UIColor.white
            self.weeklyCheckBTN.backgroundColor = UIColor.white
        }
        if sender.tag == 1
        {
            self.selectedChoice = "Weekly"
            self.dailyCheckBTN.backgroundColor = UIColor.white
            self.notInterestedCheckBTN.backgroundColor = UIColor.white
            self.weeklyCheckBTN.backgroundColor = #colorLiteral(red: 0.8883545995, green: 0.3426011801, blue: 0.1455500126, alpha: 1)
        }
        
        if sender.tag == 2
        {
            self.selectedChoice = "NotInterested"
            self.dailyCheckBTN.backgroundColor = UIColor.white
            self.notInterestedCheckBTN.backgroundColor = #colorLiteral(red: 0.8883545995, green: 0.3426011801, blue: 0.1455500126, alpha: 1)
            self.weeklyCheckBTN.backgroundColor = UIColor.white
        }
    }
    
    
    @IBAction func updateNewsletterPref(_ sender:UIButton)
    {
        if(self.checkInternetConnection()){
            self.updatePrefNewsletter()
            
        }
        
    }
    
    @IBAction func actionUpdateDetails(_ sender:UIButton)
    {
        if self.checkInternetConnection(){
            if checkFormValidation(){
                
                self.updateProfileDetails()

            }
            
        }
    }
    
    
    @IBAction func actionPasswordReset(_ sender:UIButton)
    {
        if self.checkInternetConnection(){
            
            if self.txtNewPassword.text! == self.txtConfirmPassword.text!
            {
                self.passwordReset()
            }
            else
            {
                self.showAlertVIew(message: "Error", title: "Password Does Not Match!!")
            }
            
            
            
        }
        
    }
    
    
    @IBAction func actionBack(_ sender:UIButton){
        
        if let container = self.mainContainer{
            
            container.bottomViewHeight.constant = 60
        }
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension EditProfileViewController{
    
    
    func fillData()
    {
        
        
        if let data = Global.shared.login
        {
            self.txtName.text = data.firstName
            self.txtLastName.text = data.lastName
            self.txtEmailAddress.text = data.email
            self.txtCountry.text = data.country
            self.txtCityAddress.text = data.city
            self.txtPhoneNumber.text = data.phone
            self.txtZipCode.text = data.region
            self.txtStreetAddress.text = data.addUrl
            print(data.letterDuration)
            if data.letterDuration == "Daily"
            {
                self.newsLetterChoice(sender: self.dailyCheckBTN)
            }
            else if data.letterDuration == "Weekly"
            {
                self.newsLetterChoice(sender: self.weeklyCheckBTN)
            }
            else
            {
                self.newsLetterChoice(sender: self.notInterestedCheckBTN)
            }
        }
        
        
        
        
    }
    
    
    func updateProfileDetails()
    {
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.email = self.txtEmailAddress.text!
        requestMessage?.address = self.txtStreetAddress.text!
        requestMessage?.phoneNumber = self.txtPhoneNumber.text!
        requestMessage?.city = self.txtCityAddress.text!
        requestMessage?.region = self.txtZipCode.text!
        requestMessage?.lastName  = self.txtLastName.text!
        requestMessage?.firstName = self.txtName.text!
        requestMessage?.title = "Mr"
        requestMessage?.country = self.txtCountry.text!
        
    
        
        if let request = requestMessage{
            GCD.async(.Default){
                
                GCD.async(.Main){
                    self.startActivity()
                    
                }
                let service = UpdateProfileService()
                service.updateProfile(requestMessage: request, complete: { (responseMessage) in
                    
                    GCD.async(.Main){
                        self.stopActivity()
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let login = responseMessage.data as? LoginViewModel {
                                print(login.loginId)
                                Global.shared.login = login
                                let encodedData = NSKeyedArchiver.archivedData(withRootObject: Global.shared.login ?? LoginViewModel())
                                UserDefaults.standard.set(encodedData, forKey: LOGIN_KEY)
                                UserDefaults.standard.set(true, forKey: KEEP_LOGIN)
                                UserDefaults.standard.synchronize()
                                print("Message is : \(responseMessage.message)")
                                self.showAlertVIew(message: "Success", title: "Update Successfull")
                            }else {
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
    
    func passwordReset()
    {
        
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.password = self.txtNewPassword.text!
        
        if let request = requestMessage{
            GCD.async(.Default){
                
                GCD.async(.Main){
                    self.startActivity()
                    
                }
                let service = UpdateProfileService()
                service.updatePassword(requestMessage: request, complete: { (responseMessage) in
                    
                    GCD.async(.Main){
                        self.stopActivity()
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let login = responseMessage.data as? LoginViewModel {
                                print(login.loginId)
                                Global.shared.login = login
                                let encodedData = NSKeyedArchiver.archivedData(withRootObject: Global.shared.login ?? LoginViewModel())
                                UserDefaults.standard.set(encodedData, forKey: LOGIN_KEY)
                                UserDefaults.standard.set(true, forKey: KEEP_LOGIN)
                                UserDefaults.standard.synchronize()
                                print("Message is : \(responseMessage.message)")
                                self.txtConfirmPassword.text = ""
                                self.txtNewPassword.text = ""
                                self.showAlertVIew(message: "Password Reset Successfull", title: "")
                            }else {
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
    
    
    func updatePrefNewsletter()  {
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.newsLetterPref = self.selectedChoice
        
        if let request = requestMessage{
            GCD.async(.Default){
                
                GCD.async(.Main){
                    self.startActivity()
                    
                }
                let service = UpdateProfileService()
                service.updateNewsletterPref(requestMessage: request, complete: { (responseMessage) in
                    
                    GCD.async(.Main){
                        self.stopActivity()
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let login = responseMessage.data as? LoginViewModel {
                                print(login.loginId)
                                Global.shared.login = login
                                let encodedData = NSKeyedArchiver.archivedData(withRootObject: Global.shared.login ?? LoginViewModel())
                                UserDefaults.standard.set(encodedData, forKey: LOGIN_KEY)
                                UserDefaults.standard.set(true, forKey: KEEP_LOGIN)
                                UserDefaults.standard.synchronize()
                                print("Message is : \(responseMessage.message)")
                                self.showAlertVIew(message: "Newsletter Preference Updated Successfull", title: "")
                            }else {
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

