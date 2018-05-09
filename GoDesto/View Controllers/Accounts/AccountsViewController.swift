//
//  AccountsViewController.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 3/27/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class AccountsViewController: BaseViewController {
    
    @IBOutlet weak var tblAccounts:UITableView!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tblAccounts.estimatedRowHeight = 40
        self.tblAccounts.rowHeight = UITableViewAutomaticDimension

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func actionBack(_ sender:UIButton){
       
        if let container = self.mainContainer{
            container.navigationbarHeight.constant = 44
        }
        
        if let container = self.mainContainer{
        
            container.bottomViewHeight.constant = 60
        }
        self.navigationController?.popViewController(animated: true)
    }
}

let accountStaticArray=["Muhammad Shahab","Edit Profile","Favorites","Reviews","Bookings","Golf & Activities"]
let subTitleArray=["shahab@gmail.com"]
let imagesArray=[#imageLiteral(resourceName: "loginimage"),#imageLiteral(resourceName: "Referral"),#imageLiteral(resourceName: "heart"),#imageLiteral(resourceName: "ic_rate_review"),#imageLiteral(resourceName: "ic_confirmation_number"),#imageLiteral(resourceName: "IconGolf")]

extension AccountsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
     
        return 1
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return 100
        }else {
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return accountStaticArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.AccountMenuItemTableViewCell, for: indexPath) as! AccountsTableViewCell
            
            if let data = Global.shared.login
            {
                cell.lblTitle.text = "\(data.firstName)" + " " + "\(data.lastName)"
                cell.lblSubTitle.text = data.email
            }
//            cell.lblTitle.text = accountStaticArray[indexPath.row] as String
//            cell.lblSubTitle.text = subTitleArray[indexPath.row] as String
            cell.imgIcon.image = imagesArray[indexPath.row]
            return cell
            
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.AccountMenuItemShortTableViewCell, for: indexPath) as! AccountsTableViewCell
            cell.lblTitle.text = accountStaticArray[indexPath.row] as String
            cell.imgIcon.image = imagesArray[indexPath.row]
            return cell
        }
        
    }
    
//    static let MyFavoritesViewController = "MyFavorites_VC_SB"
//    static let MyBookingViewController = "MyBookings_VC_SB"
//    static let MyGolfListingViewController = "MyGolfListings_VC_SB"

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
            
        case 1:
            let storyboard = UIStoryboard.init(name: StoryboardName.Acccounts, bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "EditProfile_VC_SB") as? EditProfileViewController{
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case 2:
            let storyboard = UIStoryboard.init(name: StoryboardName.Acccounts, bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "MyFavorites_VC_SB") as? MyFavoritesViewController{
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case 3:
            let storyboard = UIStoryboard.init(name: StoryboardName.Acccounts, bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "MyReviews_VC_SB") as? MyReviewsViewController{
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case 4:
            let storyboard = UIStoryboard.init(name: StoryboardName.Acccounts, bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "MyBookings_VC_SB") as? MyBookingsViewController{
                self.navigationController?.pushViewController(vc, animated: true)
            }
        case 5:
            let storyboard = UIStoryboard.init(name: StoryboardName.Acccounts, bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "MyGolfListings_VC_SB") as? MyGolfListingsViewController{
                self.navigationController?.pushViewController(vc, animated: true)
            }
        default:
            print("nothign")
        }
    }
}
