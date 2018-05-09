//
//  ImageCollectionViewCell.swift
//  Fooding
//
//  Created by Ghafar Tanveer on 03/08/2017.
//  Copyright © 2017 Ghafar Tanveer. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var imgFooding:UIImageView!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblSubtitle:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(image:LandingImageViewModel)  {
        self.setImageWithUrl(imageView: self.imgFooding, url: image.imageUrl)
        self.lblTitle.text = image.title
        self.lblSubtitle.text = image.subTitle
    }
}
