//
//  BusinessScreenVIewModel.swift
//  GoDesto
//
//  Created by Sohail on 01/05/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
import CFAlertViewController


class BusinessScreenViewModel: NSObject {
    private var businessDetailList : [BusinessInfoDetailModel] = []
    weak var viewController : BusinessViewController?
    
    override init()
    {
        super.init()
        self.initViewModel()
    }
    
    convenience init(vc : BusinessViewController)
    {
        self.init()
        self.viewController = vc
        
    }
    func initViewModel()
    {
        businessDetailList = []
        var title = "Business godesto";
        var detail : String = "\ngodesto.com provides a complete solution to those wanting to book hotels, car hire, entertainment, restaurants, golf and events in the UAE.\n\nJoin and feature your business or event for free to the thousands of customers visiting godesto.com and start receiving booking enquiries via the automated notification system."
        var businessInfoModel = BusinessInfoDetailModel(title: title,detail: detail)
        businessDetailList.append(businessInfoModel)
        
        
        title = "Who should join?";
        detail = "\nAre you based in the UAE and is your company in the hospitality, entertainment, activities or food & beverage industry?\n\nIf yes, joining godesto makes common sense."
        businessInfoModel = BusinessInfoDetailModel(title: title,detail: detail)
        businessDetailList.append(businessInfoModel)
        
        title = "HD images";
        detail = "\n Upload your high definition images to attract customers.\n\nText or Description\nWrite your own accurate descriptions\n\nVouchers\nWhat vouchers and discount promotions do you accept?\n\nOpening timings, Happy hours & Ladies Nights Promotions?\nGiving your customers information on Opening Timings, Happy Hour and Ladies Nights Promotions, make it easy to decide where to go next"
        businessInfoModel = BusinessInfoDetailModel(title: title,detail: detail)
        businessDetailList.append(businessInfoModel)
        
        title = "How does it work?";
        detail = "\nCustomers visiting godesto can plan a complete vacation experience around the godesto trip planner. They can arrange when and where they want to go, selecting from the businesses, venues, and events featured on the website. If selected, an automated intelligent email is sent to your business, whereby you simply check availability and select the ‘confirm button’ within the email. The customer is notified of the booking along with automated options to amend the booking if required. There are no complicated interfaces with your own booking system, and requires no training of your staff."
        businessInfoModel = BusinessInfoDetailModel(title: title,detail: detail)
        businessDetailList.append(businessInfoModel)
        
        title = "Who should join?";
        detail = "\nAre you based in the UAE and is your company in the hospitality, entertainment, activities or food & beverage industry?\n\nIf yes, joining godesto makes common sense."
        businessInfoModel = BusinessInfoDetailModel(title: title,detail: detail)
        businessDetailList.append(businessInfoModel)
    }
    
    func handleBusinessGODestoButtonPressed() {
        openDailoge(title: businessDetailList[0].title, detail: businessDetailList[0].detail)
    }
    
    func handleIsItFreeButtonPressed() {
        openDailoge(title: businessDetailList[1].title, detail: businessDetailList[1].detail)
    }
    
    func handleBeInControlButtonPressed() {
        openDailoge(title: businessDetailList[2].title, detail: businessDetailList[2].detail)
    }
    
    func handleHowDoesItWorkPressed() {
        openDailoge(title: businessDetailList[3].title, detail: businessDetailList[3].detail)

    }
    
    func handleJoiningIsQuickPressed() {
        openDailoge(title: businessDetailList[4].title, detail: businessDetailList[4].detail)

    }
    
    
    func openDailoge(title : String , detail : String)
    {
        // Create Alet View Controller
        let alertController = CFAlertViewController(title: title,
                                                    message: detail,
                                                    textAlignment: .center,
                                                    preferredStyle: .alert,
                                                    didDismissAlertHandler: nil)
        
        // Create Upgrade Action
        let defaultAction = CFAlertAction(title: "              Close              ",
                                          style: .Default,
                                          alignment: .center,
                                          backgroundColor: UIColor(red: CGFloat(211.0 / 255.0), green: CGFloat(54.0 / 255.0), blue: CGFloat(51.0 / 255.0), alpha: CGFloat(1)),
                                          textColor: nil,
                                          handler: { (action) in
        })
        
        // Add Action Button Into Alert
        alertController.addAction(defaultAction)
        
        // Present Alert View Controller
        self.viewController?.present(alertController, animated: true, completion: nil)
    }
    
    

}
