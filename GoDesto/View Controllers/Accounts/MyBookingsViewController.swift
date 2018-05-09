//
//  MyBookingsViewController.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 3/27/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class MyBookingsViewController: UIViewController {
    
    @IBOutlet weak var tblMyBookings:UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tblMyBookings.estimatedRowHeight = 155
        self.tblMyBookings.rowHeight = UITableViewAutomaticDimension
//        self.tblAccounts.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func actionBack(_ sender:UIButton){
        
        if let container = self.mainContainer{
            
            container.bottomViewHeight.constant = 60
        }
        self.navigationController?.popViewController(animated: true)
    }
}

extension MyBookingsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
//    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return UITableViewAutomaticDimension
//    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            return 250
            
        }else {
            
            return 151
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HotelTableViewCell, for: indexPath) as! HotelTableViewCell
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
