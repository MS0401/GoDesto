//
//  HomeSliderPopularItemCollectionViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 17/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HomeSliderPopularItemCollectionViewCell: BaseCollectionViewCell {
    @IBOutlet weak var imgItem:UIImageView?
    @IBOutlet weak var lblName:UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.lblName?.text = "Solero topas & bodega"
    }
    
    func configureView(info:HomeInfoViewModel) {
        self.lblName?.text = info.name
        self.setImageWithUrl(imageView: self.imgItem!, url: BASE_PHOTO_URL + info.coverPhoto)
        //self.lblName?.text = "Solero topas & bodega"
    }
    
}
