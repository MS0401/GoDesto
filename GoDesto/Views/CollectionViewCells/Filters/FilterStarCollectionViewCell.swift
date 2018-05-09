//
//  FilterStarCollectionViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 21/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class FilterStarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgStar:UIImageView?
    @IBOutlet weak var viewBackground:UIView?
    @IBOutlet weak var btnOption:UIButton?
    
    var star:FilterStarsViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
       // self.viewBackground?.layer.borderWidth = 0.5
        //self.viewBackground?.layer.borderColor = UIColor.gray.cgColor
       // self.viewBackground?.layer.cornerRadius = 5
    }
    func  configure(star:FilterStarsViewModel)  {
        self.star = star
        if(star.isSelected){
            self.imgStar?.image = UIImage(named:star.imageSelected)
        }else{
            self.imgStar?.image = UIImage(named:star.imageDefault)
        }
    }
    
    @IBAction func actionSelectStar(_ sender:UIButton){
        if(self.star!.isSelected){
            self.imgStar!.image = UIImage(named:self.star!.imageDefault)
            self.star?.isSelected = false
        }else{
            self.imgStar!.image = UIImage(named:self.star!.imageSelected)
            self.star?.isSelected = true
        }
    }
}
