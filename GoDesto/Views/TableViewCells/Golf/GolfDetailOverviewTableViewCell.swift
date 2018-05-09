//
//  GolfDetailOverviewTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 02/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol  GolfDetailOverviewDelegate:NSObjectProtocol{
    func actionCallBackSetList(isOverviewSelected:Bool)
}
class GolfDetailOverviewTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var btnOverview:UIButton?
    @IBOutlet weak var btnReview:UIButton?
    @IBOutlet weak var lblOverview:UILabel?
    @IBOutlet weak var lblReview:UILabel?

    var delegate:GolfDetailOverviewDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureView(isOverview:Bool)  {
        if(isOverview){
            self.btnOverview?.isSelected = true
            self.btnReview?.isSelected = false
            self.lblOverview?.isHidden = false
            self.lblReview?.isHidden = true
            //self.actionSetTabs(self.btnOverview!)
        }else{
            self.btnReview?.isSelected = true
            self.btnOverview?.isSelected = false
            self.lblReview?.isHidden = false
            self.lblOverview?.isHidden = true
            //self.actionSetTabs(self.btnReview!)
        }
    }
    
    @IBAction func actionSetTabs(_ sender:UIButton){
        if(sender == self.btnOverview){
            if(!sender.isSelected){
                sender.isSelected = true
                self.btnReview?.isSelected = false
                self.lblOverview?.isHidden = false
                self.lblReview?.isHidden = true
                if let del = self.delegate{
                    del.actionCallBackSetList(isOverviewSelected: true)
                }
            }
        }else{
            if(!sender.isSelected){
                sender.isSelected = true
                self.btnOverview?.isSelected = false
                self.lblReview?.isHidden = false
                self.lblOverview?.isHidden = true
                if let del = self.delegate{
                    del.actionCallBackSetList(isOverviewSelected: false)
                }
            }
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
