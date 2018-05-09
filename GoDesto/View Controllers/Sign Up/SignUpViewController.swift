//
//  SignUpViewController.swift
//  JayEat
//
//  Created by Ghafar Tanveer on 15/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import Google
import GoogleSignIn

class SignUpViewController: BaseViewController {
    
    @IBOutlet weak var txtEmail:UITextField!
    @IBOutlet weak var txtPassword:UITextField!
    @IBOutlet weak var txtFirstName:UITextField!
    @IBOutlet weak var txtLastName:UITextField!
     @IBOutlet weak var viewBackground:UIView!
    
    
    
    
    let loginManager: LoginManager = LoginManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        self.viewBackground.layer.cornerRadius = 20
    
         self.addTapGesture()
    }

    
    func checkFormValidation() -> Bool {
        var isFormFilled = true
        if(self.txtFirstName.text!.isEmpty || self.txtLastName.text!.isEmpty || self.txtEmail.text!.isEmpty || self.txtPassword.text!.isEmpty){
            self.showAlertVIew(message: FILL_ALL_FIELDS_MESSAGE, title: "")
            isFormFilled = false
        }else if(!self.isValidEmail(testStr: self.txtEmail.text!)){
            self.showAlertVIew(message: VALID_EMAIL_MESSAGE, title: "")
            isFormFilled = false
        }
        return isFormFilled
    }
    func showHomeScreen()  {
        let storyboard = UIStoryboard.init(name: StoryboardName.Main, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.RevealViewController) as? SWRevealViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- ACTION METHODS
    @IBAction func actionSignUp(_ sender:UIButton){
        if(self.checkFormValidation()){
            if(self.checkInternetConnection()){
                self.createNewAcccount()
            }
        }
    }
    @IBAction func actionLogin(_ sender:UIButton){
        let storyboard = UIStoryboard.init(name: StoryboardName.Registration, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.LoginViewController) as? LoginViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func actionBack(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionLoginWithFacebook(_ sender:UIButton){
        if(self.checkInternetConnection()){
            self.doLoginWithFacebook()
        }
        
    }
    @IBAction func actionLoginWithGoogle(_ sender:UIButton){
        if(self.checkInternetConnection()){
            //            GCD.async(.Main) {
            //                self.startActivityWithMessage(msg: "")
            //            }
            Global.shared.isFbLogin = false
            GIDSignIn.sharedInstance().signIn()
        }
    }

}
//MARK:-  GIDSignInDelegate Methods
extension SignUpViewController: GIDSignInDelegate,GIDSignInUIDelegate {
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        GCD.async(.Main) {
            self.stopActivity()
        }
        if (error == nil) {
            
            self.txtFirstName.text = user.profile.givenName
            self.txtLastName.text = user.profile.familyName
            self.txtEmail.text = user.profile.email
            
        } else {
            print("\(error.localizedDescription)")
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        GCD.async(.Main) {
            self.stopActivity()
        }
    }
    
    
}
//MARK:- Facebook login
extension SignUpViewController{
    func doLoginWithFacebook()  {
        
        self.loginManager.logOut()
        //        GCD.async(.Main, execute: {
        //            self.startActivityWithMessage(msg: "")
        //        })
        Global.shared.isFbLogin = true
        self.loginManager.loginBehavior = .browser
        self.loginManager.logIn(readPermissions: [ .publicProfile, .email, .userFriends], viewController: self) { (loginResult) in
            
            GCD.async(.Main, execute: {
                self.stopActivity()
            })
            switch loginResult
            {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print(grantedPermissions)
                print(declinedPermissions)
                print(accessToken)
                print("Logged in!")
                self.fetchFacebookProfileInfo(token: accessToken)
                
            }
        }
        
        
        
    }
    func fetchFacebookProfileInfo(token:AccessToken) {
        
//        GCD.async(.Main, execute: {
//            self.startActivityWithMessage(msg: "")
//        })
        let connection = GraphRequestConnection()
        connection.add(GraphRequest(graphPath: "me", parameters: ["fields": "id, email, first_name, gender, last_name, location, hometown, picture.type(large)"]))
        {
            httpResponse, result in
            GCD.async(.Main, execute: {
                self.stopActivity()
            })
            switch result {
            case .failed(let error):
                print("Graph Request Failed: \(error)")
                
            case .success(let response):
                print("Graph Request Succeeded: \(response)")
                if let res = response.dictionaryValue{
                    let signup = SignupViewModel(login: res)
                    self.txtEmail.text = signup.email
                    self.txtFirstName.text = signup.firstName
                    self.txtLastName.text = signup.lastName
                }
                Global.shared.isFbLogin = false
            }
        }
        connection.start()
    }
}
//MARK:- SIGN UP API
extension SignUpViewController{
    func createNewAcccount()  {
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.email = self.txtEmail!.text!
        requestMessage?.password = self.txtPassword!.text!
        requestMessage?.firstName = self.txtFirstName.text!
        requestMessage?.lastName = self.txtLastName.text!
        if let _ = Global.shared.FCMToken{
            requestMessage?.FCMToken = Global.shared.FCMToken!
        }
        if let request = requestMessage{
            GCD.async(.Default){
                
                GCD.async(.Main){
                    self.startActivity()
                    
                }
                let service = RegistrationService()
                service.resgisterService(requestMessage: request, complete: { (responseMessage) in
                    GCD.async(.Main){
                        self.stopActivity()
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let login = responseMessage.data as? LoginViewModel {
                                Global.shared.login = login
                                let encodedData = NSKeyedArchiver.archivedData(withRootObject: Global.shared.login ?? LoginViewModel())
                                UserDefaults.standard.set(encodedData, forKey: LOGIN_KEY)
                                UserDefaults.standard.set(true, forKey: KEEP_LOGIN)
                                UserDefaults.standard.synchronize()
                                
                                self.showHomeScreen()
                                print("Message is : \(responseMessage.message)")
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
extension SignUpViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

