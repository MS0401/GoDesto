//
//  ReviewTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 20/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class ReviewTableViewCell: BaseTableViewCell {
    @IBOutlet weak var viewBackground:UIView!
    @IBOutlet weak var imgUser:UIImageView!
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblRateing:UILabel!
    @IBOutlet weak var lblTime:UILabel!
    @IBOutlet weak var lblDetail:UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imgUser.layer.cornerRadius = 25
        self.imgUser.clipsToBounds = true
    }

    func  configureView(review:ReviewViewModel)  {
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
