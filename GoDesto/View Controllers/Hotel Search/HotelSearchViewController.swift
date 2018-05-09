//
//  HotelSearchViewController.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 4/2/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HotelSearchViewController: BaseViewController,TopBarDelegate  {
    
    let locationIcon=UIImageView()
    let locationIcon2=UIImageView()
    let calendarICon=UIImageView()
    let calendarICon2=UIImageView()
    let userICon=UIImageView()
    var selectedTextField = UITextField()
    
    fileprivate var singleDate: Date = Date()
    fileprivate var multipleDates: [Date] = []
    
    @IBOutlet weak var txtWhereToGo: UITextField!
    @IBOutlet weak var txtCheckIn: UITextField!
    @IBOutlet weak var txtCheckOUt: UITextField!
    @IBOutlet weak var txtWho: UITextField!
    @IBOutlet weak var txtWhereLive: IQDropDownTextField!
    @IBOutlet weak var btnGoNow: UIButton!
    
    @IBOutlet weak var mainScrollV: UIScrollView!
    
    
    var checkInDate = Date()
    var checkoutDate:Date?
    
    var countryList:CountryListViewModel?
    var countryCode:String = ""
    
    
    var uuidString:String = ""
    var countyInfo:[String:String] = [String:String]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.mainScrollV.contentSize = CGSize.init(width: self.mainScrollV.frame.size.width, height: self.mainScrollV.frame.size.height)
        self.mainScrollV.isScrollEnabled = true
        
        self.uuidString = UUID().uuidString
        
        self.checkInDate = self.checkInDate.add(days:1)
        self.checkoutDate = self.checkInDate.add(days:1)
        
        txtWhereToGo.delegate = self
        txtCheckIn.delegate = self
        txtCheckOUt.delegate = self
        //        AdjustLayout()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.ReceivedNotificationWithCity(notification:)), name: Notification.Name("NotificationSelectCity"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.ReceivedNotificationWithRoomInfo(notification:)), name: Notification.Name("NotificationSelectRoomInfo"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.ReceivedNotificationForUpdateForm(notification:)), name: Notification.Name("NotificationForUpdateFrom"), object: nil)
        
        
        self.txtCheckIn.text = Utilities.getStringFromDate(date: self.checkInDate)
        self.txtCheckOUt.text = Utilities.getStringFromDate(date: self.checkoutDate!)
        if(self.checkInternetConnection()){
            self.getAllCountries()
        }
        
        self.txtWho.text = Global.shared.HotelSearchRoomList.getAllRoomCountString()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.view.endEditing(true)
        if let container = self.mainContainer{
            
            container.navigationbarHeight.constant = 44
            container.lblTitle.text = "Hotel Search"
            container.lblSubTitle.text = ""
            container.lblTitle.textColor = UIColor.white
            container.lblSubTitle.textColor = UIColor.white
            container.btnMap.isHidden = true
            container.delegate = self
            container.btnMap.isHidden = true
        }
        
        Global.shared.filter = FilterViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AdjustLayout()
    }
    
    
    fileprivate func AdjustLayout() {
    
        locationIcon.image=#imageLiteral(resourceName: "map")
        locationIcon.contentMode = .scaleAspectFit
        
        
        locationIcon2.image=#imageLiteral(resourceName: "map")
        locationIcon2.contentMode = .scaleAspectFit
        
        
        txtWhereToGo.leftViewMode = UITextFieldViewMode.always
        txtWhereToGo.addSubview(locationIcon)
        
        txtWhereLive.leftViewMode = UITextFieldViewMode.always
        txtWhereLive.addSubview(locationIcon2)
        
        var heightAA : Int = 40
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            locationIcon.frame = CGRect(x: 15, y: 10, width: 20, height: 20)
            locationIcon2.frame = CGRect(x: 15, y: 10, width: 20, height: 20)
            calendarICon.frame = CGRect(x: 15, y: 10, width: 20, height: 20)
            calendarICon2.frame = CGRect(x: 15, y: 10, width: 20, height: 20)
            userICon.frame = CGRect(x: 15, y: 10, width: 20, height: 20)
            heightAA = 60
            
            
        }else {
            
            locationIcon.frame = CGRect(x: 8, y: 6, width: 20, height: 20)
            locationIcon2.frame = CGRect(x: 8, y: 6, width: 20, height: 20)
            calendarICon.frame = CGRect(x: 8, y: 6, width: 20, height: 20)
            calendarICon2.frame = CGRect(x: 8, y: 6, width: 20, height: 20)
            userICon.frame = CGRect(x: 8, y: 6, width: 20, height: 20)
            heightAA = 40
            
        }
        
        let paddingViewWhereToGo = UIView(frame: CGRect(x: 0, y: 0, width: 35,height: heightAA))
        txtWhereToGo.leftView = paddingViewWhereToGo
        
        let paddingViewWhereToLive = UIView(frame: CGRect(x: 0, y: 0, width: 35,height: heightAA))
        txtWhereLive.leftView = paddingViewWhereToLive
        
        btnGoNow.layer.cornerRadius = 8
        
        calendarICon.image=#imageLiteral(resourceName: "ic_date_range")
        calendarICon.contentMode = .scaleAspectFit
        
        
        calendarICon2.image=#imageLiteral(resourceName: "ic_date_range")
        calendarICon2.contentMode = .scaleAspectFit
        
        
        txtCheckIn.leftViewMode = UITextFieldViewMode.always
        txtCheckIn.addSubview(calendarICon)
        
        txtCheckOUt.leftViewMode = UITextFieldViewMode.always
        txtCheckOUt.addSubview(calendarICon2)
        
        let paddingViewChecIn = UIView(frame: CGRect(x: 0, y: 0, width: 35,height: heightAA))
        txtCheckIn.leftView = paddingViewChecIn
        
        let paddingViewCheckOut = UIView(frame: CGRect(x: 0, y: 0, width: 35,height: heightAA))
        txtCheckOUt.leftView = paddingViewCheckOut
        
        userICon.image=#imageLiteral(resourceName: "2users")
        userICon.contentMode = .scaleAspectFit
        
        txtWho.leftViewMode = UITextFieldViewMode.always
        txtWho.addSubview(userICon)
        
        let paddingViewWho = UIView(frame: CGRect(x: 0, y: 0, width: 35,height: heightAA))
        txtWho.leftView = paddingViewWho
        
    }
    @objc func ReceivedNotificationWithCity(notification: Notification){
        let userinfo = notification.userInfo
        self.countyInfo = userinfo as! [String : String]
        self.txtWhereToGo.text = self.countyInfo["name"] 
    }
    @objc func ReceivedNotificationForUpdateForm(notification: Notification){
        self.uuidString = UUID().uuidString
        self.checkInDate = Date()
        self.checkInDate = self.checkInDate.add(days:1)
        self.checkoutDate = self.checkInDate.add(days:1)
        
        txtWhereToGo.delegate = self
        txtCheckIn.delegate = self
        txtCheckOUt.delegate = self
        self.txtCheckIn.text = Utilities.getStringFromDate(date: self.checkInDate)
        self.txtCheckOUt.text = Utilities.getStringFromDate(date: self.checkoutDate!)
        
        
        self.txtWho.text = Global.shared.HotelSearchRoomList.getAllRoomCountString()
        self.txtWhereToGo.text = ""
        
        if let country = self.countryList{
            self.txtWhereLive.text = country.searchCountryByName(text: Global.shared.splashInfo!.ipInfo.countryname)
            if(!self.txtWhereLive.text!.isEmpty){
                self.countryCode = Global.shared.splashInfo!.ipInfo.countryCode
            }
        }else{
            self.txtWhereLive.text = ""
        }
        
        Global.shared.HotelSearchRoomList = RoomListViewModel()
        self.txtWho.text = Global.shared.HotelSearchRoomList.getAllRoomCountString()
    }
    @objc func ReceivedNotificationWithRoomInfo(notification: Notification){
        self.txtWho.text = Global.shared.HotelSearchRoomList.getAllRoomCountString()
    }
    
    
    
    func checkFormValidation() -> Bool {
        if(self.txtWhereToGo.text!.isEmpty){
            self.showAlertVIew(message: "Select location from suggested place only!", title: "")
            return false
        }else if(!Utilities.isDateGreater(serverDate: self.checkoutDate!, appDate: self.checkInDate)){
            self.showAlertVIew(message: "Invalid  checkin/checkout dates.", title: "")
            return false
        }else if(self.txtWhereLive.text!.isEmpty){
            self.showAlertVIew(message: "Please select country", title: "")
            return false
        }else{
            return true
        }
    }
    @IBAction func didTapGoNow(_ sender: Any) {
        if(self.checkFormValidation()){
            self.getTopHotelList()
        }
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    override func hideKeyboard() {
        self.view.endEditing(true)
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        })
    }
    func actionCallBackMoveBack() {
        if let container = self.mainContainer{
            container.navigationbarHeight.constant = 0
        }
        self.navigationController?.popViewController(animated: true)
    }
}


extension HotelSearchViewController:UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if (textField == txtWhereToGo) {
            
            self.performSegue(withIdentifier: "CityFilter_VC_SB", sender: nil)
            if let container = self.mainContainer{
                container.navigationbarHeight.constant = 0
            }
            return false
        }
        
        if (textField == txtCheckIn) {
            self.selectedTextField = txtCheckIn
            if let container = self.mainContainer{
                container.showDateTimeCalender(isDateShow: true)
                container.delegate = self
                
            }
            return false
        }
        
        if (textField == txtCheckOUt) {
            self.selectedTextField = txtCheckOUt
            if let container = self.mainContainer{
                container.showDateTimeCalender(isDateShow: true)
                container.delegate = self
                
            }
            return false
        }
        
        if (textField == txtWho) {
            self.performSegue(withIdentifier: ControllerIdentifier.HotelRoomViewController, sender: nil)
            if let container = self.mainContainer {
                container.bottomViewHeight.constant = 0
            }
            return false
        } else if (textField == self.txtWhereLive) {
            self.createCountryListPopup()
            self.alertView?.show()
            return false
        } else {
            return true
        }
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == self.txtWhereLive){
            UIView.animate(withDuration: 0.3, animations: {
                self.view.frame = CGRect(x: 0, y: -150, width: self.view.frame.size.width, height: self.view.frame.size.height)
            })
        }
    }
    func actionSeletedDate(date: String,SelectedDate:Date) {
        if(self.selectedTextField == self.txtCheckIn){
            self.selectedTextField.text = date
            self.checkInDate = SelectedDate
            if(!Utilities.isDateGreater(serverDate: self.checkoutDate!, appDate: self.checkInDate)){
                self.txtCheckOUt.text = Utilities.getStringFromDate(date: SelectedDate.add(days: 1))
                self.checkoutDate = SelectedDate.add(days: 1)
            }
        }else{
            self.checkoutDate = SelectedDate
            self.txtCheckOUt.text = date
        }
    }
}
//MARK:- Country List  API
extension HotelSearchViewController{
    func getAllCountries(query:String? = "")  {
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.query = query!
        
        if let request = requestMessage{
            GCD.async(.Default){
                GCD.async(.Main, execute: {
                    if let container = self.mainContainer{
                        container.startActivity()
                    }
                })
                let service = SearchService()
                service.getAllCountry(requestMessage: request, complete: { (responseMessage) in
                    
                    GCD.async(.Main){
                        if let container = self.mainContainer{
                            container.stopActivity()
                        }
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let list = responseMessage.data as? CountryListViewModel {
                                self.countryList = list
                                Global.shared.countryListModel = list
                                self.txtWhereLive.text = list.searchCountryByName(text: Global.shared.splashInfo!.ipInfo.countryname)
                                if(!self.txtWhereLive.text!.isEmpty){
                                    self.countryCode = Global.shared.splashInfo!.ipInfo.countryCode
                                }
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
//MARK:-
//MARK:-Create Country List Popup
//MARK:-
extension HotelSearchViewController:CountryListPopupDelegate{
    func createCountryListPopup()
    {
        self.alertView = CustomIOSAlertView()
        self.alertView?.buttonTitles = nil
        self.alertView?.useMotionEffects = true
        var demoView:UIView!
        demoView = UIView()
        
        let storyBoard: UIStoryboard = UIStoryboard(name: StoryboardName.Popup, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: PopupIdentifier.CountryListPopupViewController)as? CountryListPopupViewController
        {
            vc.delegate = self
            self.objAlertVC = vc
            vc.countryList = self.countryList!.countryList
            demoView.frame = CGRect(x:0, y:0, width:ScreenSize.SCREEN_WIDTH - 50 , height:ScreenSize.SCREEN_HEIGHT - 250)
            vc.view.frame = CGRect(x:0, y:0, width:ScreenSize.SCREEN_WIDTH - 50 , height:ScreenSize.SCREEN_HEIGHT - 250)
            demoView.addSubview(vc.view)
            
            self.alertView?.containerView = demoView
        }
        
    }
    
    func actionCallBackSelectCountry(text:String,code:String){
        self.txtWhereLive.text = text
        self.countryCode = code
        self.alertView?.close()
    }
    func actionCallBackCancelPopup(){
        self.alertView?.close()
    }
    
}
//MARK:- Top Hotel API
extension HotelSearchViewController{
    func getTopHotelList()  {
        
        let requestMessage:RequestMessage? = self.createRequestMessage()
        
        if let request = requestMessage {
            GCD.async(.Default){
                GCD.async(.Main, execute: {
                    if let container = self.mainContainer{
                        container.startActivity()
                    }
                })
                let service = HotelService()
                service.getTopHotel(requestMessage: request, complete: { (responseMessage) in
                    
                    GCD.async(.Main){
                        if let container = self.mainContainer{
                            container.stopActivity()
                        }
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main) {
                            if let topHotel = responseMessage.data as? TopHotelViewModel {
                                
                                let storyboard = UIStoryboard.init(name: StoryboardName.Home, bundle: nil)
                                if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.HotelListingViewController) as? HotelListingViewController {
                                    vc.topHotel = topHotel
                                    vc.checkIn = self.checkInDate
                                    vc.checkOut = self.checkoutDate
                                    vc.countryInfo = self.countyInfo
                                    vc.requestMessageForRegion = request
                                    vc.uuidString = self.uuidString
                                    self.navigationController?.pushViewController(vc, animated: true)
                                }
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
    
    func createRequestMessage() -> RequestMessage {
        let request = RequestMessage()
        request.queryItemList.append(URLQueryItem(name:"region",value:self.countyInfo["cityName"]))
        request.queryItemList.append(URLQueryItem(name:"destination",value:self.countyInfo["code"]))
        request.queryItemList.append(URLQueryItem(name:"checkindate",value:Utilities.getStringWithFormateFromDate(date: self.checkInDate)))
        request.queryItemList.append(URLQueryItem(name:"checkoutdate",value:Utilities.getStringWithFormateFromDate(date: self.checkoutDate!)))
        request.queryItemList.append(URLQueryItem(name:"nationality",value:self.txtWhereLive.text))
        request.queryItemList.append(URLQueryItem(name:"nationality_code",value:self.countryCode))
        let getRoomInfoList = Global.shared.HotelSearchRoomList.getRoomInfoList()
        for item in getRoomInfoList{
            request.queryItemList.append(item)
        }
        request.queryItemList.append(URLQueryItem(name:"country_code",value:self.countyInfo["countryCode"]))
        request.queryItemList.append(URLQueryItem(name:"session_id",value:self.uuidString))
        
        print(request.queryItemList)
        
        // Hack
        var searchDetails = HotelSearchDetail()
        searchDetails.city = self.countyInfo["cityName"]!
        searchDetails.cityCode = self.countyInfo["code"]!
        searchDetails.checkInDate = checkInDate
        searchDetails.checkOutDate = checkoutDate ?? Date()
        searchDetails.countryCode = self.countryCode
        searchDetails.nationality = self.txtWhereLive.text!
        searchDetails.nationalityCode = self.countryCode
        searchDetails.sessionId = self.uuidString
        
        for i in 0..<Global.shared.HotelSearchRoomList.getNumberOfRooms() {
            var roomInfo = RoomDetail()
            
            for _ in 0..<Global.shared.HotelSearchRoomList.getNumberOfAdultsIn(room: i) {
                roomInfo.adults.append(AdultInformation())
            }
            
            for childIndex in 0..<Global.shared.HotelSearchRoomList.getNumberOfChildrenIn(room: i) {
                var childInfo = ChildInformation()
                childInfo.age = Global.shared.HotelSearchRoomList.getAgeOfChildIn(room: i, child: childIndex)
                roomInfo.children.append(childInfo)
            }
            searchDetails.roomDetails.append(roomInfo)
        }
        
        Global.shared.hotelSearchDetail = searchDetails
        
        return request
        
    }
}
