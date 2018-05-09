//
//  HomeSliderCollectionViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 17/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HomeSliderCollectionViewCell: BaseCollectionViewCell,UIScrollViewDelegate {
    
    @IBOutlet weak var imgSlider:UIImageView!
    @IBOutlet weak var viewInfo:UIView!
    @IBOutlet weak var viewOverLay:UIView!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblSubtitle:UILabel!
 
    
    func configure(image:String)  {
        self.imgSlider.image = UIImage(named: image)
    }
    func configureView(image:String)  {
        self.viewInfo.isHidden = true
        self.setImageWithUrl(imageView: self.imgSlider, url: image)
    }
    
    func configureImage(image:String)  {
        self.viewOverLay.isHidden = false
        self.viewInfo.isHidden = true
        self.setImageWithUrl(imageView: self.imgSlider, url: BASE_PHOTO_URL + image)
    }
    
    func configureMenuImage(image:String)  {
        
        self.viewInfo.isHidden = true
        self.setImageWithUrl(imageView: self.imgSlider!, url: BASE_PHOTO_URL + image)
    }
    
    
    
    
    func configureData(image:LandingImageViewModel)  {
        self.setImageWithUrl(imageView: self.imgSlider, url: image.imageUrl)
        self.lblTitle.text = image.title
        self.lblSubtitle.text = image.subTitle
        
    }

}
