//
//  LoginViewController.swift
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
class LoginViewController: BaseViewController {
    
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var txtEmail:UITextField!
    @IBOutlet weak var txtPassword:UITextField!
    @IBOutlet weak var viewBackground:UIView!
    
    
    
let loginManager: LoginManager = LoginManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        self.viewBackground.layer.cornerRadius = 20
        self.addTapGesture()
        
        self.txtEmail.text = "ghafar@gmail.com"
        self.txtPassword.text = "12345"
        // Do any additional setup after loading the view.
        
    }
   
    func checkFormValidation() -> Bool {
        var isFormFilled = true
        if(self.txtEmail.text!.isEmpty || self.txtPassword.text!.isEmpty){
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
   
    //MARK:-ACTION METHODS
    @IBAction func actionBack(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func actionLogin(_ sender:UIButton){
        if(self.checkFormValidation()){
            if(self.checkInternetConnection()){
                self.doLogin()
            }
        }
    }
    @IBAction func actionLoginWithFacebook(_ sender:UIButton){
        if(self.checkInternetConnection()){
            self.doLoginWithFacebook()
        }
    }
    @IBAction func actionLoginWithGoogle(_ sender:UIButton){
        if(self.checkInternetConnection()){
            Global.shared.isFbLogin = false
            GIDSignIn.sharedInstance().signIn()
        }
    }
    @IBAction func actionForgotPassword(_ sender:UIButton){
        let storyboard = UIStoryboard.init(name: StoryboardName.Registration, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.ForgotPasswordViewController) as? ForgotPasswordViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func actionRegister(_ sender:UIButton){
        let storyboard = UIStoryboard.init(name: StoryboardName.Registration, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.SignupViewController) as? SignUpViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    

}
//MARK:-  GIDSignInDelegate Methods
extension LoginViewController: GIDSignInDelegate,GIDSignInUIDelegate {


    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        GCD.async(.Main) {
            self.stopActivity()
        }
        if (error == nil) {
//
//            Global.shared.signup = SignupViewModel()
//            Global.shared.signup?.firstName = user.profile.na
//            Global.shared.signup?.name = user.profile.name
//            Global.shared.signup?.imageUrl = user.profile.imageURL(withDimension: 300).absoluteString
//            Global.shared.signup?.appId = user.userID
//            Global.shared.signup?.accountType = "google"
            // Global.shared.signup?.email = user.email

            // self.checkSocialMediaLogin()
            print("login")
            self.showAlertVIew(message: "Google Login Successfully", title: "")

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
extension LoginViewController{
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
        
        GCD.async(.Main, execute: {
            self.startActivityWithMessage(msg: "")
        })
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
                self.showAlertVIew(message: "Facebook Login Successfully", title: "")
                if let res = response.dictionaryValue{
                    Global.shared.signup = SignupViewModel(login: res)
                    Global.shared.signup?.appId = token.appId
                    Global.shared.signup?.accountType = "facebook"
                    //self.checkSocialMediaLogin()
                }
                //self.showAlertVIew(message: "Login Successfully", title: "Success")
                
                Global.shared.isFbLogin = false
            }
        }
        connection.start()
    }
}
//MARK:- LOGIN API
extension LoginViewController{
    func doLogin()  {
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.email = self.txtEmail!.text!
        requestMessage?.password = self.txtPassword!.text!
        if let _ = Global.shared.FCMToken{
            requestMessage?.FCMToken = Global.shared.FCMToken!
        }
        if let request = requestMessage{
            GCD.async(.Default){

                GCD.async(.Main){
                    self.startActivity()

                }
                let service = LoginService()
                service.doLogin(requestMessage: request, complete: { (responseMessage) in

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
                                UserDefaults.standard.set(true, forKey: IS_USER_LOGIN)
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
extension LoginViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
