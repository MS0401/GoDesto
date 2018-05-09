//
//  CheckoutPriceCell.swift
//  GoDesto
//
//  Created by Le Abid on 21/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class CheckoutPriceCell: UITableViewCell {

    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblPriceDisclaimer: UILabel!
    @IBOutlet weak var viewAdditionalInfo: UIView!
    @IBOutlet weak var lblAdditionalInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewAdditionalInfo.layer.borderColor = UIColor.lightGray.cgColor
        viewAdditionalInfo.layer.borderWidth = 1.0
        layoutIfNeeded()
    }
    
    func setup(priceModel: PreCheckoutViewModel) {
        
        lblPrice.text = "Total price: \(priceModel.currency) \(priceModel.price)"
        lblPriceDisclaimer.text = "*" + priceModel.taxIncludedText
        lblAdditionalInfo.text = priceModel.cancelationText
        
    }
    
    class func instance() -> CheckoutPriceCell {
        return Bundle.main.loadNibNamed(NIBName.CheckoutPriceCell, owner: nil, options: nil)?.first as! CheckoutPriceCell
    }
}
