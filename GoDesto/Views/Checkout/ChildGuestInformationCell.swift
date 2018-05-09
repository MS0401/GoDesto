//
//  ChildGuestInformationCell.swift
//  GoDesto
//
//  Created by Le Abid on 21/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class ChildGuestInformationCell: UITableViewCell {

    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var viewfirstName: TextInputView!
    @IBOutlet weak var viewLastName: TextInputView!
    @IBOutlet weak var viewAge: OptionSelectionView!
    
    func setup(userInfo: ChildInformation, number: Int) {
        lblNumber.text = "Child \(number+1)"
        viewAge.setup(title: userInfo.ageInfo.title, value: userInfo.ageInfo.subtitle)
        viewfirstName.setup(title: userInfo.firstNameInfo.title, value: userInfo.firstNameInfo.subtitle)
        viewLastName.setup(title: userInfo.lastNameInfo.title, value: userInfo.lastNameInfo.subtitle)
    }

    class func instance() -> ChildGuestInformationCell {
        return Bundle.main.loadNibNamed(NIBName.ChildGuestInformationCell, owner: nil, options: nil)?.first as! ChildGuestInformationCell
    }
    
}
