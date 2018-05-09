//
//  HomeViewController.swift
//  JayEat
//
//  Created by Ghafar Tanveer on 14/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var txtSearch:IQDropDownTextField?
    @IBOutlet weak var tblMenu:UITableView?
    @IBOutlet var arrowTable: UITableView!
    @IBOutlet weak var btnSideMenu:UIButton?
    @IBOutlet weak var viewSearch:UIView?
    @IBOutlet weak var txtSearchHome:UITextField?
    @IBOutlet weak var btnSearch:UIButton?
    @IBOutlet weak var imgSearch:UIImageView?
    @IBOutlet weak var imgMenu:UIImageView?
    @IBOutlet weak var lblNavigationTitle:UILabel?
    @IBOutlet var arrowDownTitle: UILabel!
    @IBOutlet var arrowdownView: UIView!
    
    
    var searchBool: Bool = false
    var homeInfo:HomeViewModel?
    var flag: Bool = true
    
    var arrowTitles = ["Global", "Dubai"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.lblNavigationTitle?.isHidden = true
        self.txtSearchHome?.isHidden = true
        self.txtSearchHome?.returnKeyType = .search
        
        //MARK: Device List Table hidden
        self.arrowTable.isHidden = true
        self.arrowTable.layer.cornerRadius = 5
        
        self.tblMenu?.delegate = self
        
        //self.addSideMenu(button: self.btnSideMenu!)
        self.actionChangeNavigationBar(self.btnSideMenu!)
        
        self.tblMenu!.register(UINib(nibName: NIBName.HomeSliderTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.HomeSliderCell)
        self.tblMenu!.register(UINib(nibName: NIBName.HomeSliderPopularTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.HomePopularItemCell)
        self.tblMenu!.register(UINib(nibName: NIBName.HomeMenuItemTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.HomeMenuItemTableViewCell)
        
        self.getHomeInfo()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func showBackIcon(isAddMenu:Bool? = false)  {
        if(isAddMenu!){
            self.btnSideMenu!.removeTarget(nil, action: nil, for: .allEvents)
            self.addSideMenu(button: self.btnSideMenu!)
        }else{
            self.btnSideMenu!.removeTarget(nil, action: nil, for: .allEvents)
            self.btnSideMenu!.addTarget(self, action: #selector(HomeViewController.actionChangeNavigationBar(_:)), for: .touchUpInside)
        }
    }
    @IBAction func actionChangeNavigationBar(_ sender:UIButton){
        
        self.showBackIcon(isAddMenu: true)
    }
    
    @IBAction func actionSearch(_ sender:UIButton){
        
        if !self.searchBool {
            self.txtSearchHome?.isHidden = false
            self.arrowdownView.isHidden = true
            self.imgSearch?.image = UIImage(named: "close")
            self.imgSearch?.alpha = 0.5
            self.searchBool = true
        }else {
            
            if self.txtSearchHome?.text != "" {
                self.txtSearchHome?.text = ""
                self.imgSearch?.alpha = 0.5
                
            }else {
                self.txtSearchHome?.isHidden = true
                self.arrowdownView.isHidden = false
                self.imgSearch?.image = UIImage(named:"IconSearchWhite")
                self.searchBool = false
                self.txtSearchHome?.resignFirstResponder()
            }
            
        }
        
    }
    
    @IBAction func ArrowDownAction(_ sender: UIButton) {
        
        if flag {
            self.flag = false
            UIView.transition(with: self.arrowTable, duration: 0.3, options: .transitionCrossDissolve, animations: { self.arrowTable.isHidden = false }, completion: nil)
            
        } else {
            self.flag = true
            UIView.transition(with: self.arrowTable, duration: 0.3, options: .transitionCrossDissolve, animations: { self.arrowTable.isHidden = true }, completion: nil)
        }
        
    }
    
    
    
}
extension HomeViewController:UITableViewDelegate,UITableViewDataSource,HomeSliderPopularDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if tableView == self.arrowTable {
            return 1
        }else {
            if let _ = self.homeInfo{
                return 1
            }else{
                return 0
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.arrowTable {
            return self.arrowTitles.count
        }else {
            return 6
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == self.arrowTable {
            
            return 35
        }else {
            if UIDevice.current.userInterfaceIdiom == .pad {
                
                if(indexPath.row == 0){
                    return 400
                }else if(indexPath.row == 1){
                    let noOfItemsInRow = 4
                    var height = 0
                    let remainder = self.homeInfo!.categories.count % noOfItemsInRow
                    if(remainder > 0){
                        height =  (self.homeInfo!.categories.count/noOfItemsInRow) * 100 + 180
                    }else{
                        height =  (self.homeInfo!.categories.count/noOfItemsInRow) * 100 + 80
                    }
                    return CGFloat(height)
                }else{
                    return 300
                }
                
            }else {
                
                if(indexPath.row == 0){
                    return 250
                }else if(indexPath.row == 1){
                    return 320
                }else{
                    return 200
                }
            }
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.arrowTable {
            // MARK: DeviceList Talbe configure.
            let cell = tableView.dequeueReusableCell(withIdentifier: "maindevicelist", for: indexPath) as! MainDeviceListCell
            
            cell.deviceName.text = arrowTitles[indexPath.row]
            return cell
        }else {
            if(indexPath.row == 0){
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HomeSliderCell, for: indexPath) as! HomeSliderTableViewCell
                return cell
            }else if(indexPath.row == 1){
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HomeMenuItemTableViewCell, for: indexPath) as! HomeMenuItemTableViewCell
                cell.configureView(categoryList: self.homeInfo!.categories)
                cell.delegate = self
                return cell
                
            }else if(indexPath.row == 2) {
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HomePopularItemCell, for: indexPath) as! HomeSliderPopularTableViewCell
                cell.configureView(info: self.homeInfo!.restaurant,index: indexPath.row)
                cell.delegate = self
                cell.lblTitle?.text = "Today's popular restaurants"
                
                return cell
            }else if(indexPath.row == 3) {
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HomePopularItemCell, for: indexPath) as! HomeSliderPopularTableViewCell
                cell.configureView(info: self.homeInfo!.happyHour,index: indexPath.row)
                cell.delegate = self
                cell.lblTitle?.text = "Happy Hours"
                
                
                return cell
            }else if(indexPath.row == 4) {
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HomePopularItemCell, for: indexPath) as! HomeSliderPopularTableViewCell
                cell.configureView(info: self.homeInfo!.ladiesNite,index: indexPath.row)
                cell.delegate = self
                cell.lblTitle?.text = "Ladies night"
                
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HomePopularItemCell, for: indexPath) as! HomeSliderPopularTableViewCell
                cell.configureView(info: self.homeInfo!.brunches,index: indexPath.row)
                cell.delegate = self
                
                cell.lblTitle?.text = "Brunches"
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == self.arrowTable {
            self.flag = true
            self.arrowDownTitle.text = arrowTitles[indexPath.row]
            UIView.transition(with: self.arrowTable, duration: 0.3, options: .transitionCrossDissolve, animations: { self.arrowTable.isHidden = true }, completion: nil)
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let sliderCell = self.tblMenu?.cellForRow(at: IndexPath(row: 0, section: 0)) as? HomeSliderTableViewCell{
            sliderCell.scrollViewDidScroll(scrollView: scrollView)
        }
    }
    func actionSelectPopularItem(index:Int,cellIndex:Int){
        var url = ""
        if(cellIndex == 2){
            url = self.homeInfo!.restaurant[index].url
        }else if(cellIndex == 3){
            url = self.homeInfo!.happyHour[index].url
        }else if(cellIndex == 4){
            url = self.homeInfo!.ladiesNite[index].url
        }else if(cellIndex == 5){
            url = self.homeInfo!.brunches[index].url
        }
        
        
        let storyboard = UIStoryboard.init(name: StoryboardName.ThingsToDO, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.ThingsToDoDetailViewController) as? ThingsToDoDetailViewController{
            if let container = self.mainContainer{
                container.navigationbarHeight.constant = 54
            }
            vc.isFromHome = true
            vc.url = url
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    func actionCallBaclSelectMenuItem(index: Int) {
        
        
        if index == 0{
            
            let storyboard = UIStoryboard.init(name: "HotelSearch", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "HotelSearch_VC_SB") as? HotelSearchViewController{
                
                if let container = self.mainContainer{
                    container.navigationbarHeight.constant = 44
                }
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }else if index == 3{
            
            let storyboard = UIStoryboard.init(name: StoryboardName.Golf, bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "GolfListing_VC_SB") as? GolfListingViewController{
                
                if let container = self.mainContainer{
                    container.navigationbarHeight.constant = 44
                }
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }else {
            var url = ""
            if(index == 1){
                url = "https://www.godesto.com/AdminApps/load_thingstodo?page_number=0&type_by=restaurant&session_id=62b3f30b-b561-45bf-be21-0783328f32a8_godesto"
            }else if(index == 4){
                url = "https://www.godesto.com/AdminApps/load_thingstodo?page_number=0&session_id=6ef55652-069e-4bfb-b719-675a3490fb97_godesto&filter_by=ladies_nite"
            }else if(index == 5){
                url = "https://www.godesto.com/AdminApps/load_thingstodo?page_number=0&session_id=c52a6696-aaa5-4959-b00c-e6383a5d278e_godesto&filter_by=indoor"
            }else if(index == 6){
                url = "https://www.godesto.com/AdminApps/load_thingstodo?page_number=0&session_id=c578814d-a638-4e27-99a0-357c05a8497e_godesto&filter_by=brunches"
            }else if(index == 7){
                url = "https://www.godesto.com/AdminApps/load_thingstodo?page_number=0&session_id=8de78e22-1724-4725-8d01-1f86c2679baa_godesto&filter_by=outdoor"
            }else if(index == 8){
                url = " https://www.godesto.com/AdminApps/load_thingstodo?page_number=0&session_id=5340c5ce-a182-4434-8e3a-671cdf938f23_godesto&filter_by=bars"
            }else if(index == 9){
                url = " https://www.godesto.com/AdminApps/load_thingstodo?page_number=0&session_id=64343c28-cb6c-4ccb-b34f-8f01b9faab63_godesto&filter_by=sheesha"
            }else if(index == 10){
                url = "https://www.godesto.com/AdminApps/load_thingstodo?page_number=0&session_id=56aac9b3-7deb-4dee-b25d-08ebb54be1cf_godesto&filter_by=spa"
            }else{
                url = "https://www.godesto.com/AdminApps/load_thingstodo?page_number=0&session_id=b58f33f3-a9f4-4196-be8d-f1c662057472_godesto&filter_by=happy_hour"
            }
            
            let storyboard = UIStoryboard.init(name: StoryboardName.Home, bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.ThingsToDoListViewController) as? ThingsToDoListViewController{
                vc.url = url
                if(index == 2){
                    vc.isFromHome = false
                }else{
                    vc.isFromHome = true
                }
                if let container = self.mainContainer{
                    container.navigationbarHeight.constant = 44
                }
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
//MARK:- HOME INFO API
extension HomeViewController{
    func getHomeInfo()  {
        let requestMessage:RequestMessage? = RequestMessage()
        if let request = requestMessage{
            GCD.async(.Default){
                GCD.async(.Main, execute: {
                    if let container = self.mainContainer{
                        container.startActivity()
                    }
                })
                let service = HomeService()
                service.getHomeInfo(requestMessage: request, complete: { (responseMessage) in
                    GCD.async(.Main, execute: {
                        if let container = self.mainContainer{
                            container.stopActivity()
                        }
                    })
                    switch responseMessage.serviceResponseType {
                    case .Success:
                        GCD.async(.Main){
                            if let home = responseMessage.data as? HomeViewModel {
                                self.homeInfo = home
                                self.tblMenu?.reloadData()
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
extension HomeViewController:UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.txtSearchHome {
            if textField.text != "" {
                self.imgSearch?.alpha = 1.0
            }else {
                self.imgSearch?.alpha = 0.5
            }
        }
        return true
    }
    
}


