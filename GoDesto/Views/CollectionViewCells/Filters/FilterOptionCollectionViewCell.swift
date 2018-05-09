//
//  FilterOptionCollectionViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 21/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class FilterOptionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgOption:UIImageView?
    @IBOutlet weak var viewLayer:UIView?
    @IBOutlet weak var viewBackground:UIView?
    @IBOutlet weak var btnOption:UIButton?
    @IBOutlet weak var lblOption:UILabel?
    
    var option:FilterOptionViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewBackground?.layer.cornerRadius = 10
    }
    
    func configure(option:FilterOptionViewModel)  {
        self.option = option
        if(option.isSelected){
            self.imgOption?.image = UIImage(named:option.imageSelected)
            self.lblOption?.textColor = UIColor.black
        }else{
            self.imgOption?.image = UIImage(named:option.imageDefault)
            self.lblOption?.textColor = UIColor.white
        }
        self.lblOption?.text = option.name
        
    }
    
    @IBAction func actionSelectOption(_ sender:UIButton){
        if(self.option!.isSelected){
            self.imgOption!.image = UIImage(named:self.option!.imageDefault)
            self.lblOption?.textColor = UIColor.white
            self.option?.isSelected = false
        }else{
            self.imgOption!.image = UIImage(named:self.option!.imageSelected)
            self.lblOption?.textColor = UIColor.black
            self.option?.isSelected = true
        }
    }
}
