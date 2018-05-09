//
//  PromeTableViewCell.swift
//  GoDesto
//
//  Created by Le Abid on 21/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class PromeTableViewCell: UITableViewCell {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var tfCode: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewContainer.layer.borderColor = UIColor.lightGray.cgColor
        viewContainer.layer.borderWidth = 1.0
        layoutIfNeeded()
        
    }
    
    class func instance() -> PromeTableViewCell {
        return Bundle.main.loadNibNamed(NIBName.PromeTableViewCell, owner: nil, options: nil)?.first as! PromeTableViewCell
    }
    
}
