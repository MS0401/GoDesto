//
//  FilterOptionViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 21/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class FilterOptionViewModel {
    var imageDefault:String
    var imageSelected:String
    var name:String
    var title:String
    var isSelected:Bool
    var image:String
    
    init() {
        self.imageDefault = ""
        self.imageSelected = ""
        self.name = ""
        self.title = ""
        self.isSelected = false
        self.image = ""
    }
    init(image:String,name:String,title:String) {
        self.image = image
        self.name = name
        self.title = title
        self.imageSelected = ""
        self.imageDefault = ""
        self.isSelected = false
    }
    init(dImage:String,sImage:String,name:String,title:String) {
        self.imageSelected = sImage
        self.imageDefault = dImage
        self.name = name
        self.title = title
        self.isSelected  = false
        self.image = ""
    }
    init(image:String,name:String,title:String,isSelected:Bool) {
        self.image = image
        self.name = name
        self.title = title
        self.imageSelected = ""
        self.imageDefault = ""
        self.isSelected = isSelected
    }
}
