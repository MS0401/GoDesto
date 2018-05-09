//
//  FilterMealTypeViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 21/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class FilterMealTypeViewModel {
    var type:String
    var isSelected:Bool
    var title:String
    
    init() {
        self.type = ""
        self.isSelected = false
        self.title = ""
    }
    
    init(type:String,isSelected:Bool,title:String) {
        self.type = type
        self.isSelected = isSelected
        self.title = title
    }
}
