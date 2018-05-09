//
//  GolfDetailFacilitiesTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 02/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class GolfDetailFacilitiesTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var lblDetail:UILabel?
    @IBOutlet weak var lblLine:UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
