//
//  ThingsToDoBookingTimeTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 13/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class ThingsToDoBookingTimeTableViewCell: UITableViewCell {

    @IBOutlet weak var txtBooking:IQDropDownTextField?
    
    var time:ToDoFilterTimeViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    func configure(time:ToDoFilterTimeViewModel) {
        self.time = time
        self.txtBooking?.text = time.selectedTitle
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ThingsToDoBookingTimeTableViewCell:IQDropDownTextFieldDelegate{
    func textField(_ textField: IQDropDownTextField!, didSelectItem item: String!) {
        if(item.isEmpty){
           self.time?.isSelected = false
            self.time?.selectedTitle = item
        }else{
            self.time?.isSelected = true
            self.time?.selectedTitle = item
        }
    }
}
