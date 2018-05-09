//
//  RestaurantTableViewCell.swift
//  JayEat
//
//  Created by Ghafar Tanveer on 15/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
import Cosmos

class RestaurantTableViewCell: BaseTableViewCell {
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var viewRating: CosmosView!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblMin: UILabel!
    @IBOutlet weak var lblDelivery: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.viewBackground.layer.borderWidth = 1
        self.viewBackground.layer.borderColor = UIColor.lightGray.cgColor
        self.viewBackground.layer.cornerRadius = 8
        self.imgLogo.layer.cornerRadius = 50
        self.imgLogo.clipsToBounds = true
        
    }
    
    func configure() {
        self.lblName.text = "Khyber Chersi Tikka"
        self.viewRating.rating = 5.0
        self.lblStatus.text = "Takeaway"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
