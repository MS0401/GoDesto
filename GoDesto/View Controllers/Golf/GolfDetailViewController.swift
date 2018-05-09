//
//  GolfDetailViewController.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 3/28/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class GolfDetailViewController: BaseViewController,TopBarDelegate {
    
    @IBOutlet weak var tblProductList:UITableView?
    
    var isOverview:Bool? = true
    var mapCell:GolfDetailMapLocationTableViewCell?
    var sliderCell:GolfDetailSliderTableViewCell?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tblProductList!.register(UINib(nibName: "GolfDetailSliderTableViewCell", bundle: nil), forCellReuseIdentifier: "GolfDetailSliderTableViewCell")
        self.tblProductList!.register(UINib(nibName: NIBName.GolfTickersTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.GolfTickerTableViewCell)
        
//        self.tblProductList?.estimatedRowHeight = 43
//        self.tblProductList?.rowHeight = UITableViewAutomaticDimension
        
        self.tblProductList?.estimatedRowHeight = 43
        self.tblProductList?.estimatedSectionHeaderHeight = 10
        self.tblProductList?.sectionHeaderHeight = UITableViewAutomaticDimension
        self.tblProductList?.rowHeight = UITableViewAutomaticDimension
    }
    override func viewWillAppear(_ animated: Bool) {
        if let container = self.mainContainer{
            container.showBackIcon()
          //  container.lblMenuTitle.isHidden = false
            container.lblTitle.text = NavigationTitles.GolfDetail
            container.lblSubTitle.isHidden = true
          //  container.lblMenuTitle.text = NavigationTitles.GolfDetail
            container.delegate = self
            container.btnMap.isHidden = true
            
        }
    }
    func actionCallBackMoveBack() {
        self.navigationController?.popViewController(animated: true)
    }
    func actionCallBackShowMenu() {
        if let container = self.mainContainer{
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
extension GolfDetailViewController:UITableViewDelegate,UITableViewDataSource,GolfDetailMenuDelegate,GolfDetailOverviewDelegate,GolfDetailAddReviewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        if(self.isOverview!){
            return Global.shared.detail.golfSectionList.count
        }else{
            return 4
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.isOverview!){
            let headerSection = Global.shared.detail.golfSectionList[section]
            if(headerSection.isSelected){
                return 1
            }
            
            return 0
        }else{
            if(section == 2){
                return 2
            }else {
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
                    let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailSliderTableViewCell") as! GolfDetailSliderTableViewCell
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
                return cell
            }else if(section == 3){
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailDescriptionTableViewCell") as! GolfDetailDescriptionTableViewCell
                return cell
            }else if(section == 4){
                if let cell = self.mapCell{
                    return cell
                }else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailMapLocationTableViewCell") as! GolfDetailMapLocationTableViewCell
                    self.mapCell = cell
                    return cell
                }
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailMenuTableViewCell") as! GolfDetailMenuTableViewCell
                cell.configure(section: Global.shared.detail.golfSectionList[section], index: section)
                cell.delegate = self
                return cell
            }
        }else{
            if(section == 0){
                if let  cell = self.sliderCell{
                    return cell
                }else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailSliderTableViewCell") as! GolfDetailSliderTableViewCell
                    self.sliderCell = cell
                    return cell
                }
            }else if(section == 1){
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailOverviewTableViewCell") as! GolfDetailOverviewTableViewCell
                cell.configureView(isOverview: self.isOverview!)
                cell.delegate = self
                return cell
            }else if(section == 3){
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailAddReviewTableViewCell") as! GolfDetailAddReviewTableViewCell
                cell.delegate = self
                return cell
            }else{
                let view = UIView(frame: CGRect(x: 0, y: 0, width: ScreenSize.SCREEN_WIDTH, height: 0))
                return view
            }
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(self.isOverview!){
            if(indexPath.section == 5 || indexPath.section  == 6){
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailFacilitiesTableViewCell") as! GolfDetailFacilitiesTableViewCell
                return cell
            }else if(indexPath.section == 7){
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailCourseFeeTableViewCell") as! GolfDetailCourseFeeTableViewCell
                return cell
            }
            return UITableViewCell()
        }else{
            if(indexPath.section == 2){
                let cell = tableView.dequeueReusableCell(withIdentifier: "GolfDetailReviewItemTableViewCell") as! GolfDetailReviewItemTableViewCell
                return cell
            }else{
                return UITableViewCell()
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
        GCD.async(.Main) {
            let headerSection = Global.shared.detail.golfSectionList[section]
            headerSection.isSelected = isSelected
            UIView.transition(with: self.tblProductList!,
                              duration: 0.35,
                              options: .transitionCrossDissolve,
                              animations: { self.tblProductList!.reloadData() })
        }
        
    }
    
    
}
