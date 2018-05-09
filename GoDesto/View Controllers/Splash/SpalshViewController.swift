//
//  SpalshViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 16/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
import CoreLocation

class SpalshViewController: BaseViewController {
    @IBOutlet weak var logoCenterVerticalSpace:NSLayoutConstraint?
    @IBOutlet weak var textCenterHorizentalSpace:NSLayoutConstraint?
    @IBOutlet weak var logoLeadingSpace:NSLayoutConstraint?
    @IBOutlet weak var logoTrailingSpace:NSLayoutConstraint?
    
    @IBOutlet weak var imgLogo:UIImageView?
    @IBOutlet weak var lblText:UILabel?
    
     let locationManager = CLLocationManager()
    var isLocationSelected:Bool = false
    var lat:String = "31.5204"
    var long:String = "74.3587"
    var country:String = ""
    var city:String = ""
    var isDataFetched:Bool?  = false
    var isAnimationCompleted:Bool = false
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        self.lblText?.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.lblText?.text = ""

        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }else{
           // self.showLocationPermissionPopup()
        }
        self.getSplashInfo()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       // GCD.async(.Main) {
            var imageList = [UIImage]()
            self.imgLogo?.image = UIImage(named:"godesto_logo_\(99)")!
            for i in 0 ..< 100{
                imageList.append(UIImage(named:"godesto_logo_\(i)")!)
            }
            self.imgLogo?.animationImages = imageList
            self.imgLogo?.animationDuration = 3.5
            self.imgLogo?.animationRepeatCount = 1
            
            self.imgLogo?.startAnimatingWithCompletionBlock {
                self.lblText?.text = "Your one stop shop"
                self.imgLogo?.image = UIImage(named:"godesto_logo_\(99)")!
                self.isAnimationCompleted = true
                self.showLandingScreen()
            }
            
        //}
        
        
        
//        let colorKeyframeAnimation = CAKeyframeAnimation(keyPath: "backgroundColor")
//
//        colorKeyframeAnimation.values = imageList
//        colorKeyframeAnimation.keyTimes = [0, 0.5, 1]
//        colorKeyframeAnimation.duration = 2
//
        
       
        
    }
    
    
    func showLandingScreen()  {
        if(self.isDataFetched! && self.isAnimationCompleted){
            GCD.async(.Main, delay: 0) {
                
//                if (UserDefaults.value(forKey: IS_USER_LOGIN) as! Bool){
//                if (UserDefaults.standard.object(forKey:IS_USER_LOGIN) != nil){
                    if let data = Global.shared.login
                    {

                    let storyboard = UIStoryboard.init(name: StoryboardName.Main, bundle: nil)
                    if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.RevealViewController) as? SWRevealViewController {
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                    
                }else {
                    
                    let storyboard = UIStoryboard.init(name: StoryboardName.Registration, bundle: nil)
                    if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.LandingViewController) as? LandingViewController{
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }
        }
    }

    func fetchCountryAndCity(location: CLLocation, completion: @escaping (String, String) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print(error)
            } else if let country = placemarks?.first?.country,
                let city = placemarks?.first?.locality {
                completion(country, city)
            }
        }
    }
    func showLocationPermissionPopup() {
        
        let alert = UIAlertController(title: LocationService.ServiceOff, message: LocationService.AllowLocationMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: LocationService.Settings, style: .default, handler: { (action) in
            let settingUrl =  URL(string: "App-Prefs:root=\(Bundle.main.bundleIdentifier!)&path=Location")
            
            if let _ = URL(string: UIApplicationOpenSettingsURLString + Bundle.main.bundleIdentifier!) {
                if UIApplication.shared.canOpenURL(settingUrl!) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(settingUrl!, completionHandler: { (success) in
                            print("Settings opened: \(success)") // Prints true
                        })
                    } else {
                        UIApplication.shared.openURL(settingUrl!)
                        // Fallback on earlier versions
                    }
                }
                
            }
        }))
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
//MARK:-
//MARK:- CORE LOCATION DELEGATE
//MARK:-
extension SpalshViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if(!self.isLocationSelected){
            self.isLocationSelected = true
            let locValue:CLLocationCoordinate2D = manager.location!.coordinate
            print("locations = \(locValue.latitude) \(locValue.longitude)")
            self.lat = "\(locValue.latitude)"
            self.long = "\(locValue.longitude)"
           
            let location = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
            
//            GCD.async(.Main, execute: {
//                self.startActivityWithMessage(msg: "")
//            })
            fetchCountryAndCity(location: location) { country, city in
                print("country:", country)
                print("city:", city)
                self.country = country
                self.city = city
               // self.getSplashInfo()
//                GCD.async(.Main, execute: {
//                    self.stopActivity()
//                })
            }
            
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            print("Authorized")
            break
        case .authorizedWhenInUse:
            print("Authorized for use")
            break
        case .denied:
            
            self.lat = "0.00"
            self.long = "0.00"
           // self.showLocationPermissionPopup()
            //self.getSplashInfo()
            print("denied")
            break
        case .notDetermined:
            break
        case .restricted:
            self.lat = "0.00"
            self.long = "0.00"
           // self.showLocationPermissionPopup()
            //self.getSplashInfo()
            print("restricted")
            break
            
        }
}
}
//MARK:- GET SPLASH INFO API
extension SpalshViewController{
    func getSplashInfo()  {
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.city = "dubai"
        if let request = requestMessage{
            GCD.async(.Default){
                
//                GCD.async(.Main){
//                    self.startActivityWithMessage(msg: "")
//
//                }
                let service = SplashInfoService()
                service.getSplashInfo(requestMessage: request, complete: { (responseMessage) in
                    GCD.async(.Main){
                        self.stopActivity()
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let splash = responseMessage.data as? SplashViewModel {
                               Global.shared.splashInfo = splash
                                self.isDataFetched = true
                                self.showLandingScreen()
                                
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

extension UIImage {
    // MARK: - UIImage+Resize
    func compressTo(_ expectedSizeInMb:Int) -> UIImage? {
        let sizeInBytes = expectedSizeInMb * 1024 * 1024
        var needCompress:Bool = true
        var imgData:Data?
        var compressingValue:CGFloat = 1.0
        while (needCompress && compressingValue > 0.0) {
            if let data:Data = UIImageJPEGRepresentation(self, compressingValue) {
                if data.count < sizeInBytes {
                    needCompress = false
                    imgData = data
                } else {
                    compressingValue -= 0.1
                }
            }
        }
        
        if let data = imgData {
            if (data.count < sizeInBytes) {
                return UIImage(data: data)
            }
        }
        return nil
    }
}
