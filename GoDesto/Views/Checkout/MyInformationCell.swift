//
//  MyInformationCell.swift
//  GoDesto
//
//  Created by Le Abid on 21/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
import BEMCheckBox

class MyInformationCell: UITableViewCell {
    
    @IBOutlet weak var viewTitle: OptionSelectionView!
    @IBOutlet weak var viewfirstName: TextInputView!
    @IBOutlet weak var viewLastName: TextInputView!
    @IBOutlet weak var vieeEmailAddress: TextInputView!
    @IBOutlet weak var viewTelephone: TextInputView!
    @IBOutlet weak var viewCountry: OptionSelectionView!
    @IBOutlet weak var viewRegion: TextInputView!
    @IBOutlet weak var viewCity: TextInputView!
    @IBOutlet weak var viewStreetAddress: TextInputView!
    @IBOutlet weak var viewZipCode: TextInputView!
    
    @IBOutlet weak var viewCheckbox: BEMCheckBox!
    @IBOutlet weak var lblTerms: UILabel!
    
    var onTap: (() -> ())? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCheckbox.delegate = self
        viewCheckbox.boxType = .square
        viewCheckbox.tintColor = UIColor(red: 41.0/255.0, green: 107.0/255.0, blue: 162.0/255.0, alpha: 1.0)
        viewCheckbox.onTintColor = UIColor(red: 41.0/255.0, green: 107.0/255.0, blue: 162.0/255.0, alpha: 1.0)
        viewCheckbox.onCheckColor = UIColor(red: 41.0/255.0, green: 107.0/255.0, blue: 162.0/255.0, alpha: 1.0)
        viewCheckbox.onFillColor = .white
        viewCheckbox.offFillColor = .white
    }
    
    func setup(userInfo: CurrentUserInformation) {
    
        viewTitle.setup(title: userInfo.titleInfo.title, value: userInfo.titleInfo.subtitle)
        viewfirstName.setup(title: userInfo.firstNameInfo.title, value: userInfo.firstNameInfo.subtitle)
        viewLastName.setup(title: userInfo.lastNameInfo.title, value: userInfo.lastNameInfo.subtitle)
        vieeEmailAddress.setup(title: userInfo.emailInfo.title, value: userInfo.emailInfo.subtitle)
        viewTelephone.setup(title: userInfo.telephoneInfo.title, value: userInfo.telephoneInfo.subtitle)
        viewCountry.setup(title: userInfo.countryInfo.title, value: userInfo.countryInfo.subtitle)
        viewRegion.setup(title: userInfo.regionInfo.title, value: userInfo.regionInfo.subtitle)
        viewCity.setup(title: userInfo.cityInfo.title, value: userInfo.cityInfo.subtitle)
        viewStreetAddress.setup(title: userInfo.streetInfo.title, value: userInfo.streetInfo.subtitle)
        viewZipCode.setup(title: userInfo.zipCodeInfo.title, value: userInfo.zipCodeInfo.subtitle)
        
        viewCheckbox.setOn(userInfo.isOwnBooking, animated: false)
    }
    
    class func instance() -> MyInformationCell {
        return Bundle.main.loadNibNamed(NIBName.MyInformationCell, owner: nil, options: nil)?.first as! MyInformationCell
    }
    
}

extension MyInformationCell: BEMCheckBoxDelegate {
    func didTap(_ checkBox: BEMCheckBox) {
        if let tapClosure = self.onTap {
            tapClosure()
        }
    }
}
