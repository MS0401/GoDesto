//
//  HotelDetailViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 19/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HotelDetailViewController: BaseViewController,HomeDetailSliderDelegate {

    @IBOutlet weak var tblProductList:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tblProductList!.register(UINib(nibName: NIBName.HotelDetailSliderTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.HomeDetailSliderTableViewCell)
        self.tblProductList!.register(UINib(nibName: NIBName.HotelDetailFacilitiesTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.HomeDetailFacilitiesTableViewCell)
        
        self.tblProductList?.estimatedRowHeight = 43
        self.tblProductList?.estimatedSectionHeaderHeight = 100
        self.tblProductList?.sectionHeaderHeight = UITableViewAutomaticDimension
        self.tblProductList?.rowHeight = UITableViewAutomaticDimension
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
extension HotelDetailViewController:UITableViewDelegate,UITableViewDataSource,HomeDetailMenuDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return Global.shared.detail.sectionList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let headerSection = Global.shared.detail.sectionList[section]
        if(headerSection.isSelected){
            if(section == 1){
                return 1
            }else if(section == 2){
                return 1
            }else if(section == 3){
                let section = Global.shared.detail.sectionList[section]
                let list = Global.shared.detail.dicDetail[section.title] as? [OpeningTimesViewModel]
                return list!.count
            }else if(section == 4){
                return 1
            }else if(section == 5){
                return 0
            }
            return 0
        }
        return 0
        
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if(section == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HomeDetailSliderTableViewCell) as! HomeDetailSliderTableViewCell
            cell.delegate = self
            return cell
        }else{
            let headerSection = Global.shared.detail.sectionList[section]
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HomeDetailMenuTableViewCell) as! HomeDetailMenuTableViewCell
            cell.delegate = self
            print(section)
            if(section == 5){
                cell.configure(section: headerSection,index: section, isRatingCell: true)
            }else{
                cell.configure(section: headerSection,index: section)
            }
            
            return cell
            
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 1 || indexPath.section == 4){
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HomeDetailOverviewTableViewCell) as! HomeDetailOverviewTableViewCell
            let section = Global.shared.detail.sectionList[indexPath.section]
            let overview = Global.shared.detail.dicDetail[section.title] as? OverviewViewModel
            cell.configureView(overview: overview!)
            return cell
        }else if(indexPath.section == 2){
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HomeDetailFacilitiesTableViewCell) as! HomeDetailFacilitiesTableViewCell
            let section = Global.shared.detail.sectionList[indexPath.section]
            let list = Global.shared.detail.dicDetail[section.title] as? [FacilitiesViewModel]
            cell.configureView(list: list!)
            return cell
        }else if(indexPath.section == 3){
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HotelDetailTimingTableViewCell) as! HotelDetailTimingTableViewCell
            let section = Global.shared.detail.sectionList[indexPath.section]
            let list = Global.shared.detail.dicDetail[section.title] as? [OpeningTimesViewModel]
            cell.configureView(timing: list![indexPath.row])
            if(indexPath.row == list!.count - 1){
                cell.lblLine.isHidden = false
            }else{
                cell.lblLine.isHidden = true
            }
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func actionCallBackSelectOption(isSelected: Bool,index: Int) {
        let headerSection = Global.shared.detail.sectionList[index]
        if( index == 5){
            
            let storyboard =  UIStoryboard.init(name: StoryboardName.Home, bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.ReviewListingViewController) as? ReviewListingViewController{
                if let container = self.mainContainer{
                    container.bottomViewHeight.constant = 0
                }
                let reviewList = Global.shared.detail.dicDetail[headerSection.title] as! [ReviewViewModel]
                vc.reviewList = reviewList
                self.navigationController?.pushViewController(vc, animated: true)
            }
            return
        }
        
        headerSection.isSelected = isSelected
        UIView.transition(with: self.tblProductList!,
                          duration: 0.35,
                          options: .transitionCrossDissolve,
                          animations: { self.tblProductList!.reloadData() })
    }
    func actionCallBackShowGoogleMap() {
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
            if  !UIApplication.shared.openURL(URL(string:
                "comgooglemaps://?saddr=&daddr=\(31.5258322),\(74.2775013)&directionsmode=driving")!){
                
            }
            else {
                print("can't open map")
            }
        }
        else {
            print("can't open map")
        }
    }
    func actionCallBackShare() {
        let text = "Download this app "
        UIPasteboard.general.string = text
        let controller = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        self.navigationController?.present(controller, animated: true, completion: nil)
    }
}

