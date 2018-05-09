//
//  SideMenuProfileTableViewCell.swift
//  InsafiansPTI
//
//  Created by Ghafar Tanveer on 22/12/2017.
//  Copyright © 2017 Ghafar Tanveer. All rights reserved.
//

import UIKit

class SideMenuProfileTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var imgProfile:UIImageView?
    @IBOutlet weak var lblName:UILabel?
    @IBOutlet weak var lblEmail: UILabel?
    @IBOutlet weak var lblSeprator: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.imgProfile?.layer.cornerRadius = 30
        self.imgProfile?.clipsToBounds = true
    }

    func configure()  {
        
        self.lblName?.text = "Ghafar Tanveer"
        self.lblEmail?.text = "ghafartanveer@gmail.com"
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
