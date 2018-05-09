//
//  HomeMenuItemCollectionViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 17/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

protocol HomeMenuItemDelegate:NSObjectProtocol {
    func actionCallBackSelectItem(index:Int)
}

class HomeMenuItemCollectionViewCell: BaseCollectionViewCell {
    @IBOutlet weak var viewBackground:UIView?
    @IBOutlet weak var lblItemName:UILabel?
    @IBOutlet weak var imgLogo:UIImageView?
    @IBOutlet weak var btnLayer:UIButton?
    @IBOutlet weak var imgIcon:UIImageView?
    
    var delegate: HomeMenuItemDelegate?
    var index = 0
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureView(item:[String:String],index:Int)  {
        self.index = index
        self.lblItemName?.text = item["title"]
        self.imgLogo?.image = UIImage(named:item["icon"]!)
    }
    func configureItem(cat:HomeCategoryViewModel,index:Int)  {
        self.index = index
        self.lblItemName?.text = cat.catText
        self.setImageWithUrl(imageView: self.imgLogo!, url: cat.appImage)
    }
    
    func configureFilter(option:ToDoFilterOptionViewModel)  {
        self.btnLayer?.isHidden = true
        self.imgIcon?.isHidden = false
        self.lblItemName?.text = option.title
        self.imgLogo?.layer.cornerRadius = 5
        self.imgLogo?.layer.borderWidth = 1
        self.imgLogo?.layer.borderColor = UIColor.lightGray.cgColor
        if(option.isSelected){
            self.imgIcon?.image = UIImage(named:option.selectedImage)
            self.lblItemName?.textColor = APPLICATION_THEME_COLOR
            self.imgLogo?.backgroundColor = APPLICATION_THEME_COLOR
        }else{
            self.imgIcon?.image = UIImage(named:option.defaultImage)
            self.lblItemName?.textColor = UIColor.black
            self.imgLogo?.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func actionSelectItem(_ sender:UIButton){
        if let del = self.delegate{
            del.actionCallBackSelectItem(index: self.index)
        }
    }
    
}
