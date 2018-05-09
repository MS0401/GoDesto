//
//  CheckoutActionCell.swift
//  GoDesto
//
//  Created by Le Abid on 21/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class CheckoutActionCell: UITableViewCell {

    @IBOutlet weak var btnCheckout: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    class func instance() -> CheckoutActionCell {
        return Bundle.main.loadNibNamed(NIBName.CheckoutActionCell, owner: nil, options: nil)?.first as! CheckoutActionCell
    }
    
}
