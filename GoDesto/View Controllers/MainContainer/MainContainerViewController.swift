//
//  MainContainerViewController.swift
//  JayEat
//
//  Created by Ghafar Tanveer on 14/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
protocol TopBarDelegate:NSObjectProtocol {
    func actionCallBackMoveBack()
    func didSelectDateSuccessfully(date:Date)
    func actionSeletedDate(date:String,SelectedDate:Date)
    func actionCallbackShowMap()
}
extension TopBarDelegate{
    func actionCallBackMoveBack(){}
    func didSelectDateSuccessfully(date:Date){}
    func actionSeletedDate(date:String,SelectedDate:Date){}
    func actionCallbackShowMap(){}
}
class MainContainerViewController: BaseViewController,WWCalendarTimeSelectorProtocol {

    @IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
    @IBOutlet weak var navigationbarHeight: NSLayoutConstraint!
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var btnMap: UIButton!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var btnRestaurant: UIButton!
    @IBOutlet weak var btnOrder: UIButton!
    @IBOutlet weak var btnCheckout: UIButton!
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblRestaurant: UILabel!
    @IBOutlet weak var lblOrder: UILabel!
    @IBOutlet weak var lblMenuTitle: UILabel!
    @IBOutlet weak var lblCheckout: UILabel!
    @IBOutlet weak var imgSeprator: UIImageView!
    
    
    var delegate:TopBarDelegate?
    var browserInfo:[String:String] = [String:String]()
    fileprivate var singleDate: Date = Date()
    fileprivate var multipleDates: [Date] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        
//        self.showBackIcon(isAddMenu: true)

//        self.actionSetMenu(self.btnHome)

        
       self.navigationbarHeight.constant = 0
        self.showHomeScreen()
       // self.moveOnViewController(controllerIdentifier: ControllerIdentifier.HomeNavigationController, storyboardName: StoryboardName.Main)
    }
    func showBackIcon(isAddMenu:Bool? = false)  {
        if(isAddMenu!){
            self.btnMenu.removeTarget(nil, action: nil, for: .allEvents)
            self.btnMenu.isSelected = true
            self.btnMenu.setImage(UIImage(named:"MenuIcon"), for: .normal)
            self.btnMenu.setImage(UIImage(named:"MenuIcon"), for: .selected)
            self.addSideMenu(button: self.btnMenu)
        }else{
            self.btnMenu.removeTarget(nil, action: nil, for: .allEvents)
            self.btnMenu.isSelected = false
            self.btnMenu.setImage(UIImage(named:"BackIcon"), for: .normal)
            self.btnMenu.setImage(UIImage(named:"BackIcon"), for: .selected)
            self.btnMenu.addTarget(self, action: #selector(MainContainerViewController.actionBack(_:)), for: .touchUpInside)
        }
    }
    
    func showHomeScreen()  {
        self.navigationbarHeight.constant = 0
        let storyBoard = UIStoryboard(name: StoryboardName.Main, bundle: nil)
       let controller = storyBoard.instantiateViewController(withIdentifier: ControllerIdentifier.HomeNavigationController) as! BaseNavigationController
        addChildViewController(controller)
        controller.view.frame = self.viewContainer.bounds
        self.viewContainer.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
    }
    
    
    func showSettingsScreen()  {
        
        
        self.navigationbarHeight.constant = 0
        let storyBoard = UIStoryboard(name: StoryboardName.Settings, bundle: nil)
        let mainController = storyBoard.instantiateViewController(withIdentifier: ControllerIdentifier.SettingsNavigationController) as! BaseNavigationController
        
        let rightController = storyBoard.instantiateViewController(withIdentifier: ControllerIdentifier.CurrencyViewController) as! CurrencyViewController

        SlideMenuOptions.contentViewScale = 1.0
        SlideMenuOptions.rightViewWidth = self.viewContainer.bounds.width * 0.84
        let slideMenuController = SlideMenuController(mainViewController: mainController, leftMenuViewController: UIViewController(), rightMenuViewController: rightController)

        addChildViewController(slideMenuController)
        slideMenuController.view.frame = self.viewContainer.bounds
        self.viewContainer.addSubview(slideMenuController.view)
        slideMenuController.didMove(toParentViewController: self)
    }
    
    func showHotelSearchScreen()  {
        
        self.navigationbarHeight.constant = 0
        let storyBoard = UIStoryboard(name: StoryboardName.HotelSearch, bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: ControllerIdentifier.HotelSearchBaseNavigationController) as! BaseNavigationController
        addChildViewController(controller)
        controller.view.frame = self.viewContainer.bounds
        self.viewContainer.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
    }
    
    
    
    func moveOnViewController(controllerIdentifier:String,storyboardName:String) {
        let storyBoard = UIStoryboard(name: storyboardName, bundle: nil)
        var controller = BaseNavigationController()
        controller = storyBoard.instantiateViewController(withIdentifier: controllerIdentifier) as! BaseNavigationController
        addChildViewController(controller)
        controller.view.frame = self.viewContainer.bounds
        self.viewContainer.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
    }
    func showBrowserController(controllerIdentifier:String,storyboardName:String)  {
        let storyBoard = UIStoryboard(name: storyboardName, bundle: nil)
        var controller = BaseNavigationController()
        controller = storyBoard.instantiateViewController(withIdentifier: controllerIdentifier) as! BaseNavigationController
        if let vc = controller.topViewController as? BrowserViewController{
            vc.browerInfo = self.browserInfo
        }
        addChildViewController(controller)
        controller.view.frame = self.viewContainer.bounds
        self.viewContainer.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
    }
    
    func showDateTimeCalender(isDateShow:Bool? = false)  {
        
        let storyBoard = UIStoryboard(name: "WWCalendarTimeSelector", bundle: nil)
        let selector = storyBoard.instantiateViewController(withIdentifier: "WWCalendarTimeSelector")
        if let controller = selector as? WWCalendarTimeSelector{
            // let selector = UIStoryboard(name: "WWCalendarTimeSelector", bundle: nil).instantiateInitialViewController() as! WWCalendarTimeSelector
            controller.delegate = self
            controller.optionCurrentDate = singleDate
            controller.optionCurrentDates = Set(multipleDates)
            controller.optionCurrentDateRange.setStartDate(multipleDates.first ?? singleDate)
            controller.optionCurrentDateRange.setEndDate(multipleDates.last ?? singleDate)
            
            if(isDateShow!){
                controller.optionStyles.showDateMonth(true)
                controller.optionStyles.showMonth(false)
                controller.optionStyles.showYear(true)
                controller.optionStyles.showTime(false)
            }else{
                controller.optionStyles.showDateMonth(false)
                controller.optionStyles.showMonth(false)
                controller.optionStyles.showYear(false)
                controller.optionStyles.showTime(true)
            }
            
            present(controller, animated: true, completion: nil)
        }
    }
   
    
    func WWCalendarTimeSelectorDone(_ selector: WWCalendarTimeSelector, date: Date) {
        print("DONE")
        var dateString:String = ""
        dateString = Utilities.getStringFromDate(date: date)
        if let del = self.delegate{
            del.actionSeletedDate(date: dateString,SelectedDate:date)
        }
    }
    func WWCalendarTimeSelectorDone(_ selector: WWCalendarTimeSelector, dates: [Date]) {
        print("Selected Multiple Dates \n\(dates)\n---")
        if let date = dates.first {
        }
        else {
        }
        
    }

    @IBAction func actionSetMenu(_ sender:UIButton){
        
        if (sender.tag == 0){
            self.showHomeScreen()
        }else if (sender.tag == 1){
            self.showHotelSearchScreen()
        }else if (sender.tag == 2){
        }else if (sender.tag == 3){
            self.showSettingsScreen()
        }else if(sender.tag == 4){
        }
    }
    @IBAction func showMapSccreen(_ sender:UIButton){
        if let del = self.delegate{
            del.actionCallbackShowMap()
        }
    }
    @IBAction func actionBack(_ sender: UIButton){
        if let del = self.delegate{
            del.actionCallBackMoveBack()
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
