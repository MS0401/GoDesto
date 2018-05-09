//
//  HotelListingViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 19/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit


class HotelListingViewController: BaseViewController,TopBarDelegate,TagListViewDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var tblProductList:UITableView?
    @IBOutlet weak var txtSearch:UITextField?
    @IBOutlet weak var tagListView: TagListView!
    @IBOutlet weak var viewFilterLayer: UIView!
    @IBOutlet weak var collectionView:UICollectionView?
    @IBOutlet weak var collectionViewHeight:NSLayoutConstraint?

    var isThingsToDo:Bool? = false
    var topHotel:TopHotelViewModel?
    var countryInfo:[String:String]?
    
    var checkIn:Date?
    var checkOut:Date?

    var pageNumber = 0
    var requestMessageForRegion:RequestMessage = RequestMessage()
    var uuidString:String = ""
    var isFilter:Bool = false
    var isApiCalling = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewFilterLayer.isHidden = false
        if(self.checkInternetConnection()){
            self.searchRegionForHotel()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.recievedNotificationFromFilter(notification:)), name: Notification.Name("NotificationFromFilters"), object: nil)
        
        if(Global.shared.filter.tagList.count == 0){
            self.collectionViewHeight?.constant = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let container = self.mainContainer {
            container.lblTitle.text = "Hotels"
        
            if let country = self.countryInfo {
                container.lblTitle.text = country["name"]
            }
            
            container.lblSubTitle.text = Utilities.getStringFromDate(date: self.checkIn!, dateFormat: "dd MMM") + " - " +
                Utilities.getStringFromDate(date: self.checkOut!, dateFormat: "dd MMM") + ", "
                + String(Global.shared.HotelSearchRoomList.getGuestCount()) + " guests"
            
            container.lblSubTitle.font = UIFont.systemFont(ofSize: 10)
            container.lblTitle.textColor = UIColor.white
            container.lblSubTitle.textColor = UIColor.white
            container.delegate = self
            container.btnMap.isHidden = false
        }
    }
    @objc func recievedNotificationFromFilter(notification: Notification){
        
        Global.shared.filter.settagList()
        if(Global.shared.filter.tagList.count > 0){
            self.collectionViewHeight?.constant = 50
            //self.collectionView?.reloadData()
        }else{
            self.collectionViewHeight?.constant = 0
        }
        self.filterResult()
        self.loadMoreHotelList()
        
        
    }
    func actionCallbackShowMap(){
        let storyboard = UIStoryboard.init(name: StoryboardName.Home, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.GoogleMapViewController) as? GoogleMapViewController{
            if let _ = self.topHotel{
                vc.hotelList = self.topHotel!.hotelList
            }
            if let container = self.mainContainer{
                container.bottomViewHeight.constant = 0
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func actionCallBackMoveBack() {
        if let container = self.mainContainer{
            container.navigationbarHeight.constant = 0
        }
        NotificationCenter.default.post(name: Notification.Name("NotificationForUpdateFrom"), object: nil, userInfo: nil)
        self.navigationController?.popViewController(animated: true)
    }
    func filterResult()  {
        self.isFilter = true
        self.pageNumber = 0
        self.topHotel = TopHotelViewModel()
        self.collectionView?.reloadData()
        self.tblProductList?.reloadData()
        self.loadMoreHotelList()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.filterResult()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func actionShowFilter(_ sender:UIButton){
        let storyboard = UIStoryboard.init(name: StoryboardName.Filter, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.HotelFilterViewController) as? HotelFilterViewController{
            vc.isThingsToDo = self.isThingsToDo!
            self.navigationController?.present(vc, animated: true, completion: nil)
        }
    }
    
    // MARK: TagListViewDelegate
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag pressed: \(title), \(sender)")
        tagView.isSelected = !tagView.isSelected
    }
    
    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag Remove pressed: \(title), \(sender)")
        sender.removeTagView(tagView)
    }
    
}
//MARK:-TABLE VIEW DELEGATE
extension HotelListingViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        if let _ = self.topHotel{
            return 1
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.topHotel!.hotelList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            if(self.isThingsToDo!){
                return 400
            }else{
                return 300
            }
            
        }else {
            
            if(self.isThingsToDo!){
                return 245
            }else{
                return 160
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // if(indexPath.row == 0){
        if(self.isThingsToDo!){
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.ThingToDoListingTableViewCell, for: indexPath) as! ThingToDoListingTableViewCell
            return cell
            
        }else{
            if(indexPath.row == self.topHotel!.hotelList.count - 1){
                if(self.viewFilterLayer.isHidden){
                    if(self.topHotel!.hotelList.count > 10){
                        self.pageNumber = self.pageNumber + 1
                        self.loadMoreHotelList()
                    }
                }
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HotelTableViewCell, for: indexPath) as! HotelTableViewCell
            cell.configure(hotel: self.topHotel!.hotelList[indexPath.row])
            return cell
        }
        //        }
        //        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hotel = self.topHotel!.hotelList[indexPath.row]
        self.getHotelDetail(hotel: hotel)
        
    }
}
//MARK:- COLLECTION VIEW DELEGATE
extension HotelListingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,FilterTagsItemDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Global.shared.filter.tagList.count
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            return CGSize(width: 350, height: self.collectionView!.frame.size.height)
            
        }else {
            return CGSize(width: 150, height: 50)
        }
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.FilterTagsItemCollectionViewCell, for: indexPath) as! FilterTagsItemCollectionViewCell
        cell.delegate = self
        cell.configureView(title: Global.shared.filter.tagList[indexPath.row], index: indexPath.row)
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("item deselect")
    }
    func actionCallBackDeleteItem(index:Int) {
        let item = Global.shared.filter.tagList[index]
        Global.shared.filter.setFilters(text: item)
        Global.shared.filter.tagList.remove(at: index)
        if(Global.shared.filter.tagList.count == 0){
            self.collectionViewHeight?.constant = 0
        }else{
            self.collectionView?.reloadData()
        }
        //self.isApiCalling = true
        self.filterResult()
        self.loadMoreHotelList()
    }
    
}

//MARK:-Search Top Hotles
extension HotelListingViewController{
    func loadMoreHotelList()  {
        if(self.isApiCalling){
            return
        }else{
            self.isApiCalling = true
        }
        let requestMessage:RequestMessage? = RequestMessage()
        
        requestMessage?.hotelParams = self.createFilterAndLoadMoreRequest()
        if let request = requestMessage{
            GCD.async(.Default){
                GCD.async(.Main, execute: {
                    if let container = self.mainContainer{
                        container.startActivity()
                    }
                })
                let service = HotelService()
                service.loadMoreHotels(requestMessage: request, complete: { (responseMessage) in
                    GCD.async(.Main){
                        self.isApiCalling = false
                        if let container = self.mainContainer{
                            container.stopActivity()
                            
                        }
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let topHotel = responseMessage.data as? TopHotelViewModel {
                                if(self.isFilter && self.pageNumber == 0){
                                    self.topHotel = topHotel
                                    self.tblProductList?.reloadData()
                                    
                                }else{
                                    self.topHotel?.addMoreHotels(list: topHotel.hotelList)
                                    print(topHotel.currency)
                                    print(topHotel.hotelList)
                                    self.tblProductList?.reloadData()
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
    
    
    func createFilterAndLoadMoreRequest() -> [String:String] {
        
        var params = [String:String]()
        
        
        params["session_id"] = self.uuidString
        params["page_number"] = "\(self.pageNumber)"
        if(self.pageNumber > 0){
            return params
        }
        for item in self.requestMessageForRegion.queryItemList {
            params[item.name] = item.value
        }
        params["filter_result"] = "0"
        let filter = Global.shared.filter
        if(filter.isOptionSelected()){
            params["basic_amenities"] = Global.shared.filter.getOptionString()
        }
        if(filter.isStarSelected()){
            params["filter_star"] = Global.shared.filter.getStarString()
        }
        if(filter.isMealTypeSelected()){
            params["room_type"] = Global.shared.filter.getMealTypeString()
        }
        if(filter.isAccomodationTypeSelected()){
            params["hotel_type"] = Global.shared.filter.getAccomodationTypeString()
        }
        
        if(filter.isPriceChanged()){
            params["price_min"] = filter.priceSearch.minInAED
            params["price_max"] = filter.priceSearch.maxInAED
        }else{
            params["price_min"] = filter.priceSearch.defaultMinAED
            params["price_max"] = filter.priceSearch.defaultMaxAED
        }
        if(!self.txtSearch!.text!.isEmpty){
            params["search_text"] = self.txtSearch!.text!
        }
        
        if(filter.isHotelSearching()){
            if(filter.isHotelPriceSearch()){
                params["sort_price"] = filter.hotelSearch.answer
            }else{
                params["sort_star"] = filter.hotelSearch.answer
            }
        }
        
        return params
        
        
    }
    
    func searchRegionForHotel()  {
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.queryItemList = self.requestMessageForRegion.queryItemList
        
        if let request = requestMessage{
            GCD.async(.Default){
                let service = HotelService()
                service.searchRegionForHotel(requestMessage: request, complete: { (responseMessage) in
                    
                    switch responseMessage.serviceResponseType {
                    case .Success:
                        GCD.async(.Main){
                            if let region = responseMessage.data as? SearchRegionViewModel {
                                print(region.min)
                                print(region.max)
                                Global.shared.filter.setPrice(searchRegion: region)
                                Global.shared.searchRegion = region
                                self.viewFilterLayer.isHidden = true
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
//MARL:- HOTEL DETAIL API
extension HotelListingViewController {
    
    func getHotelDetail(hotel:HotelViewModel) {
        
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.queryItemList = self.createHotelDetailRequest(hotel: hotel)
        
        if let request = requestMessage {
            GCD.async(.Default){
                GCD.async(.Main, execute: {
                    if let container = self.mainContainer{
                        container.startActivity()
                    }
                })
                let service = HotelService()
                service.getHotelDetail(requestMessage: request, complete: { (responseMessage) in
                    GCD.async(.Main){
                        self.isApiCalling = false
                        if let container = self.mainContainer{
                            container.stopActivity()
                            
                        }
                    }
                    switch responseMessage.serviceResponseType {
                    case .Success:
                        GCD.async(.Main){
                            if let detail = responseMessage.data as? HotelDetailViewModel {
                                print(detail.shareUrl)
                                print(detail.hotelInfo.hotelCode)
                                Global.shared.hotelDetail = detail
                                self.showHotelDetail(hotel: hotel)
                                
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
    
    func createHotelDetailRequest(hotel:HotelViewModel) -> [URLQueryItem] {
        
        var items = [URLQueryItem]()
        items.append(URLQueryItem(name: "id", value: hotel.hotelCode))
        items.append(URLQueryItem(name: "price", value: hotel.price))
        items.append(URLQueryItem(name: "discount", value: hotel.rendomDiscount))
        items.append(URLQueryItem(name: "duration", value: "1"))
        
        for item in self.requestMessageForRegion.queryItemList {
            items.append(item)
        }
        return items
    }
    
    func showHotelDetail(hotel:HotelViewModel) {
        
        if let container = self.mainContainer{
            container.navigationbarHeight.constant = 44
        }
        let storyboard = UIStoryboard.init(name: StoryboardName.Hotel, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.HotelSearchDetailViewController) as? HotelSearchDetailViewController {
            vc.hotelDetail = Global.shared.hotelDetail!
            vc.requestMessageForRegion = self.requestMessageForRegion
            vc.selectedHotel = hotel
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
