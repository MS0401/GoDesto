
//
//  GolfTickerCollectionViewCell.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 3/30/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class GolfTickerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ImgICon:UIImageView?
    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var lblName:UILabel?

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(option:FilterOptionViewModel)  {
        if(option.image.isEmpty){
            self.ImgICon?.isHidden = true
            self.lblName?.isHidden = false
        }else{
            self.ImgICon?.isHidden = false
            self.lblName?.isHidden = true
        }
        self.ImgICon?.image = UIImage(named:option.image)
        self.lblTitle?.text = option.title
        self.lblName?.text = option.name
    }
    func configureOption(option:FilterOptionViewModel)  {
        self.ImgICon?.image = UIImage(named:option.image)
        self.lblTitle?.isHidden = true
        self.lblName?.isHidden = true
    }
}
