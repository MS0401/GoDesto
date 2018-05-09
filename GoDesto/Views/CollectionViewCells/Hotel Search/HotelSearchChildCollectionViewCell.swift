//
//  HotelSearchChildCollectionViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 03/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HotelSearchChildCollectionViewCell: BaseCollectionViewCell,IQDropDownTextFieldDelegate {
    
    
    @IBOutlet weak var txtChild:IQDropDownTextField?
    
    var child:ChildrenViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.txtChild?.itemList = DropDownList.ChildAges
        self.txtChild?.delegate = self
        self.addToolBarToPickerView(textField: self.txtChild!)
    }
    
    func configure(child:ChildrenViewModel)  {
        self.child = child
        self.txtChild?.text = "\(child.childAge)"
    }
    
    func textField(_ textField: IQDropDownTextField!, didSelectItem item: String!) {
        if(textField.text!.isEmpty){
            self.child?.childAge = 1
        }else{
            self.child?.childAge = Int(textField.text!)!
        }
    }
    
    
}
