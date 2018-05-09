
//
//  FilterCuisineCollectionViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 23/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class FilterCuisineCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgLogo:UIImageView?
    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var viewBackground:UIView?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgLogo?.layer.cornerRadius = 5
        self.imgLogo?.layer.borderWidth = 0.5
        self.imgLogo?.layer.borderColor = UIColor.gray.cgColor
    }
    
    func configure(option:FilterOptionViewModel)  {
        self.lblTitle?.text = option.name
        
    }
    
    
}
