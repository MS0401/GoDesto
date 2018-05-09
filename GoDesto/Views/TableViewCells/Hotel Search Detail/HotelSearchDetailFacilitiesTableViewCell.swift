//
//  HotelSearchDetailFacilitiesTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 03/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HotelSearchDetailFacilitiesTableViewCell: BaseTableViewCell {

    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var lblTime:UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(title:String)  {
        self.lblTitle?.text = title
    }
    
    func configureView(time:OpeningTimesViewModel)  {
        self.lblTitle?.text = time.day
        self.lblTime?.text = time.fullTime
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
