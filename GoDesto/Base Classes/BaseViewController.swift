//
//  BaseViewController.swift
//  AlKadi
//
//  Created by Khurram Bilal Nawaz on 22/07/2016.
//  Copyright © 2016 Khurram Bilal Nawaz. All rights reserved.
//

import Foundation
import UIKit

import MBProgressHUD
import KVNProgress


extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    var snapshot: UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: false)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
    
    class func fromNib<T : UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}


extension UIViewController{
    
    var mainContainer : MainContainerViewController? {

        get{
            var foundController: MainContainerViewController? = nil
            var currentViewController : UIViewController? = self

            if(self.isKind(of: MainContainerViewController.self)){
                foundController = (self as! MainContainerViewController)
            }else{
                while true{
                    if let parent = currentViewController?.parent {
                        if parent.isKind(of: MainContainerViewController.self){
                            foundController = (parent as! MainContainerViewController)
                            break
                        }else if parent.isKind(of: BaseNavigationController.self){
                            let navController = parent as! BaseNavigationController
                            if let parentController = navController.view.superview?.parentViewController{
                                if parentController.isKind(of: MainContainerViewController.self){
                                    foundController = (parentController as! MainContainerViewController)
                                    break
                                }
                            }
                        }

                    }
                    else {
                        break
                    }
                    currentViewController = currentViewController?.parent
                }
            }

            return foundController
        }
    }
//
//    var homeContainerController : HomeViewController? {
//        
//        get{
//            var foundController: HomeViewController? = nil
//            var currentViewController : UIViewController? = self
//            
//            if(self.isKind(of: HomeViewController.self)){
//                foundController = (self as! HomeViewController)
//            }else{
//                while true{
//                    if let parent = currentViewController?.parent {
//                        if parent.isKind(of: HomeViewController.self){
//                            foundController = (parent as! HomeViewController)
//                            break
//                        }else if parent.isKind(of: BaseNavigationController.self){
//                            let navController = parent as! BaseNavigationController
//                            if let parentController = navController.view.superview?.parentViewController{
//                                if parentController.isKind(of: HomeViewController.self){
//                                    foundController = (parentController as! HomeViewController)
//                                    break
//                                }
//                            }
//                        }
//                        
//                    }
//                    else {
//                        break
//                    }
//                    currentViewController = currentViewController?.parent
//                }
//            }
//            
//            return foundController
//        }
//    }
}


public class BaseViewController : UIViewController,SWRevealViewControllerDelegate {
    
    var hud = MBProgressHUD()
    
    var disableMenuGesture: Bool = false
    var objAlertVC:BaseViewController?
    var datePickerView: UIDatePicker = UIDatePicker()
    var alertView = CustomIOSAlertView()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    func addTapGesture()  {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    func addSideMenu(button:UIButton)  {
        if revealViewController() != nil {
            revealViewController().panGestureRecognizer()
            revealViewController().tapGestureRecognizer()
            revealViewController().rearViewRevealWidth = ScreenSize.SCREEN_WIDTH - 50
            revealViewController().delegate = self
            button.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            
        }
    }

    
    func languageUpdated(){
        
    }
    
    func actionNextOnContainer(){
        
    }
    
    func actionPreviousOnContainer(){
        
    }
    
    func actionSubmitOnContainer(){
        
    }
    
    func actionCloseOnContainer(){
        
    }
    func setBorderColor(view:UIView,width:CGFloat? = 1) {
        view.layer.borderWidth = width!
        view.layer.borderColor = APPLICATION_THEME_COLOR.cgColor
    }
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = EMAIL_REGULAR_EXPRESSION
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func startActivity (containerView: UIView? = nil) {
        
        
        
       
        if let v = containerView{
            self.hud = MBProgressHUD.showAdded(to: v, animated:true)
        }else{
            self.hud = MBProgressHUD.showAdded(to: self.view, animated:true)
        }
        self.hud.color = UIColor(red:255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha:0.0)
        //self.setBorderColor(self.hud, red: 198.0/255.0, green: 176.0/255.0, blue: 157.0/255.0, alpha: 0.75)
        
        self.hud.mode = MBProgressHUDMode.customView
        self.hud.dimBackground = true
        //self.hud.color = UIColor.white
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 87, height: 87))
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
        imageView.animationDuration = 2.5
        var images : [UIImage] = [UIImage]()
        for i in 0...59 {
            if let img = UIImage(named: "LoaderAnimation\(i).png") {
                images.append(img)
            }
        }

        imageView.animationImages = images
        imageView.startAnimating()

        self.hud.customView = imageView
    }
    
    func startSplashActivity (containerView: UIView? = nil) {
        
        
        if let v = containerView{
            self.hud = MBProgressHUD.showAdded(to:v, animated:true)
        }else{
            self.hud = MBProgressHUD.showAdded(to:self.view, animated:true)
        }
        self.hud.color = UIColor(red:255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha:0.0)
        //self.setBorderColor(self.hud, red: 198.0/255.0, green: 176.0/255.0, blue: 157.0/255.0, alpha: 0.75)
        
        self.hud.mode = MBProgressHUDMode.customView
        let imageView = UIImageView(frame: CGRect(x:0, y:0, width:40, height:40))
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        
        imageView.animationDuration = 3.2
        
        var images : [UIImage] = [UIImage]()
        for i in 0...24 {
            if let img = UIImage(named: "SplashLoaderAnimation\(i).png") {
                images.append(img)
            }
        }
        for i in 0...23 {
            if let img = UIImage(named: "SplashLoaderAnimation\(23-i).png") {
                images.append(img)
            }
        }
        
        imageView.animationImages = images
        imageView.startAnimating()
        
        self.hud.customView = imageView
    }
    
    func stopActivity (containerView: UIView? = nil) {
        if let v = containerView{
            MBProgressHUD.hide(for: v, animated: true)
        }else{
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
//    func stopActivity (containerView: UIView? = nil) {
//        if let _ = containerView{
//            KVNProgress.dismiss()
//        }else{
//            KVNProgress.dismiss()
//        }
//    }
//    
    
//    func startActivityWithMessage (msg:String, detailMsg: String = "") {
//        self.hud = MBProgressHUD.showAdded(to: self.view, animated:true)
//        hud.color = UIColor.gray
//        hud.activityIndicatorColor = UIColor.white
//        self.hud.labelText = msg
//        self.hud.detailsLabelText = detailMsg
//    }

    func startActivityWithMessage (msg:String, detailMsg: String = "") {
        KVNProgress.show()
//        self.hud = MBProgressHUD.showAdded(to: self.view, animated:true)
//        hud.color = UIColor.gray
//        hud.activityIndicatorColor = UIColor.white
//        self.hud.labelText = msg
//        self.hud.detailsLabelText = detailMsg
    }
    
    func startActivityInView(view: UIView) {
        self.hud = MBProgressHUD.showAdded(to: view, animated:true)
        
        //self.hud.activityIndicatorColor = UIColor.blackColor()
        //self.hud.color = UIColor.clearColor()
        self.hud.layoutSubviews()
    }
    
    func updateActivityMessage (msg:String, detailMsg: String = "") {
        self.hud.labelText = msg
        self.hud.detailsLabelText = detailMsg
    }
    
    func handleDefaultResponse(response: ServiceResponseMessage) {
        
        if response.serviceResponseType != .Success {
            //let message = response.message
            //UIAlertView(title: "Failure", message: message, delegate: nil, cancelButtonTitle: "OK").show()
        }
        
    }
    
    
    //Mark:-designButton
    func designButton(button: UIButton, borderWidth: CGFloat, cornerRadius: CGFloat, borderColor: UIColor?){
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor?.cgColor
    }
    //Mark:-designTextFiled
    func designTextField(textField: UITextField, borderWidth: CGFloat, cornerRadius: CGFloat, borderColor: UIColor?){
        textField.layer.cornerRadius = cornerRadius
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = borderColor?.cgColor
    }
    //Mark:-designTextView
    func designTextView(textview: UITextView, borderWidth: CGFloat, cornerRadius: CGFloat, borderColor: UIColor?){
        textview.layer.cornerRadius = cornerRadius
        textview.layer.borderWidth = borderWidth
        textview.layer.borderColor = borderColor?.cgColor
    }
    
    
    //Mark:-SetImageWithUrl
    func setImageWithUrl(imageView:UIImageView,url:String, profile:String? = "DummyProfile"){
        if let imageurl =  NSURL.init(string: url){
            imageView.setIndicatorStyle(UIActivityIndicatorViewStyle.gray)
            //imageView.setShowActivityIndicator(true)
            imageView.sd_setImage(with: imageurl as URL!, placeholderImage: UIImage(named:profile!))
//            imageView.sd_setImage(with: imageurl as URL!, completed: { (image, error, type, url) in
//                imageView.setShowActivityIndicator(false)
//                if ((error) != nil) {
//                    if let pCircle = profileCircle{
//                        if (pCircle == true) {
//                            imageView.image = UIImage(named: "EmptyNode")
//                        }
//                    }
//                }
//            })
        }
    }
    
    func setPlaceholderTextColor(textfield:UITextField,text:String) {
        
        textfield.attributedPlaceholder = NSAttributedString(string: text,
                                                                       attributes: [NSAttributedStringKey.foregroundColor: UIColor.groupTableViewBackground])
        

    }
    func setPlaceholderBlackColor(textfield:UITextField){
        
        textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder!,
                                                             attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])
        
      
    }
    
    
    func setBorderColor(_ view:UIView,red:CGFloat,green:CGFloat,blue:CGFloat,alpha:CGFloat, width: CGFloat? = 1) {
        
        view.layer.borderWidth = width!
        view.layer.borderColor = UIColor(red: red/255, green: green/255, blue: blue/255, alpha:alpha).cgColor
    }

    //MARK:-setToolbarOnPickerView
    func addToolBarToPickerView(textField:UITextField)
    {
        var buttonDone = UIBarButtonItem()
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        toolbar.sizeToFit()
        let buttonflexible = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        //buttonDone = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.Done, target:self, action:#selector(BaseViewController.doneClicked(_:)))
        
        
        let button =  UIButton(type: .custom)
        button.addTarget(self, action: #selector(BaseViewController.doneClicked(_:)), for: .touchUpInside)
        //button.frame = CGRectMake(0, 0, 53, 31)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
      //  button.setTitleColor(UIColor(netHex: 0xAE2540), for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        button.contentMode = UIViewContentMode.right
        button.frame = CGRect(x:0, y:0, width:60, height:40)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 5, 0)
        
        buttonDone = UIBarButtonItem(customView: button)
        
        
        toolbar.setItems(Array.init(arrayLiteral: buttonflexible,buttonDone), animated: true)
        textField.inputAccessoryView = toolbar
        
    }
    func addToolBarToPickerViewOnTextview(textview:UITextView)
    {
        var buttonDone = UIBarButtonItem()
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        toolbar.sizeToFit()
        let buttonflexible = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        //buttonDone = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.Done, target:self, action:#selector(BaseViewController.doneClicked(_:)))
        //buttonDone.title = "ye bat"
        
        let button =  UIButton(type: .custom)
        button.addTarget(self, action: #selector(BaseViewController.doneClicked(_:)), for: .touchUpInside)
        //button.frame = CGRectMake(0, 0, 53, 31)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        //button.setTitleColor(UIColor(netHex: 0xAE2540), for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        button.contentMode = UIViewContentMode.right
        button.frame = CGRect(x:0, y:0, width:60, height:40)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 5, 0)
        
        buttonDone = UIBarButtonItem(customView: button)
        toolbar.setItems(Array.init(arrayLiteral: buttonflexible,buttonDone), animated: true)
        textview.inputAccessoryView = toolbar
        
    }
    override public func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing,animated:animated)
        if (self.isEditing) {
            self.editButtonItem.title = "Editing"
        }
        else {
            self.editButtonItem.title = "Not Editing"
        }
    }
    
    
    @IBAction func doneClicked(_ sender:AnyObject)
    {
        self.hideKeyboard()
    }
    func hideKeyboard() {
        self.view.endEditing(true)
    }

    func showAlertVIew(message:String, title:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            self.closeAlertMessage()
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    func closeAlertMessage() {
        
    }
    func checkInternetConnection() -> Bool {
        if(BReachability.isConnectedToNetwork()){
            return true
        }else{
            self.showAlertVIew(message:ERROR_NO_NETWORK, title: "Alert")
            return false
        }
    }

   
    // Get Profile Data and navigate to Profile Detail Screen
  }
//MARK:-
//MARK:-Add Review Popup
//MARK:-
extension BaseViewController:AddReviewPopupDelegate{
    func createAddReviewPopup()
    {
        self.alertView = CustomIOSAlertView()
        self.alertView?.buttonTitles = nil
        self.alertView?.useMotionEffects = true
        var demoView:UIView!
        demoView = UIView()
        
        let storyBoard: UIStoryboard = UIStoryboard(name: StoryboardName.Popup, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: PopupIdentifier.AddReviewPopupViewController)as? AddReviewPopupViewController
        {
            vc.delegate = self
            self.objAlertVC = vc
            demoView.frame = CGRect(x:0, y:0, width:ScreenSize.SCREEN_WIDTH - 50 , height:188)
            vc.view.frame = CGRect(x:0, y:0, width:ScreenSize.SCREEN_WIDTH - 50 , height:188)
            demoView.addSubview(vc.view)
            
            self.alertView?.containerView = demoView
        }
        
    }
    func actionCallBackClosePopup() {
        self.alertView?.close()
    }
    func actionCallBcakAddReview(text:String,rating:Double){
        self.alertView?.close()
    }
}



