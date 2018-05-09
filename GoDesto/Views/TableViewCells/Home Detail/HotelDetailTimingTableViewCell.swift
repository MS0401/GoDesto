//
//  HotelDetailTimingTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 20/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HotelDetailTimingTableViewCell: BaseTableViewCell {

    @IBOutlet weak var lblDay:UILabel!
    @IBOutlet weak var lblTime:UILabel!
    @IBOutlet weak var lblLine:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func  configureView(timing:OpeningTimesViewModel)  {
        self.lblDay.text = timing.day
        self.lblTime.text = timing.time
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
