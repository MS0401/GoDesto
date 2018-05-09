//
//  CheckoutViewController.swift
//  GoDesto
//
//  Created by Le Abid on 18/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

private struct Colors {
    static let violet = UIColor(red: 41.0/255.0, green: 107.0/255.0, blue: 162.0/255.0, alpha: 1.0)
    static let orange = UIColor(red: 255.0/255.0, green: 71.0/255.0, blue: 18.0/255.0, alpha: 1.0)
}

class CheckoutViewController: BaseViewController {

    // View Models
    var preCheckoutViewModel: PreCheckoutViewModel?
    var roomViewModel: HotelRoomViewModel!
    var countryList: CountryListViewModel? {
        return Global.shared.countryListModel
    }
    lazy var hotelViewModel =  {
        return Global.shared.hotelDetail
    }()
    lazy var hotelSearchDetail = {
        return Global.shared.hotelSearchDetail
    }()
    
    // Cells
    lazy var hotelInfoCell = {
        return HotelInfoCell.instance()
    }()
    lazy var priceCell = {
        return CheckoutPriceCell.instance()
    }()
    lazy var promoCodeCell = {
        return PromeTableViewCell.instance()
    }()
    
    var cancelationInfoCell = {
        return TermsCell.instance()
    }()
    
    var termsCell = {
        return TermsCell.instance()
    }()
    var myInformationCell = {
        return MyInformationCell.instance()
    }()
    
    lazy var checkoutCell = {
        return CheckoutActionCell.instance()
    }()
    
    // IBoutlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
        
        getPreBookingDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let container = self.mainContainer {
            container.showBackIcon()
            container.lblTitle.text = Global.shared.hotelDetail!.hotelInfo.name
            container.lblSubTitle.isHidden = false
            
            let startDate = Utilities.getStringFromDate(date: self.hotelSearchDetail!.checkInDate, dateFormat: "dd MMM")
            let endDate = Utilities.getStringFromDate(date: self.hotelSearchDetail!.checkOutDate, dateFormat: "dd MMM")
            container.lblSubTitle.text = "\(startDate)-\(endDate), \(self.hotelSearchDetail!.totalGuests) guests"
            container.btnMap.isHidden = true
        }
    }

}

extension CheckoutViewController {
    func setupTableView() {
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.separatorStyle = .none
    }
}

extension CheckoutViewController {
    
    func getPreBookingDetails()  {
        
        let requestMessage: RequestMessage? = getPreBookingRequest()
        
        if let request = requestMessage {
            GCD.async(.Default){
                GCD.async(.Main, execute: {
                    if let container = self.mainContainer {
                        container.startActivity()
                    }
                })
                let service = HotelService()
                service.getPreCheckOutInformation(requestMessage: request, complete: { (responseMessage) in
                    GCD.async(.Main){
                        if let container = self.mainContainer{
                            container.stopActivity()
                        }
                    }
                    switch responseMessage.serviceResponseType {
                    case .Success:
                        GCD.async(.Main){
                            if let detail = responseMessage.data as? PreCheckoutViewModel {
                                self.preCheckoutViewModel = detail
                                self.preCheckoutViewModel?.searchDetails = Global.shared.hotelSearchDetail
                                self.tableView.reloadData()
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
    
    func getPreBookingRequest() -> RequestMessage {
        
        let request = RequestMessage()
        
        request.queryItemList.append(URLQueryItem(name:"region",value:hotelSearchDetail!.city))
        request.queryItemList.append(URLQueryItem(name:"checkindate",value:Utilities.getStringWithFormateFromDate(date: hotelSearchDetail!.checkInDate)))
        request.queryItemList.append(URLQueryItem(name:"checkoutdate",value:Utilities.getStringWithFormateFromDate(date: hotelSearchDetail!.checkOutDate)))
        request.queryItemList.append(URLQueryItem(name:"nationality",value:hotelSearchDetail!.nationality))
        request.queryItemList.append(URLQueryItem(name:"nationality_code",value:hotelSearchDetail!.nationalityCode))
        request.queryItemList.append(URLQueryItem(name:"country_code",value: hotelSearchDetail!.countryCode))
        
        request.queryItemList.append(URLQueryItem(name:"num_rooms",value: "\(hotelSearchDetail!.roomDetails.count)"))
        
        for i in 0..<hotelSearchDetail!.roomDetails.count {
            request.queryItemList.append(URLQueryItem(name:"room_adults_\(i+1)",value: "\(hotelSearchDetail!.roomDetails[i].adults.count)"))
            request.queryItemList.append(URLQueryItem(name:"room_childs_\(i+1)",value: "\(hotelSearchDetail!.roomDetails[i].children.count)"))
        }
        
        request.queryItemList.append(URLQueryItem(name:"BookingKey",value: roomViewModel.quoteId))
        
        print(request.queryItemList)
        
        return request
        
    }
}

extension CheckoutViewController: CountryListPopupDelegate {
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
//        self.txtWhereLive.text = text
//        self.countryCode = code
        self.alertView?.close()
    }
    func actionCallBackCancelPopup(){
        self.alertView?.close()
    }
    
}

extension CheckoutViewController {
    
    func bookingDetailCellInTableView(_ aTableView: UITableView) -> BookingInfoCell {
        var cell = aTableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.BookingInfoCell) as? BookingInfoCell
        if cell == nil {
            cell = BookingInfoCell.instance()
        }
        return cell!
    }
    
    func adultDetailCellInTableView(_ aTableView: UITableView) -> AdultGuestInformationCell {
        var cell = aTableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.AdultGuestInformationCell) as? AdultGuestInformationCell
        if cell == nil {
            cell = AdultGuestInformationCell.instance()
        }
        return cell!
    }
    
    func childDetailCellInTableView(_ aTableView: UITableView) -> ChildGuestInformationCell {
        var cell = aTableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.ChildGuestInformationCell) as? ChildGuestInformationCell
        if cell == nil {
            cell = ChildGuestInformationCell.instance()
        }
        return cell!
    }
    
}

extension CheckoutViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if preCheckoutViewModel != nil {
            return 9 + preCheckoutViewModel!.searchDetails!.totalRooms
        } else {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section  == 0 || section  == 3 || section  == 4 || section  == 5 || section  == 6 || section == 7 {
            return 1
        } else if section == 1 {
            return (preCheckoutViewModel?.stayDetails.count)!
        } else if section == 2 {
            return (preCheckoutViewModel?.bookingDetails.count)!
        } else if isRoom(sectionIndex: section) {
            let roomIndex = roomIndexFor(sectionIndex: section)
            return preCheckoutViewModel!.searchDetails!.roomDetails[roomIndex].totalPersons
        }
        else  {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            hotelInfoCell.configureView(detail: self.hotelViewModel!)
            return hotelInfoCell
        } else if indexPath.section == 1 {
            let cell = bookingDetailCellInTableView(tableView)
            cell.setup(title: preCheckoutViewModel!.stayDetails[indexPath.row].title,
                       subtitle: preCheckoutViewModel!.stayDetails[indexPath.row].subtitle)
            return cell
            
        } else if indexPath.section == 2 {
            let cell = bookingDetailCellInTableView(tableView)
            cell.setup(title: preCheckoutViewModel!.bookingDetails[indexPath.row].title,
                       subtitle: preCheckoutViewModel!.bookingDetails[indexPath.row].subtitle)
            return cell
        } else if indexPath.section == 3 {
            priceCell.setup(priceModel: self.preCheckoutViewModel!)
            return priceCell
        } else if indexPath.section == 4 {
            return promoCodeCell
        } else if indexPath.section == 5 {
            cancelationInfoCell.setup(htmlText: preCheckoutViewModel!.cancelationInfoText)
            return cancelationInfoCell
        } else if indexPath.section == 6 {
            termsCell.setup(htmlText: preCheckoutViewModel!.terms, showAgreementControl: true)
            termsCell.setup(termAgreement: preCheckoutViewModel!.areTermsAgreed)
            termsCell.onTap = {
                self.preCheckoutViewModel!.areTermsAgreed = !(self.preCheckoutViewModel!.areTermsAgreed)
            }
            return termsCell
        } else if indexPath.section == 7 {
            myInformationCell.setup(userInfo: preCheckoutViewModel!.currentUserInformation)
            termsCell.onTap = {
                self.preCheckoutViewModel!.currentUserInformation.isOwnBooking = !(self.preCheckoutViewModel!.currentUserInformation.isOwnBooking)
            }
            return myInformationCell
        } else if isRoom(sectionIndex: indexPath.section) {
            let roomIndex = roomIndexFor(sectionIndex: indexPath.section)
            let room = preCheckoutViewModel!.searchDetails?.roomDetails[roomIndex]
            let guest = room?.guestDetails[indexPath.row]
            
            if let adultInfo = guest as? AdultInformation {
                let cell = adultDetailCellInTableView(tableView)
                cell.setup(userInfo: adultInfo, number: indexPath.row)
                return cell
            } else {
                let childInfo = guest as! ChildInformation
                let cell = childDetailCellInTableView(tableView)
                cell.setup(userInfo: childInfo,  number: indexPath.row)
                return cell
            }
            
        } else {
            return checkoutCell
        }
    }
}

extension CheckoutViewController {
    
    func isRoom(sectionIndex: Int) -> Bool {
        
        guard preCheckoutViewModel != nil else {
            return false
        }
        
        let lastRoomIndex = 7 + preCheckoutViewModel!.searchDetails!.totalRooms
        if sectionIndex > 7 && sectionIndex <= lastRoomIndex {
            return true
        }
        return false
    }
    
    func roomIndexFor(sectionIndex: Int) -> Int {
        return sectionIndex - 8
    }
}

extension CheckoutViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 || section == 7 || isRoom(sectionIndex: section) {
            return 30
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 || section >= tableView.numberOfSections-2 { // No footer in 1st and last 2 sections
            return 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = SectionHeaderView()
        if isRoom(sectionIndex: section) {
            let roomIndex = roomIndexFor(sectionIndex: section)
            header.set(textColor: Colors.orange, background: .lightGray)
            header.set(text: "Guest Information (Room# \(roomIndex+1))")
        } else if section == 1 {
            header.set(textColor: .white, background: Colors.violet)
            header.set(text: "Your booking details:")
        } else if section == 7 {
            header.set(textColor: Colors.orange, background: .lightGray)
            header.set(text: "Your Information")
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return SectionFooterView()
    }
}
