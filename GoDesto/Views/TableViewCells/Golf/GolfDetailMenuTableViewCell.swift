//
//  GolfDetailMenuTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 02/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol GolfDetailMenuDelegate:NSObjectProtocol {
    func actionCallBackShowSelectedItem(section:Int,isSelected:Bool)
}
class GolfDetailMenuTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var imgMenu:UIImageView?
    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var lblLine:UILabel?
    @IBOutlet weak var imgArrow:UIImageView?
    @IBOutlet weak var btnOption:UIButton?
    

    var section:Int = 0
    var delegate:GolfDetailMenuDelegate?
    var index:Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
   
    
    func configure(section:SectionViewModel,index:Int)  {
        self.lblTitle!.text = section.title
        self.section = index
        self.imgMenu?.image = UIImage(named:section.icon)
        if(section.isSelected){
            self.btnOption!.isSelected = true
            self.imgArrow!.image = UIImage(named:"IconDownArrow")
            self.lblLine!.isHidden = true
        }else{
            self.btnOption!.isSelected = false
            self.imgArrow!.image = UIImage(named:"IconBackArrow")
            self.lblLine!.isHidden = false
        }
    }
    
    func configureView(section:SectionViewModel,index:Int)  {
        self.index = index
        self.lblTitle?.text = section.title
        self.imgMenu?.image = UIImage(named:section.icon)
        if(section.isSelected){
            self.btnOption!.isSelected = true
            self.imgArrow!.image = UIImage(named:"IconDownArrow")
            self.lblLine!.isHidden = true
        }else{
            self.btnOption!.isSelected = false
            self.imgArrow!.image = UIImage(named:"IconBackArrow")
            self.lblLine!.isHidden = false
        }
    }
    

    
    @IBAction func actionSelectItem(_ sender:UIButton){
        if(sender.isSelected){
            sender.isSelected = false
            if let del = self.delegate{
                del.actionCallBackShowSelectedItem(section:self.section,isSelected:false)
            }
        }else{
            sender.isSelected = true
            if let del = self.delegate{
                del.actionCallBackShowSelectedItem(section:self.section,isSelected:true)
            }
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
