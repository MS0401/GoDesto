//
//  GolfDetailDescriptionTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 02/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol GolfDetailDescriptionDelegate:NSObjectProtocol {
    func actionCallBackShowMoreText()
}

class GolfDetailDescriptionTableViewCell: BaseTableViewCell {
    @IBOutlet weak var lblDetail:UILabel?
    @IBOutlet weak var lblLine:UILabel?
    @IBOutlet weak var btnMore:UIButton?
    @IBOutlet weak var lblMoreTitle:UILabel?
    @IBOutlet weak var imgIcon:UIImageView?

    var delegate:GolfDetailDescriptionDelegate?
    var detail:DescriptionViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureView(text:String)  {
        self.lblDetail?.text = text.htmlToString
    }
    
    func configureDetail(detail:DescriptionViewModel)  {
        self.detail = detail
        if(detail.isSelected){
            self.lblDetail?.numberOfLines = 0
            self.detail?.isSelected = false
            self.imgIcon?.image =  UIImage(named:"IconBackArrow")
            self.lblMoreTitle?.text = "Less"
        }else{
            self.lblDetail?.numberOfLines = 2
            self.imgIcon?.image = UIImage(named:"IconDownArrow")
            self.detail?.isSelected = true
            self.lblMoreTitle?.text = "More"
        }
        self.lblDetail?.text = detail.detail.htmlToString
        
    }
    
    @IBAction func actionShowMoreText(_ sender:UIButton){
        
        if(self.detail!.isSelected){
            self.detail?.isSelected = false
            self.imgIcon?.image =  UIImage(named:"IconBackArrow")
            self.lblMoreTitle?.text = "More"
        }else{
             self.imgIcon?.image = UIImage(named:"IconDownArrow")
            self.detail?.isSelected = true
            self.lblMoreTitle?.text = "Less"
        }
        self.configureDetail(detail: self.detail!)
        
        if let del = self.delegate{
            del.actionCallBackShowMoreText()
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
