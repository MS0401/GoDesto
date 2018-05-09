//
//  HomeCategoryViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class HomeCategoryViewModel {
    
    var catId:String
    var catText:String
    var catField:String
    var appImage:String
    var view:String
    var city:String
    var actionType:String
    

    init() {
        self.catId = ""
        self.catText = ""
        self.catField = ""
        self.appImage = ""
        self.view = ""
        self.city = ""
        self.actionType = ""
        

    }
    
    init(cat:HomeCategory) {
        self.catId = cat.catId  ?? ""
        self.catText = cat.catText  ?? ""
        self.catField = cat.catField  ?? ""
        self.appImage = cat.appImage  ?? ""
        self.view = cat.view  ?? ""
        self.city = cat.city  ?? ""
        self.actionType = cat.actionType  ?? ""
    }
}
