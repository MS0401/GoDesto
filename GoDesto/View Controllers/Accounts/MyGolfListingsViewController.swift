//
//  MyGolfListingsViewController.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 3/27/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class MyGolfListingsViewController: BaseViewController {
    
    @IBOutlet weak var tblMyGlofListing:UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tblMyGlofListing.estimatedRowHeight = 155
        self.tblMyGlofListing.rowHeight = UITableViewAutomaticDimension
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

extension MyGolfListingsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HotelTableViewCell, for: indexPath) as! HotelTableViewCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
