//
//  HotelSearchChildCollectionViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 03/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HotelSearchChildCollectionViewCell: BaseCollectionViewCell {
    
    
    @IBOutlet weak var txtChild:IQDropDownTextField?
    
    var child:ChildrenViewModel
    override func awakeFromNib() {
        super.awakeFromNib()
        self.txtChild?.itemList = DropDownList.ChildAges
        self.addToolBarToPickerView(textField: self.txtChild!)
    }
    
    func configure(child:ChildrenViewModel)  {
        self.txtChild?.text = "\(child.childAge)"
    }
    
    
}
