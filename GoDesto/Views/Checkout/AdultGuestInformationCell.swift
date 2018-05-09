//
//  AdultGuestInformationCell.swift
//  GoDesto
//
//  Created by Le Abid on 21/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class AdultGuestInformationCell: UITableViewCell {
    
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var viewTitle: OptionSelectionView!
    @IBOutlet weak var viewfirstName: TextInputView!
    @IBOutlet weak var viewLastName: TextInputView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(userInfo: AdultInformation, number: Int) {
        lblNumber.text = "Adult \(number+1)"
        viewTitle.setup(title: userInfo.titleInfo.title, value: userInfo.titleInfo.subtitle)
        viewfirstName.setup(title: userInfo.firstNameInfo.title, value: userInfo.firstNameInfo.subtitle)
        viewLastName.setup(title: userInfo.lastNameInfo.title, value: userInfo.lastNameInfo.subtitle)
    }


    class func instance() -> AdultGuestInformationCell {
        return Bundle.main.loadNibNamed(NIBName.AdultGuestInformationCell, owner: nil, options: nil)?.first as! AdultGuestInformationCell
    }
    
}
