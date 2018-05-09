//
//  SideMenuItemTableViewCell.swift
//  InsafiansPTI
//
//  Created by Ghafar Tanveer on 22/12/2017.
//  Copyright © 2017 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol SideMenuItemDelegate:NSObjectProtocol {
    func actionCallBackSelecteditem(section:Int)
}
class SideMenuItemTableViewCell: BaseTableViewCell {

    @IBOutlet weak var imgIcon:UIImageView?
    @IBOutlet weak var lblItemName:UILabel?
    @IBOutlet weak var lblLine:UILabel?
    @IBOutlet weak var lblSubItemName:UILabel?
    @IBOutlet weak var btnItem:UIButton?
    
    var delegate:SideMenuItemDelegate?
    var section:Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(item:[String:String],section:Int? = 0,isSubmenu:Bool? = false)  {
        self.section = section!
        if(isSubmenu!){
            self.lblSubItemName?.isHidden = false
            self.lblItemName?.isHidden = true
            self.imgIcon?.isHidden = true
            self.lblLine?.isHidden = true
            self.btnItem?.isHidden = true
//            self.imgIcon?.image = UIImage(named:item["image"]!)
        }else{
            self.lblItemName?.isHidden = false
            self.imgIcon?.isHidden = false
            self.lblSubItemName?.isHidden = true
            self.lblLine?.isHidden = false
            self.btnItem?.isHidden = false
//            self.imgIcon?.image = UIImage(named:item["image"]!)
        }
        
        //self.imgIcon?.image = UIImage(named:item["image"]!)
        self.lblItemName?.text = item["title"]
        self.lblSubItemName?.text = item["title"]
        if(self.lblItemName!.text!.isEmpty){
            self.lblItemName?.text = "Profile"
        }
    }
    

    @IBAction func actionSelectItem(_ sender:UIButton){
        if let del = self.delegate{
            del.actionCallBackSelecteditem(section: self.section)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
