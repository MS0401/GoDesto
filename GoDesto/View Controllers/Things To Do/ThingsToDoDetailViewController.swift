//
//  ThingsToDoDetailViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

import ExpandableTableViewController
enum TableViewRows: Int {
    case text = 0, datePicker, list
}

class ThingsToDoDetailViewController: ExpandableTableViewController,TopBarDelegate {
    
    

    var mapCell:GolfDetailMapLocationTableViewCell?
    var sliderCell:ThingsToDoDetailSliderTableViewCell?
    
    var thingToDoDetail:ThingToDoDetailViewModel?
    var thingItem:HomeInfoViewModel?
    var tabs:ThingsToDoTabs?
    var objAlertVC:BaseViewController?
    var alertView = CustomIOSAlertView()
    var isFromHome:Bool? = false
    var url = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabs = ThingsToDoTabs.Overview
        self.expandableTableView.expandableDelegate = self
        
        self.expandableTableView.register(UINib(nibName: NIBName.ThingsToDoDetailSliderTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.ThingsToDoDetailSliderTableViewCell)
         self.expandableTableView.register(UINib(nibName: NIBName.ThingsToDoMenuTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.ThingsToDoMenuTableViewCell)
        
        self.getDetail()
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
    func actionCallBackMoveBack() {
        if(self.isFromHome!){
            if let container = self.mainContainer{
                container.navigationbarHeight.constant = 0
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Init
    override func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if cell.responds(to: #selector(setter: UIView.preservesSuperviewLayoutMargins)){
            cell.preservesSuperviewLayoutMargins = false
        }
        
        if cell.responds(to: #selector(setter: UIView.layoutMargins)){
            cell.layoutMargins = UIEdgeInsets.zero
        }
    }

}
extension ThingsToDoDetailViewController:ExpandableTableViewDelegate,ThingsToDoDetailOverviewDelegate,GolfDetailDescriptionDelegate,GolfDetailAddReviewDelegate,ThingsToDoMenuDelegate,ThingsToDoDetailSliderDelegate,ThingsToDoDetailAmentiesDelegate{
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        if let _ = self.thingToDoDetail{
            if(self.tabs == ThingsToDoTabs.Overview){
                return 7
            }else if(self.tabs == ThingsToDoTabs.Review){
                return self.thingToDoDetail!.reviewList.count + 1
            }else if(self.tabs == ThingsToDoTabs.Menu){
                return 3
            }
        }
        return 0
        
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, cellForRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) -> UITableViewCell {
        if(expandableIndexPath.row == 0){
            if let  cell = self.sliderCell{
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.ThingsToDoDetailSliderTableViewCell) as! ThingsToDoDetailSliderTableViewCell
                cell.delegate = self

                cell.confgureView(detail: self.thingToDoDetail!.toDoDetail)
                self.sliderCell = cell
                return cell
            }
        }else if(expandableIndexPath.row == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.ThingsToDoDetailOverviewTableViewCell) as! ThingsToDoDetailOverviewTableViewCell
            cell.configureView(tabs: self.tabs!)
            cell.delegate = self
            return cell
        }
        if(self.tabs == ThingsToDoTabs.Overview){
            if(expandableIndexPath.row == 2){
                let cell = tableView.dequeueReusableCell(withIdentifier: "ThingsToDoDetailAmentiesTableViewCell") as! ThingsToDoDetailAmentiesTableViewCell
                cell.configueView(thing: self.thingToDoDetail!.toDoDetail)
                cell.delegate = self
                
                return cell
            }else if(expandableIndexPath.row == 3){
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailDescriptionTableViewCell") as! GolfDetailDescriptionTableViewCell
                // cell.configureView(text: self.thingToDoDetail!.toDoDetail.bodyCopy)
                cell.configureDetail(detail: self.thingToDoDetail!.toDoDetail.completeDetail)
                cell.delegate = self
                // cell.delegate = self
                return cell
            }else if(expandableIndexPath.row == 4){
                if let cell = self.mapCell{
                    return cell
                }else{
                    if let cell = self.mapCell{
                        return cell
                    }else{
                        let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailMapLocationTableViewCell") as! GolfDetailMapLocationTableViewCell
                        cell.configureView(address: self.thingToDoDetail!.toDoDetail.address)
                        self.mapCell = cell
                        
                        return cell
                    }
                }
            }else if(expandableIndexPath.row == 5 || expandableIndexPath.row == 6){
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailMenuTableViewCell") as! GolfDetailMenuTableViewCell
                if(expandableIndexPath.row == 5){
                    cell.configureView(section: Global.shared.detail.thingToDoSection[0], index: 0)
                }else{
                    cell.configureView(section: Global.shared.detail.thingToDoSection[1], index: 1)
                }
                
                // cell.delegate = self
                return cell
            }
        }else if(self.tabs == ThingsToDoTabs.Review){
            if(expandableIndexPath.row < self.thingToDoDetail!.reviewList.count){
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailReviewItemTableViewCell") as! GolfDetailReviewItemTableViewCell
                cell.configureView(review: self.thingToDoDetail!.reviewList[expandableIndexPath.row])
                return cell
            }else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailAddReviewTableViewCell") as! GolfDetailAddReviewTableViewCell
                cell.delegate = self
                return cell
            }
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier:TableViewCellIdentifier.ThingsToDoMenuTableViewCell) as! ThingsToDoMenuTableViewCell
            cell.configureView(images: self.thingToDoDetail!.toDoDetail.menuImageList)
            cell.delegate = self
           // cell.configureView(review: self.thingToDoDetail!.reviewList[expandableIndexPath.row])
            return cell
            
        }
        return UITableViewCell()
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) -> CGFloat {
        if(self.tabs == ThingsToDoTabs.Menu){
            if(expandableIndexPath.row == 2){
                let itemHeight = Int((ScreenSize.SCREEN_WIDTH / 3) - 10)
                let count = self.thingToDoDetail!.toDoDetail.menuImageList.count
                let remainder = count % 3
                var spacing = (count / 3) * 10
                var height = 0
                
                if(remainder > 0){
                    spacing = spacing + 10
                    height = (itemHeight * (count / 3)) + itemHeight + spacing
                }else{
                    height = (itemHeight * (count / 3)) + spacing
                }
                return CGFloat(height)
            }else{
                 return UITableViewAutomaticDimension
            }
        }else{
            if(self.tabs == ThingsToDoTabs.Overview){
                if(expandableIndexPath.row == 2){
                    return 95
                }else{
                    return UITableViewAutomaticDimension
                }
            }
            return UITableViewAutomaticDimension
        }
        
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, estimatedHeightForRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) -> CGFloat {
        return 100
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) {
        if(self.tabs == ThingsToDoTabs.Overview){
            if(expandableIndexPath.row == 3){
                //            let cell = expandableTableView.cellForRowAtIndexPath(expandableIndexPath) as! GolfDetailDescriptionTableViewCell
                //            let detail = self.thingToDoDetail!.toDoDetail.completeDetail
                //            if(detail.isSelected){
                //                detail.isSelected = false
                //                self.expandableTableView.reloadData()
                //            }else{
                //                detail.isSelected = true
                //              self.expandableTableView.reloadData()
                //            }
                //            cell.configureDetail(detail: detail)
            }
            if(expandableIndexPath.row == 5){
                let cell = expandableTableView.cellForRowAtIndexPath(expandableIndexPath) as! GolfDetailMenuTableViewCell
                let header = Global.shared.detail.thingToDoSection[0]
                if(header.isSelected){
                    header.isSelected = false
                }else{
                    header.isSelected = true
                }
                cell.configure(section: header, index: 0)
                
            }else if(expandableIndexPath.row == 6){
                let cell = expandableTableView.cellForRowAtIndexPath(expandableIndexPath) as! GolfDetailMenuTableViewCell
                let header = Global.shared.detail.thingToDoSection[1]
                if(header.isSelected){
                    header.isSelected = false
                }else{
                    header.isSelected = true
                }
                cell.configure(section: header, index: 0)
                
            }
        }
        expandableTableView.deselectRowAtExpandableIndexPath(expandableIndexPath, animated: true)
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, numberOfSubRowsInRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) -> Int {
        if(self.tabs == ThingsToDoTabs.Overview){
            if(expandableIndexPath.row == 5){
                return self.thingToDoDetail!.timingList.count
            }else if(expandableIndexPath.row == 6){
                return 1
            }
        }
        return 0
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, subCellForRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) -> UITableViewCell {
        if(self.tabs == ThingsToDoTabs.Overview){
            if(expandableIndexPath.row == 5){
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HotelSearchDetailFacilitiesTableViewCell) as! HotelSearchDetailFacilitiesTableViewCell
                cell.configure(title: self.thingToDoDetail!.timingList[expandableIndexPath.subRow].day)
                return cell
            }else if(expandableIndexPath.row == 6){
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailDescriptionTableViewCell") as! GolfDetailDescriptionTableViewCell
                cell.configureView(text: self.thingToDoDetail!.toDoDetail.bodyCopy)
                // cell.delegate = self
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, heightForSubRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, estimatedHeightForSubRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) -> CGFloat {
        return 50
    }
    
    func expandableTableView(_ expandableTableView: ExpandableTableView, didSelectSubRowAtExpandableIndexPath expandableIndexPath: ExpandableIndexPath) {
        
    }
    
    
    //cell delegate
    func actionCallBackSelectedImage(index:Int){
        let storyboard = UIStoryboard.init(name: StoryboardName.Home, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.PreviewMenuViewController) as? PreviewMenuViewController{
            if let container = self.mainContainer{
                container.navigationbarHeight.constant = 0
                container.bottomViewHeight.constant  = 0
            }
            vc.currentIndex = index
            vc.imageList = self.thingToDoDetail!.toDoDetail.menuImageList
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func actionCallBackSetList(tabs:ThingsToDoTabs){
        self.tabs = tabs
        self.expandableTableView.reloadData()
    }
    func actionCallBackShowMoreText(){
        self.expandableTableView.reloadData()
    }
    func  actionCallBackAddReview(){
        self.createAddReviewPopup()
        self.alertView?.show()
    }
    
    func didTapBookingBtn() {
        
        let storyboard = UIStoryboard.init(name: StoryboardName.Bookings, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "ToDoBookingViewController") as? ToDoBookingViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }

    }
    
    func actionCallBackShareText(url:String){
        let text = url
        UIPasteboard.general.string = text
        let controller = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        self.navigationController?.present(controller, animated: true, completion: nil)
    }
    func actionCallBackShowDirection(){
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
            if  !UIApplication.shared.openURL(URL(string:
                "comgooglemaps://?saddr=&daddr=\(self.thingToDoDetail!.toDoDetail.lat),\(self.thingToDoDetail!.toDoDetail.lng)&directionsmode=driving")!){
                
            }
            else {
                print("can't open map")
            }
        }
        else {
            print("can't open map")
        }
    }
    
}
//MARK:-
//MARK:-Add Review Popup
//MARK:-
extension ThingsToDoDetailViewController:AddReviewPopupDelegate{
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
        if(!text.isEmpty){
            self.addYourReview(text: text, rateValue: rating)
        }
        
    }
   
}
//MARK:-THING TO DO DETAIL API
extension ThingsToDoDetailViewController{
    func getDetail()  {
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.queryItemList = self.createGetDetailRequest()
        
        if let request = requestMessage{
            GCD.async(.Default){
                GCD.async(.Main, execute: {
                    if let container = self.mainContainer{
                        container.startActivity()
                    }
                })
                let service = ThingToDoService()
                service.getThingsToDoDetail(requestMessage: request, complete: { (responseMessage) in
                    
                    GCD.async(.Main){
                        if let container = self.mainContainer{
                            container.stopActivity()
                        }
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let thingsToDo = responseMessage.data as? ThingToDoDetailViewModel {
                               self.thingToDoDetail = thingsToDo
                                self.expandableTableView.reloadData()
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
    func createGetDetailRequest() -> [URLQueryItem] {
        var items = [URLQueryItem]()
        if(self.isFromHome!){
            items.append(URLQueryItem(name: "url", value: self.url))
        }else{
            items.append(URLQueryItem(name: "url", value: self.thingItem!.url))
        }
        
        return items
        
    }
    func addYourReview(text:String,rateValue:Double)  {
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.rating = "\(rateValue)"
        requestMessage?.text = text
        requestMessage?.loginId = Global.shared.login!.loginId
        requestMessage?.hubId = self.thingToDoDetail!.toDoDetail.id
        
        if let request = requestMessage{
            GCD.async(.Default){
                GCD.async(.Main, execute: {
                    if let container = self.mainContainer{
                        container.startActivity()
                    }
                })
                let service = ReviewService()
                service.submitReview(requestMessage: request, complete: { (responseMessage) in
                    GCD.async(.Main){
                        if let container = self.mainContainer{
                            container.stopActivity()
                        }
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let response = responseMessage.data as? DefaultResponseViewModel {
                                self.showAlertVIew(message: response.message, title: "")
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
//MARK:- MESSAGE ALLERT
extension ThingsToDoDetailViewController{
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
}

