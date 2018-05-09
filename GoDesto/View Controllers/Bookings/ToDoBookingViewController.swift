//
//  ToDoBookingViewController.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 4/12/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class ToDoBookingViewController: BaseViewController, TopBarDelegate {

    @IBOutlet weak var tblSlider:UITableView?
    var sliderCell:HotelSearchDetailSliderTableViewCell?
    var hotelDetail:HotelDetailViewModel?
    
    @IBOutlet weak var lblBookingToDoName: UILabel!
    
    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtNoOfGuests: UITextField!
    @IBOutlet weak var txtTime: UITextField!
    @IBOutlet weak var txtPreferredTime: UITextField!
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmailAddress: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    
    @IBOutlet weak var tblSpecialRequest: UITableView!
    
    @IBOutlet weak var txtVExtraRequests: UITextView!
    
    @IBAction func didTapCalculateCost(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        self.tblSlider!.register(UINib(nibName: NIBName.HotelSearchDetailSliderTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.HotelSearchDetailSliderTableViewCell)
//
//        self.tblSlider?.estimatedRowHeight = 43
//        self.tblSlider?.estimatedSectionHeaderHeight = 5
//        self.tblSlider?.sectionHeaderHeight = UITableViewAutomaticDimension
//        self.tblSlider?.rowHeight = UITableViewAutomaticDimension
        
        self.tblSlider?.delegate = self
        self.tblSlider?.dataSource = self
        
//        self.tblSpecialRequest?.delegate = self
//        self.tblSpecialRequest?.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let container = self.mainContainer{
            
            container.showBackIcon()
            container.lblSubTitle.isHidden = true
            container.lblTitle.text = "Booking"
            container.lblSubTitle.text = ""
            container.delegate = self
            container.btnMap.isHidden = true
        }
        
        self.txtDate.layer.borderColor = UIColor.lightGray.cgColor
        self.txtNoOfGuests.layer.borderColor = UIColor.lightGray.cgColor
        self.txtTime.layer.borderColor = UIColor.lightGray.cgColor
        self.txtPreferredTime.layer.borderColor = UIColor.lightGray.cgColor
        self.txtFirstName.layer.borderColor = UIColor.lightGray.cgColor
        self.txtLastName.layer.borderColor = UIColor.lightGray.cgColor
        self.txtEmailAddress.layer.borderColor = UIColor.lightGray.cgColor
        self.txtPhoneNumber.layer.borderColor = UIColor.lightGray.cgColor
        
        self.txtDate.layer.borderWidth = 1.0
        self.txtNoOfGuests.layer.borderWidth = 1.0
        self.txtTime.layer.borderWidth = 1.0
        self.txtPreferredTime.layer.borderWidth = 1.0
        self.txtFirstName.layer.borderWidth = 1.0
        self.txtLastName.layer.borderWidth = 1.0
        self.txtEmailAddress.layer.borderWidth = 1.0
        self.txtPhoneNumber.layer.borderWidth = 1.0
        
        self.txtVExtraRequests.layer.borderColor = UIColor.lightGray.cgColor
        self.txtVExtraRequests.layer.borderWidth = 1.0
    }

    func actionCallBackMoveBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ToDoBookingViewController:UITableViewDelegate,UITableViewDataSource{
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == self.tblSlider){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoBookingSliderCustomCell", for: indexPath)  as UITableViewCell
            return cell
        }else if (tableView == self.tblSpecialRequest){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpecialRequestCustomTableCell", for: indexPath)  as UITableViewCell
                return cell
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)  as UITableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if (tableView == self.tblSlider){
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                return 490
            }else {
                return 390
            }
        }else if (tableView == self.tblSpecialRequest){
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                return 70
            }else {
                return 40
            }
        }else {
            
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (tableView == self.tblSlider){
            
            return 1
            
        }else if (tableView == self.tblSpecialRequest){
            
            return 3
            
        }else {
            
            return 0
        }
    }
}
