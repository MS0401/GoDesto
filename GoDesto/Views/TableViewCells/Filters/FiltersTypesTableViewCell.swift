//
//  FiltersTypesTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 21/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class FiltersTypesTableViewCell: BaseTableViewCell {

    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var collectionView:UICollectionView?
    @IBOutlet weak var btnType1:UIButton?
    @IBOutlet weak var btnType2:UIButton?
    @IBOutlet weak var btnType3:UIButton?
    @IBOutlet weak var btnType4:UIButton?
    @IBOutlet weak var btnType5:UIButton?
    
    var typeList:[FilterMealTypeViewModel]?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setBorderColor(view: self.btnType1!, color: APPLICATION_THEME_COLOR)
        self.setBorderColor(view: self.btnType2!, color: APPLICATION_THEME_COLOR)
        self.setBorderColor(view: self.btnType3!, color: APPLICATION_THEME_COLOR)
        self.setBorderColor(view: self.btnType4!, color: APPLICATION_THEME_COLOR)
        self.setBorderColor(view: self.btnType5!, color: APPLICATION_THEME_COLOR)
        
        self.btnType1?.layer.cornerRadius = 5
        self.btnType2?.layer.cornerRadius = 5
        self.btnType3?.layer.cornerRadius = 5
        self.btnType4?.layer.cornerRadius = 5
        self.btnType5?.layer.cornerRadius = 5
        
        self.lblTitle?.text = "Filter by Meal type"
        
    }
    func configure(typeList:[FilterMealTypeViewModel])  {
        
        self.typeList = typeList
        
        self.btnType1?.setTitle(typeList[0].type, for: .normal)
        self.btnType2?.setTitle(typeList[1].type, for: .normal)
        self.btnType3?.setTitle(typeList[2].type, for: .normal)
        self.btnType4?.setTitle(typeList[3].type, for: .normal)
        self.btnType5?.setTitle(typeList[4].type, for: .normal)
        
        if(typeList[0].isSelected){
            self.btnType1?.backgroundColor = APPLICATION_THEME_COLOR
            self.btnType1?.setTitleColor(UIColor.white, for: .normal)
        }else{
            self.btnType1?.backgroundColor = UIColor.white
            self.btnType1?.setTitleColor(APPLICATION_THEME_COLOR, for: .normal)
        }
        if(typeList[1].isSelected){
            self.btnType2?.backgroundColor = APPLICATION_THEME_COLOR
            self.btnType2?.setTitleColor(UIColor.white, for: .normal)
        }else{
            self.btnType2?.backgroundColor = UIColor.white
            self.btnType2?.setTitleColor(APPLICATION_THEME_COLOR, for: .normal)
        }
        if(typeList[2].isSelected){
            self.btnType3?.backgroundColor = APPLICATION_THEME_COLOR
            self.btnType3?.setTitleColor(UIColor.white, for: .normal)
        }else{
            self.btnType3?.backgroundColor = UIColor.white
            self.btnType3?.setTitleColor(APPLICATION_THEME_COLOR, for: .normal)
        }
        if(typeList[3].isSelected){
            self.btnType4?.backgroundColor = APPLICATION_THEME_COLOR
            self.btnType4?.setTitleColor(UIColor.white, for: .normal)
        }else{
            self.btnType4?.backgroundColor = UIColor.white
            self.btnType4?.setTitleColor(APPLICATION_THEME_COLOR, for: .normal)
        }
        if(typeList[4].isSelected){
            self.btnType5?.backgroundColor = APPLICATION_THEME_COLOR
            self.btnType5?.setTitleColor(UIColor.white, for: .normal)
        }else{
            self.btnType5?.backgroundColor = UIColor.white
            self.btnType5?.setTitleColor(APPLICATION_THEME_COLOR, for: .normal)
        }
        
        
    }

    
    @IBAction func actionSelectType(_ sender:UIButton){
        
        for i in 0 ..< self.typeList!.count{
            if(i != sender.tag){
                self.typeList![i].isSelected = false
            }
        }
        if(self.typeList![sender.tag].isSelected){
            self.typeList![sender.tag].isSelected = false
            self.configure(typeList: self.typeList!)
        }else{
            self.typeList![sender.tag].isSelected = true
            self.configure(typeList: self.typeList!)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
