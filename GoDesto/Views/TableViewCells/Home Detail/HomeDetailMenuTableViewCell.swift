//
//  HomeDetailMenuTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 20/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

protocol HomeDetailMenuDelegate:NSObjectProtocol {
    func  actionCallBackSelectOption(isSelected:Bool,index:Int)
}
class HomeDetailMenuTableViewCell: BaseTableViewCell {

    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblLine:UILabel!
    @IBOutlet weak var lblReview:UILabel!
    @IBOutlet weak var imgArrow:UIImageView!
    @IBOutlet weak var btnOption:UIButton!
    
    var delegate:HomeDetailMenuDelegate?
    var index:Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(section:SectionViewModel,index:Int,isRatingCell:Bool? = false)  {
        self.lblTitle.text = section.title
        self.index = index
        if(isRatingCell!){
            self.lblReview.isHidden = false
            self.lblTitle.textColor = UIColor.blue
        }else{
            self.lblReview.isHidden = true
            self.lblTitle.textColor = UIColor.black
        }
        if(section.isSelected){
            self.btnOption.isSelected = true
            self.imgArrow.image = UIImage(named:"IconDownArrow")
            self.lblLine.isHidden = true
        }else{
            self.btnOption.isSelected = false
            self.imgArrow.image = UIImage(named:"IconBackArrow")
            self.lblLine.isHidden = false
        }
    }
    
    @IBAction func actionSelectOption(_ sender:UIButton){
        if(sender.isSelected){
            sender.isSelected = false
            if let del = self.delegate{
                del.actionCallBackSelectOption(isSelected: sender.isSelected,index: self.index)
            }
        }else{
            sender.isSelected = true
            if let del = self.delegate{
                del.actionCallBackSelectOption(isSelected: sender.isSelected,index: self.index)
            }

        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
