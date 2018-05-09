//
//  HotelSearchDetailViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 03/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HotelSearchDetailViewController: BaseViewController,TopBarDelegate {

    @IBOutlet weak var tblProductList:UITableView?
    
    var isOverview:Bool? = true
    var mapCell:GolfDetailMapLocationTableViewCell?
    var sliderCell:HotelSearchDetailSliderTableViewCell?
    var filterCell:HotelSearchDetailFilterTableViewCell?
    
    var hotelDetail:HotelDetailViewModel?
    var requestMessageForRegion:RequestMessage = RequestMessage()
    var roomList:HotelRoomListViewModel?
    var selectedHotel:HotelViewModel?
    var cancelationList:CancelationListViewModel?
    var isFilter:Bool? = false
    var filterRoomList:[HotelRoomViewModel] = [HotelRoomViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tblProductList!.register(UINib(nibName: NIBName.HotelSearchDetailSliderTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.HotelSearchDetailSliderTableViewCell)
        self.tblProductList!.register(UINib(nibName: NIBName.GolfTickersTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.GolfTickerTableViewCell)
        
        //        self.tblProductList?.estimatedRowHeight = 43
        //        self.tblProductList?.rowHeight = UITableViewAutomaticDimension
        
        self.tblProductList?.estimatedRowHeight = 43
        self.tblProductList?.estimatedSectionHeaderHeight = 5
        self.tblProductList?.sectionHeaderHeight = UITableViewAutomaticDimension
        self.tblProductList?.rowHeight = UITableViewAutomaticDimension
        
        if(self.checkInternetConnection()){
            self.getRoomList()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        if let container = self.mainContainer{
            container.showBackIcon()
            //  container.lblMenuTitle.isHidden = false
            container.lblTitle.text = NavigationTitles.GolfDetail
            container.lblSubTitle.isHidden = true
            //  container.lblMenuTitle.text = NavigationTitles.GolfDetail
            container.lblTitle.text = "Hotels Detail"
            container.lblSubTitle.text = ""
            container.delegate = self
            container.btnMap.isHidden = true
            
        }
    }
    
    
    func actionCallBackMoveBack() {
        self.navigationController?.popViewController(animated: true)
    }
    func actionCallBackShowMenu() {
        if let container = self.mainContainer {
            container.bottomViewHeight.constant = 0
        }
        let storyboard = UIStoryboard.init(name: StoryboardName.Home, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.PreviewMenuViewController) as? PreviewMenuViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func actionCallBookNow() {
        if let container = self.mainContainer{
            container.bottomViewHeight.constant = 0
        }
        let storyboard = UIStoryboard.init(name: StoryboardName.Home, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.HotelRoomListViewController) as? HotelRoomListViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func actionback(_ sender:UIButton){
        if let container = self.mainContainer{
            container.navigationbarHeight.constant = 44
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
extension HotelSearchDetailViewController:UITableViewDelegate,UITableViewDataSource,GolfDetailMenuDelegate,GolfDetailOverviewDelegate,GolfDetailAddReviewDelegate,HotelSearchDetailFilterDelegate,GolfDetailDescriptionDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        if(self.isOverview!){
            return Global.shared.detail.hotelDetailSectionList.count
        }else{
            return 4
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.isOverview!){
            let headerSection = Global.shared.detail.hotelDetailSectionList[section]
            if(headerSection.isSelected){
                if(section == 5){
                    return self.hotelDetail!.hotelInfo.facilitiesList.count
                }
            }
            
            return 0
        }else{
            if(section == 2){
                return 1
            }else if(section == 3) {
                if let _ = self.roomList{
                    if(self.isFilter!){
                       return self.filterRoomList.count
                    }
                    return self.roomList!.roomList.count
                }else{
                    return 0
                }
            }else{
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if(self.isOverview!){
            if(section == 0){
                if let  cell = self.sliderCell{
                    return cell
                }else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HotelSearchDetailSliderTableViewCell) as! HotelSearchDetailSliderTableViewCell
                    cell.configureView(detail: self.hotelDetail!)
                    self.sliderCell = cell
                    return cell
                }
                
            }else if(section == 1){
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailOverviewTableViewCell") as! GolfDetailOverviewTableViewCell
                cell.configureView(isOverview: self.isOverview!)
                cell.delegate = self
                return cell
            }else if(section == 2){
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfTickerTableViewCell") as! GolfTickerTableViewCell
                cell.isFromHotelDetail = true
                return cell
            }else if(section == 3){
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailDescriptionTableViewCell") as! GolfDetailDescriptionTableViewCell
                cell.configureView(text: self.hotelDetail!.hotelInfo.detail)
                cell.delegate = self
                return cell
            }else if(section == 4){
                if let cell = self.mapCell{
                    return cell
                }else{
                    if let cell = self.mapCell{
                        return cell
                    }else{
                        let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailMapLocationTableViewCell") as! GolfDetailMapLocationTableViewCell
                        cell.configureView(address: Global.shared.hotelDetail!.hotelInfo.hotelAddress)
                        self.mapCell = cell
                        
                        return cell
                    }
                }
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailMenuTableViewCell") as! GolfDetailMenuTableViewCell
                cell.configure(section: Global.shared.detail.hotelDetailSectionList[section], index: section)
                cell.delegate = self
                return cell
            }
        }else{
            if(section == 0){
                if let  cell = self.sliderCell{
                    return cell
                }else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HotelSearchDetailSliderTableViewCell) as! HotelSearchDetailSliderTableViewCell
                    self.sliderCell = cell
                    return cell
                }
            }else if(section == 1){
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailOverviewTableViewCell") as! GolfDetailOverviewTableViewCell
                cell.configureView(isOverview: self.isOverview!)
                cell.delegate = self
                return cell
            }else if(section == 6){
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HotelSearchDetailFilterTableViewCell) as! HotelSearchDetailFilterTableViewCell
                return cell
            }else{
                let view = UIView(frame: CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH, height: 0))
                return view
            }
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(self.isOverview!){
            if(indexPath.section == 5){
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HotelSearchDetailFacilitiesTableViewCell) as! HotelSearchDetailFacilitiesTableViewCell
                cell.configure(title: self.hotelDetail!.hotelInfo.facilitiesList[indexPath.row])
                return cell
            }
            return UITableViewCell()
        }else{
            if(indexPath.section == 2){
                if let cell = self.filterCell{
                    return cell
                }
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HotelSearchDetailFilterTableViewCell) as! HotelSearchDetailFilterTableViewCell
                cell.configureView(options: Global.shared.detail.detailFilterOption)
                cell.delegate = self
                self.filterCell = cell

                return cell

            }else if(indexPath.section == 3){
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HotelSearchDetailHotelTableViewCell) as! HotelSearchDetailHotelTableViewCell
                
                if(self.isFilter!){
                    cell.configureView(room: self.filterRoomList[indexPath.row], image: self.selectedHotel!.mainImage)
                }else{
                    cell.configureView(room: self.roomList!.roomList[indexPath.row], image: self.selectedHotel!.mainImage)
                }
                                return cell
            }else{
                return UITableViewCell()
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // DuckDuckGo
        tableView.deselectRow(at: indexPath, animated: true)
        
        if false == self.isOverview! && indexPath.section == 3 {
            var roomViewModel: HotelRoomViewModel!
            if(self.isFilter!){
                roomViewModel = self.filterRoomList[indexPath.row]
            } else{
                roomViewModel = self.roomList!.roomList[indexPath.row]
            }
            
            let storyboard = UIStoryboard.init(name: StoryboardName.Checkout, bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.CheckoutViewController) as? CheckoutViewController {
                vc.roomViewModel = roomViewModel
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if(self.isOverview!){
            if(section == 0){

                if UIDevice.current.userInterfaceIdiom == .pad {
                    return 450
                }else {
                    return 332
                }
                
            }else if(section == 1){
                
                if UIDevice.current.userInterfaceIdiom == .pad {
                    return 40
                }else {
                    return 27
                }
                
            }else if(section == 2){
                if UIDevice.current.userInterfaceIdiom == .pad {
                    return 35
                }else {
                    return 23
                }
            }else if(section == 3){
                
                if UIDevice.current.userInterfaceIdiom == .pad {
                    return 250
                }else {
                    return 147
                }
            }else if(section == 4){
                if UIDevice.current.userInterfaceIdiom == .pad {
                    return 160
                }else {
                    return 88
                }
            }else{
                if UIDevice.current.userInterfaceIdiom == .pad {
                    return 90
                }else {
                    return 43
                }
            }
        }else{
            if(section == 0){
                if UIDevice.current.userInterfaceIdiom == .pad {
                    return 450
                }else {
                    return 332
                }
            }else if(section == 1){
                
                if UIDevice.current.userInterfaceIdiom == .pad {
                    return 40
                }else {
                    return 27
                }
            }else if(section == 6){
                if UIDevice.current.userInterfaceIdiom == .pad {
                    return 90
                }else {
                    return 54
                }
            }else{
                return 0
            }
        }

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if(self.isOverview!){
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                if(indexPath.section == 5){
                    
                    return 60
                }
            }else {
                
                if(indexPath.section == 5){
                    
                    return 35
                }
            }
        }else {
            
            if UIDevice.current.userInterfaceIdiom == .pad {

                if(indexPath.section == 2){
                    
                    return 70
                    
                }else if(indexPath.section == 3){
                    
                    return 250
                }
                
            }else {
                
                if(indexPath.section == 2){
                    
                    return 54
                    
                }else if(indexPath.section == 3){
                    
                    return 193
                }
            }
        }
        return 0
    }

    func actionCallBackSetFilter(cell:HotelSearchDetailFilterTableViewCell,filter:DetailFilter){
        if(filter == DetailFilter.All){
            self.filterRoomList = self.roomList!.roomList
            self.tblProductList?.reloadData()
        }else if(filter == DetailFilter.NonRefundable){
            self.createFilterOptionPopup(isFromNonRefund: true)
            self.alertView?.show()
        }else{
            self.createFilterOptionPopup(isFromNonRefund: false)
            self.alertView?.show()
        }
    }
    func actionCallBackAddReview() {
        self.createAddReviewPopup()
        self.alertView?.show()
    }
    func actionCallBackSetList(isOverviewSelected: Bool) {
        GCD.async(.Main) {
            self.isOverview = isOverviewSelected
            self.tblProductList?.scrollsToTop = true
            
            self.tblProductList?.reloadData()
        }
        
    }
    func actionCallBackShowSelectedItem(section: Int, isSelected: Bool) {
        let headerSection = Global.shared.detail.hotelDetailSectionList[section]
        headerSection.isSelected = isSelected
        if(headerSection.isSelected){
            let offset = self.tblProductList!.contentOffset
            self.tblProductList?.reloadData()
            self.tblProductList!.layoutIfNeeded()
            self.tblProductList?.setContentOffset(offset, animated: true)
        }else{
            self.tblProductList?.reloadData()
            self.tblProductList!.layoutIfNeeded()
            
            
            let offset = self.tblProductList!.contentSize.height - self.tblProductList!.contentOffset.y
            
            self.tblProductList!.contentOffset = CGPoint(x: 0, y: self.tblProductList!.contentSize.height - offset)
            
           
        }
//        UIView.transition(with: self.tblProductList!,
//                          duration: 0.35,
//                          options: .transitionCrossDissolve,
//                          animations: { self.tblProductList!.reloadData() })
    }
    func actionCallBackShowMoreText() {
        self.tblProductList?.reloadData()
    }
    
    
}
//MARK:- GET ROOM LIST & CANCELATION API
extension HotelSearchDetailViewController{
    func getRoomList()  {
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.queryItemList = self.createHotelDetailRequest()
        
        if let request = requestMessage{
            GCD.async(.Default){
                GCD.async(.Main, execute: {
                    if let container = self.mainContainer{
                        container.startActivity()
                    }
                })
                let service = HotelService()
                service.getHotelRooms(requestMessage: request, complete: { (responseMessage) in
                    
                    GCD.async(.Main){
                        if let container = self.mainContainer{
                            container.stopActivity()
                        }
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let roomList = responseMessage.data as? HotelRoomListViewModel {
                                print(roomList.roomList)
                                print(roomList.textvalue)
                                self.roomList = roomList
                                self.cancelationRequest()
                                //self.tblProductList?.reloadData()
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
    func createHotelDetailRequest() -> [URLQueryItem] {
        var items = [URLQueryItem]()
        
        items.append(URLQueryItem(name: "hotel_id", value: self.selectedHotel!.hotelCode))
        
        for item in self.requestMessageForRegion.queryItemList {
            items.append(item)
        }
        
        return items
        
    }
    func cancelationRequest()  {
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.queryItemList = self.createCancelationRequest()
        
        if let request = requestMessage{
            GCD.async(.Default){
                GCD.async(.Main, execute: {
                    if let container = self.mainContainer{
                        container.startActivity()
                    }
                })
                let service = HotelService()
                service.getCancelationApi(requestMessage: request, complete: { (responseMessage) in
                    
                    GCD.async(.Main){
                        if let container = self.mainContainer{
                            container.stopActivity()
                        }
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let list = responseMessage.data as? CancelationListViewModel {
                               self.cancelationList = list
                                self.roomList!.setRoomStatus(list: list.cancelationList)
                                self.tblProductList?.reloadData()
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
    func createCancelationRequest() -> [URLQueryItem] {
        var items = [URLQueryItem]()
        
        items.append(URLQueryItem(name: "hotel_id", value: self.selectedHotel!.hotelCode))
        items.append(URLQueryItem(name: "quotes", value: self.roomList!.getQuotesId()))
        items.append(URLQueryItem(name: "codes", value: self.roomList!.getCodeId()))
        
        for item in self.requestMessageForRegion.queryItemList {
            items.append(item)
        }
        
        return items
        
    }
}
//MARK:-
//MARK:-Create Filiter POPUP
//MARK:-
extension HotelSearchDetailViewController:FilterOptionPopupDelegate{
    func createFilterOptionPopup(isFromNonRefund:Bool? = false)
    {
        self.alertView = CustomIOSAlertView()
        self.alertView?.buttonTitles = nil
        self.alertView?.useMotionEffects = true
        var demoView:UIView!
        demoView = UIView()
        
        let storyBoard: UIStoryboard = UIStoryboard(name: StoryboardName.Popup, bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: PopupIdentifier.FilterOptionPopupViewController)as? FilterOptionPopupViewController
        {
            vc.delegate = self
            self.objAlertVC = vc
            vc.isFromRefund = isFromNonRefund!
            if(isFromNonRefund!){
                demoView.frame = CGRect(x:0, y:0, width:300 , height:70)
                vc.view.frame = CGRect(x:0, y:0, width:300 , height:70)
                demoView.addSubview(vc.view)
            }else{
                demoView.frame = CGRect(x:0, y:0, width: 300 , height:150)
                vc.view.frame = CGRect(x:0, y:0, width:300, height:150)
                demoView.addSubview(vc.view)
            }
          
            
            self.alertView?.containerView = demoView
        }
        
    }
    func actionCallBackSelectOptionItem(text:DetailFilter){
        self.alertView?.close()
        self.isFilter = true
        if(text == DetailFilter.RoomOnly){
            self.filterRoomList = self.roomList!.getRoomOnlyList()
            self.filterCell?.btnBreakfast?.setTitle(DetailFilter.RoomOnly.rawValue, for: .normal)
        }else if(text == DetailFilter.Breakfast){
            self.filterRoomList = self.roomList!.getBreakfastList()
            self.filterCell?.btnBreakfast?.setTitle(DetailFilter.Breakfast.rawValue, for: .normal)
        }else{
            self.filterRoomList = self.roomList!.getRefundableList()
        }
        self.tblProductList?.reloadData()
        
    }
}

