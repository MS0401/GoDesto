//
//  MyReviewsViewController.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 3/27/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class MyReviewsViewController: BaseViewController {
    @IBOutlet weak var tblReviewList:UITableView?
    
    var reviewList:[ReviewViewModel] = [ReviewViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.tblReviewList?.estimatedRowHeight = 130
        self.tblReviewList?.rowHeight = UITableViewAutomaticDimension
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
extension MyReviewsViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
        
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as! ReviewTableViewCell
        return cell
        
    }
    
}
