//
//  GolfDetailCourseFeeTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 02/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class GolfDetailCourseFeeTableViewCell: BaseTableViewCell {

    @IBOutlet weak var lblDateTitle:UILabel?
    @IBOutlet weak var lblDate:UILabel?
    @IBOutlet weak var lblTimeTitle:UILabel?
    @IBOutlet weak var lblTime:UILabel?
    @IBOutlet weak var lblPriceTitle:UILabel?
    @IBOutlet weak var lblPrice:UILabel?
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
