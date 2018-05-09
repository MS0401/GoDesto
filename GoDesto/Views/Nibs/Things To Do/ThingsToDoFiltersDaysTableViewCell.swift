//
//  ThingsToDoFiltersDaysTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 13/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol ThingsToDoFiltersDaysDelegate:NSObjectProtocol {
    func actionCallBackSetDays()
}
class ThingsToDoFiltersDaysTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var btnIcon:UIButton!
    @IBOutlet weak var txtBooking:UITextField!
    
    var day: ToDoFilterDayViewModel?
    var subOption:ToDoFilterSuboptionViewModel?
    var delegate:ThingsToDoFiltersDaysDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(day: ToDoFilterDayViewModel)  {
        self.day = day
        self.lblTitle.text = day.title
        self.txtBooking.text = day.timeInfo.selectedTitle
        if(day.isSelected){
            self.btnIcon.setImage(UIImage(named:"IconCheckBox"), for: .normal)
        }else{
            self.btnIcon.setImage(UIImage(named:"IconUncheck"), for: .normal)
        }
    }

    @IBAction func actonSelectItem(_ sender:UIButton){
        
        self.subOption!.setDays(day: self.day!)
        if(self.day!.isSelected){
            self.day?.isSelected = false
            self.day?.height = 40
        }else{
            self.day?.isSelected = true
            self.day?.height = 90
        }
        self.configure(day: self.day!)
        self.subOption!.setHeight()
        if let del = self.delegate{
            del.actionCallBackSetDays()
        }

        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ThingsToDoFiltersDaysTableViewCell:IQDropDownTextFieldDelegate{
    func textField(_ textField: IQDropDownTextField!, didSelectItem item: String!) {
            self.day?.timeInfo.selectedTitle = item
    }
}
