//
//  HomeDetailOverviewTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 20/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HomeDetailOverviewTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var lblDetail:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureView(overview:OverviewViewModel)  {
        self.lblDetail.text = overview.detail
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
