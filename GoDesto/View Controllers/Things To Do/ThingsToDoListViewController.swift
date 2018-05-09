//
//  ThingsToDoListViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class ThingsToDoListViewController: BaseViewController,TopBarDelegate,TagListViewDelegate,UITextFieldDelegate {

    @IBOutlet weak var tblProductList:UITableView?
    @IBOutlet weak var txtSearch:UITextField?
    @IBOutlet weak var tagListView: TagListView!
    @IBOutlet weak var collectionView:UICollectionView?
    @IBOutlet weak var collectionViewHeight:NSLayoutConstraint?
    
    var isThingsToDo:Bool? = true
    var topHotel:TopHotelViewModel?
    var pageNumber = 0
    var requestMessageForRegion:RequestMessage = RequestMessage()
    var uuidString:String = ""
    var isFilter:Bool = false
    var isApiCalling = false
    var thingsToDo:HomeViewModel?
    var isFromHome:Bool? = false
    var url:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
       
        if(self.checkInternetConnection()){
            if(self.isFromHome!){
                self.getThingToDoListingForHome()
            }else{
                self.getThingToDoListing()
            }
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.recievedNotificationFromFilter(notification:)), name: Notification.Name("NotificationFromFilters"), object: nil)
        
        if(Global.shared.filter.tagList.count == 0){
            self.collectionViewHeight?.constant = 0
        }
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let container = self.mainContainer{
            container.lblTitle.text = "Things to do"
            container.lblSubTitle.text = "Pakistan"
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
       
        
        
    }
    func actionCallbackShowMap(){
        let storyboard = UIStoryboard.init(name: StoryboardName.Home, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.GoogleMapViewController) as? GoogleMapViewController{
            if let _ = self.thingsToDo{
                vc.thingToDoList = self.thingsToDo!.thingToDoList
                vc.isFromThingsToDo = true
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
    @IBAction func actionShowFilters(_ sender:UIButton){
        
        let storyboard = UIStoryboard.init(name: StoryboardName.ThingsToDO, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.ThingsTodoFilterViewController) as? ThingsTodoFilterViewController{
            if let container = self.mainContainer{
                container.bottomViewHeight.constant = 0
            }
            self.navigationController?.pushViewController(vc, animated: true)
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
extension ThingsToDoListViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        if let _ = self.thingsToDo{
            return 1
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.thingsToDo!.thingToDoList.count
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
                return 220
            }else{
                return 160
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.ThingToDoListingTableViewCell, for: indexPath) as! ThingToDoListingTableViewCell
            cell.configureView(thing:self.thingsToDo!.thingToDoList[indexPath.row])
            return cell
            
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thing = self.thingsToDo!.thingToDoList[indexPath.row]
        
        let storyboard = UIStoryboard.init(name: StoryboardName.ThingsToDO, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.ThingsToDoDetailViewController) as? ThingsToDoDetailViewController{
            vc.thingItem = thing
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}
//MARK:- COLLECTION VIEW DELEGATE
extension ThingsToDoListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,FilterTagsItemDelegate{
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
        
    }
    
}
//MARK:-GET THING TO DO LIST API
extension ThingsToDoListViewController{
    func getThingToDoListing()  {
        if(self.isApiCalling){
            return
        }else{
            self.isApiCalling = true
        }
        let requestMessage:RequestMessage? = RequestMessage()
        
        requestMessage?.queryItemList = self.createThingsToDoRequest()
        if let request = requestMessage{
            GCD.async(.Default){
                GCD.async(.Main, execute: {
                    if let container = self.mainContainer{
                        container.startActivity()
                    }
                })
                let service = ThingToDoService()
                service.getThingToDoList(requestMessage: request, complete: { (responseMessage) in
                    GCD.async(.Main){
                        self.isApiCalling = false
                        if let container = self.mainContainer{
                            container.stopActivity()
                            
                        }
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let home = responseMessage.data as? HomeViewModel {
                                self.thingsToDo = home
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
    
    func createThingsToDoRequest() -> [URLQueryItem] {
        var items = [URLQueryItem]()
        
        items.append(URLQueryItem(name: "session_id", value: self.uuidString))
        items.append(URLQueryItem(name: "page_number", value: "\(self.pageNumber)"))
        
        return items
    }
    func getThingToDoListingForHome()  {
       
        let requestMessage:RequestMessage? = RequestMessage()
            requestMessage?.address = self.url
        if let request = requestMessage{
            GCD.async(.Default){
                GCD.async(.Main, execute: {
                    if let container = self.mainContainer{
                        container.startActivity()
                    }
                })
                let service = ThingToDoService()
                service.getThingToDoListForHome(requestMessage: request, complete: { (responseMessage) in
                    GCD.async(.Main){
                        self.isApiCalling = false
                        if let container = self.mainContainer{
                            container.stopActivity()
                            
                        }
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let home = responseMessage.data as? HomeViewModel {
                                self.thingsToDo = home
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
    
}

