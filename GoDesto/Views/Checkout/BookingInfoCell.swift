//
//  BookingInfoCell.swift
//  GoDesto
//
//  Created by Le Abid on 19/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class BookingInfoCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    func setup(title: String, subtitle: String) {
        lblTitle.text = title
        lblSubtitle.text = subtitle
        
    }
    
    
    class func instance() -> BookingInfoCell {
        return Bundle.main.loadNibNamed(NIBName.BookingInfoCell, owner: nil, options: nil)?.first as! BookingInfoCell
    }
    
}
