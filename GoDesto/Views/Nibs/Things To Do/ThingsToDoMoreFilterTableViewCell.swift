//
//  ThingsToDoMoreFilterTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 13/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

protocol ThingsToDoMoreFilterDelegate:NSObjectProtocol {
    func actionCallBackShowSuboptions(index:Int)
    
}

class ThingsToDoMoreFilterTableViewCell: BaseTableViewCell {
    @IBOutlet weak var lblTitle:UILabel!
   
    @IBOutlet weak var btnIcon:UIButton!
    
    

    var option:ToDoFilterOptionViewModel?
    var isForOptions:Bool = false
    var index:Int = 0
    var delegate:ThingsToDoMoreFilterDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(option:ToDoFilterOptionViewModel)  {
        self.option = option
        self.lblTitle.text = option.title
        if(option.isSelected){
            self.btnIcon.setImage(UIImage(named:"IconCheckBox"), for: .normal)
        }else{
            self.btnIcon.setImage(UIImage(named:"IconUncheck"), for: .normal)
        }
    }
    
    @IBAction func actonSelectItem(_ sender:UIButton){
        if(self.option!.isSelected){
            self.option?.isSelected = false
        }else{
            self.option?.isSelected = true
        }
        self.configure(option: self.option!)
        
        if(self.isForOptions){
            if(self.option!.isHappyHour){
                if let del = self.delegate{
                    del.actionCallBackShowSuboptions(index: self.index)
                }
            }else if(self.option!.isLadiesNight){
                if let del = self.delegate{
                    del.actionCallBackShowSuboptions(index: self.index)
                }
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
