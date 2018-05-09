//
//  GolfListingViewController.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 3/28/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class GolfListingViewController: BaseViewController, TopBarDelegate {
    
    @IBOutlet weak var tblGolfList:UITableView?
    @IBOutlet weak var txtSearch:UITextField?
    
    var isThingsToDo:Bool? = false
    var isApiCalling = false
    var pageNumber = 0
    var uuidString:String = ""
    var golfItemList = [GolfCourseListingViewModel]()
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.view.frame = CGRect(x: 0, y: 0, width: 375, height: 1334)
        
        self.uuidString = UUID().uuidString
        
        if(self.checkInternetConnection()){
            self.createRequestToLoadMoreGolfItems()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)

        if let container = self.mainContainer{
            
            container.lblTitle.text = "Golf"
            container.lblSubTitle.text = ""
            container.lblTitle.textColor = UIColor.white
            container.lblSubTitle.textColor = UIColor.white
            container.delegate = self
            container.btnMap.isHidden = true
        }
    }
    
    @IBAction func actionBack(_ sender:UIButton){
        
        if let container = self.mainContainer{
            container.bottomViewHeight.constant = 60
        }
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func actionCallBackMoveBack() {
        if let container = self.mainContainer{
            container.navigationbarHeight.constant = 0
        }
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func actionShowFilter(_ sender:UIButton){
       
        let storyboard = UIStoryboard.init(name: StoryboardName.Filter, bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.HotelFilterViewController) as? HotelFilterViewController{
            vc.isThingsToDo = self.isThingsToDo!
            self.navigationController?.present(vc, animated: true, completion: nil)
        }
    }
}

extension GolfListingViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.golfItemList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "GolfTableViewCell", for: indexPath) as! GolfTableViewCell
        
        if(indexPath.row == self.golfItemList.count - 1){
            if(self.golfItemList.count > 10){
                self.pageNumber = self.pageNumber + 1
                self.createRequestToLoadMoreGolfItems()
            }
        }
        
        cell.configureCell(golfItem: self.golfItemList[indexPath.row], index: indexPath.row)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tblGolfList?.deselectRow(at: indexPath, animated: true)

        let storyboard = UIStoryboard.init(name: StoryboardName.Golf, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "GolfDetail_VC_SB") as? GolfDetailViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// API Calls
extension GolfListingViewController {
    
    func createRequestToLoadMoreGolfItems() {
        
        if(self.isApiCalling){
            return
        }else{
            self.isApiCalling = true
        }
        
        var params = [String:String]()
        
        params["session_id"] = self.uuidString
        params["page_number"] = "\(self.pageNumber)"
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.hotelParams = params
        
        if let request = requestMessage {
            GCD.async(.Default){
                GCD.async(.Main, execute: {
                    if let container = self.mainContainer{
                        container.startActivity()
                    }
                })
                let service = GolfService()
                service.getGolfListing(requestMessage: request, complete: { (responseMessage) in
                    GCD.async(.Main){
                        self.isApiCalling = false
                        if let container = self.mainContainer{
                            container.stopActivity()
                        }
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let golfList = responseMessage.data as? [GolfCourseListingViewModel] {
                                
                                if(self.pageNumber == 0){
                                    self.golfItemList = golfList
                                    self.tblGolfList?.reloadData()
                                    
                                }else{
                                    self.golfItemList.append(contentsOf: golfList)
                                    self.tblGolfList?.reloadData()
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
