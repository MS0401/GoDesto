//
//  HomeDetailFacilitiesCollectionViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 19/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HomeDetailFacilitiesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblName:UILabel?
    @IBOutlet weak var imgLogo:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureView(facility:FacilitiesViewModel)  {
        self.lblName?.text = facility.title
    
    }
}
