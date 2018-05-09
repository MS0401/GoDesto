//
//  AccountsTableViewCell.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 3/27/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class AccountsTableViewCell: BaseTableViewCell {

    @IBOutlet weak var imgIcon:UIImageView!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblSubTitle:UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.imgIcon.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
