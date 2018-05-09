//
//  ThingsToDoDetailOverviewTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 12/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

protocol  ThingsToDoDetailOverviewDelegate:NSObjectProtocol{
    func actionCallBackSetList(tabs:ThingsToDoTabs)
}
class ThingsToDoDetailOverviewTableViewCell: UITableViewCell {

    @IBOutlet weak var btnOverview:UIButton?
    @IBOutlet weak var btnReview:UIButton?
    @IBOutlet weak var btnMenu:UIButton?
    @IBOutlet weak var lblOverview:UILabel?
    @IBOutlet weak var lblReview:UILabel?
    @IBOutlet weak var lblMenu:UILabel?
    
    var delegate:ThingsToDoDetailOverviewDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureView(tabs:ThingsToDoTabs)  {
        if(tabs == ThingsToDoTabs.Overview){
            self.btnOverview?.isSelected = true
            self.btnReview?.isSelected = false
            self.btnMenu?.isSelected = false
            self.lblOverview?.isHidden = false
            self.lblReview?.isHidden = true
            self.lblMenu?.isHidden = true
            //self.actionSetTabs(self.btnOverview!)
        }else if (tabs == ThingsToDoTabs.Review){
            self.btnReview?.isSelected = true
            self.btnOverview?.isSelected = false
            self.btnMenu?.isSelected = false
            self.lblReview?.isHidden = false
            self.lblOverview?.isHidden = true
            self.lblMenu?.isHidden = true
        }else{
            self.btnMenu?.isSelected = true
            self.btnOverview?.isSelected = false
            self.btnReview?.isSelected = false
            self.lblReview?.isHidden = true
            self.lblOverview?.isHidden = true
            self.lblMenu?.isHidden = false
        }
    }
    
    @IBAction func actionSetTabs(_ sender:UIButton){
        if(sender == self.btnOverview){
            if(!sender.isSelected){
                sender.isSelected = true
                self.btnReview?.isSelected = false
                self.btnMenu?.isSelected = false
                self.lblOverview?.isHidden = false
                self.lblReview?.isHidden = true
                self.lblMenu?.isHidden = true
                if let del = self.delegate{
                    del.actionCallBackSetList(tabs: ThingsToDoTabs.Overview)
                }
            }
        }else if(sender == self.btnReview){
            if(!sender.isSelected){
                sender.isSelected = true
                self.btnOverview?.isSelected = false
                self.btnMenu?.isSelected = false
                self.lblReview?.isHidden = false
                self.lblOverview?.isHidden = true
                self.lblMenu?.isHidden = true
                if let del = self.delegate{
                    del.actionCallBackSetList(tabs: ThingsToDoTabs.Review)
                }
            }
        }else{
            if(!sender.isSelected){
                sender.isSelected = true
                self.btnOverview?.isSelected = false
                self.btnReview?.isSelected = false
                self.lblReview?.isHidden = true
                self.lblOverview?.isHidden = true
                self.lblMenu?.isHidden = false
                if let del = self.delegate{
                    del.actionCallBackSetList(tabs: ThingsToDoTabs.Menu)
                }
            }
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
