//
//  MenuViewController.swift
//  Fooding
//
//  Created by Ghafar Tanveer on 03/08/2017.
//  Copyright © 2017 Ghafar Tanveer. All rights reserved.
//

import UIKit


class MenuViewController: BaseViewController{

    
    @IBOutlet weak var lblGreetings:UILabel!
    @IBOutlet weak var lblUserName:UILabel!
    @IBOutlet weak var btnSignuput:UIButton!
    
    @IBOutlet weak var tblMenuList:UITableView!
    let selectedImages=["loginimage","HomeIcon","IconHotel","ic_flight","ic_local_taxi","IconGolf","IconThingToDo","ic_fiber_new","ic_web"]
    var isHistorySelected:Bool? = false
    
    @IBAction func didTapSingout(sender:UIButton)  {
        
        Global.shared.login = nil
        
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: Global.shared.login ?? LoginViewModel())
        
        UserDefaults.standard.set(encodedData, forKey: LOGIN_KEY)
        UserDefaults.standard.set(false, forKey: KEEP_LOGIN)
        UserDefaults.standard.set(false, forKey: IS_USER_LOGIN)
        UserDefaults.standard.synchronize()
        
        _ = navigationController?.popToRootViewController(animated: true)

    }
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.tblMenuList.reloadData()
        
//        if (UserDefaults.standard.object(forKey:IS_USER_LOGIN) != nil){
        
        
        if let data = Global.shared.login
        {
            self.lblGreetings.text = "Welcome!"
//            print(data.firstName, data.lastName)
            self.lblUserName.text = data.firstName
            self.btnSignuput.isHidden = false
        }else {
         
            self.lblGreetings.text = "Greetings!"
            self.lblUserName.text = ""
            self.btnSignuput.isHidden = true
        }
        
    }
    func updateReferral() {
        self.tblMenuList.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}
extension MenuViewController:UITableViewDelegate,UITableViewDataSource,SideMenuItemDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return SideMenu.MenuList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 8){
            return SideMenu.SubMenuList.count
        }else{
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if UIDevice.current.userInterfaceIdiom == .pad {

            return 50
            
        }else {
            return 35
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            return 40
            
        }else {
            return 25
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if(section == 0){
//            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! SideMenuProfileTableViewCell
//            cell.configure()
//            return cell
//        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "menuListCell") as! SideMenuItemTableViewCell
            cell.delegate = self
        cell.imgIcon?.image = UIImage.init(named: selectedImages[section])
            cell.configure(item: SideMenu.MenuList[section],section: section)
            return cell
//        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if(indexPath.row == 0){
//            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! SideMenuProfileTableViewCell
//            cell.configure()
//            return cell
//        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "menuListCell", for: indexPath) as! SideMenuItemTableViewCell
            cell.configure(item: SideMenu.SubMenuList[indexPath.row],isSubmenu: true)
            return cell
       // }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let container = self.revealViewController().frontViewController as? MainContainerViewController{
            print("container exist \(container)")
            self.revealViewController().revealToggle(nil)
            if(indexPath.section == 8){
               if(indexPath.row == 0){
                    container.browserInfo = WebUrls.AboutUs
                    container.showBrowserController(controllerIdentifier: ControllerIdentifier.BrowserNavigationController, storyboardName: StoryboardName.Menu)
                
//                    if let container = self.mainContainer{
//                        container.navigationbarHeight.constant = 44
//                    }
//                    let storyboard = UIStoryboard.init(name: StoryboardName.Acccounts, bundle: nil)
//                    if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.AccountNavigationController) as? AccountsViewController{
//                        self.navigationController?.pushViewController(vc, animated: true)
//                    }
                }else if(indexPath.row == 1){
                    container.browserInfo = WebUrls.ContactUs
                    container.showBrowserController(controllerIdentifier: ControllerIdentifier.BrowserNavigationController, storyboardName: StoryboardName.Menu)
                }else if(indexPath.row == 2){
                    container.browserInfo = WebUrls.FAQ
                    container.showBrowserController(controllerIdentifier: ControllerIdentifier.BrowserNavigationController, storyboardName: StoryboardName.Menu)
                }else if(indexPath.row == 3){
                    container.browserInfo = WebUrls.TermsAndCondition
                    container.showBrowserController(controllerIdentifier: ControllerIdentifier.BrowserNavigationController, storyboardName: StoryboardName.Menu)
                }else if(indexPath.row == 4){
                    container.browserInfo = WebUrls.PrivacyPolicy
                    container.showBrowserController(controllerIdentifier: ControllerIdentifier.BrowserNavigationController, storyboardName: StoryboardName.Menu)
                }else if(indexPath.row == 5){
                
                    container.browserInfo = WebUrls.Security
                    container.showBrowserController(controllerIdentifier: ControllerIdentifier.BrowserNavigationController, storyboardName: StoryboardName.Menu)
                
//                    if let container = self.mainContainer{
//                        container.navigationbarHeight.constant = 44
//                    }
//                    let storyboard = UIStoryboard.init(name: StoryboardName.Golf, bundle: nil)
//                    if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.GolfNavigationController) as? GolfListingViewController{
//                        self.navigationController?.pushViewController(vc, animated: true)
//                    }
                }
            }
        }
        
        
        
        
        
    }
    func actionCallBackSelecteditem(section: Int) {
        
        if let container = self.revealViewController().frontViewController as? MainContainerViewController{
            print("container exist \(container)")
            self.revealViewController().revealToggle(nil)
            if(section == 0){
                
                if let data = Global.shared.login
                {
                    container.moveOnViewController(controllerIdentifier: ControllerIdentifier.AccountNavigationController, storyboardName: StoryboardName.Acccounts)
                    
                }else {
                
                    Global.shared.login = nil
                    
                    let encodedData = NSKeyedArchiver.archivedData(withRootObject: Global.shared.login ?? LoginViewModel())
                    
                    UserDefaults.standard.set(encodedData, forKey: LOGIN_KEY)
                    UserDefaults.standard.set(false, forKey: KEEP_LOGIN)
                    UserDefaults.standard.set(false, forKey: IS_USER_LOGIN)
                    UserDefaults.standard.synchronize()
                    
                    _ = navigationController?.popToRootViewController(animated: true)
                }
                
            }else if(section == 1){
                container.moveOnViewController(controllerIdentifier: ControllerIdentifier.HomeNavigationController, storyboardName: StoryboardName.Main)
            }else if(section == 2){
                container.moveOnViewController(controllerIdentifier: ControllerIdentifier.HotelSearchBaseNavigationController, storyboardName: StoryboardName.HotelSearch)
            }else if(section == 3){
                container.browserInfo = WebUrls.Flights
                container.showBrowserController(controllerIdentifier: ControllerIdentifier.BrowserNavigationController, storyboardName: StoryboardName.Menu)
            }else if(section == 5){
                container.moveOnViewController(controllerIdentifier: ControllerIdentifier.GolfNavigationController, storyboardName: StoryboardName.Golf)
            }else if(section == 4){
                container.browserInfo = WebUrls.CarHire
                container.showBrowserController(controllerIdentifier: ControllerIdentifier.BrowserNavigationController, storyboardName: StoryboardName.Menu)
            }else if(section == 8){
                container.browserInfo = WebUrls.Blogs
                container.showBrowserController(controllerIdentifier: ControllerIdentifier.BrowserNavigationController, storyboardName: StoryboardName.Menu)
            }else if(section == 9){
                container.browserInfo = WebUrls.AboutUs
                container.showBrowserController(controllerIdentifier: ControllerIdentifier.BrowserNavigationController, storyboardName: StoryboardName.Menu)
            }else if(section == 10){
                container.browserInfo = WebUrls.ContactUs
                container.showBrowserController(controllerIdentifier: ControllerIdentifier.BrowserNavigationController, storyboardName: StoryboardName.Menu)
            }else if(section == 11){
                container.browserInfo = WebUrls.FAQ
                container.showBrowserController(controllerIdentifier: ControllerIdentifier.BrowserNavigationController, storyboardName: StoryboardName.Menu)
            }else if(section == 12){
                container.browserInfo = WebUrls.TermsAndCondition
                container.showBrowserController(controllerIdentifier: ControllerIdentifier.BrowserNavigationController, storyboardName: StoryboardName.Menu)
            }else if(section == 13){
                container.browserInfo = WebUrls.PrivacyPolicy
                container.showBrowserController(controllerIdentifier: ControllerIdentifier.BrowserNavigationController, storyboardName: StoryboardName.Menu)
            }else if(section == 14){
                container.browserInfo = WebUrls.Security
                container.showBrowserController(controllerIdentifier: ControllerIdentifier.BrowserNavigationController, storyboardName: StoryboardName.Menu)
            }
        }
    }
    
    
    func moveTo(vc: String, inStoryboard stroryboard: String) {
        
        let rvc:SWRevealViewController = self.revealViewController()
        let storyboard: UIStoryboard = UIStoryboard(name: stroryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: vc) as! BaseNavigationController
        rvc.pushFrontViewController(controller, animated: true)
    }
    
    
  
}

