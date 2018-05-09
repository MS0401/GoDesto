//
//  SectionViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 20/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class SectionViewModel {
    var title:String
    var isSelected:Bool
    var icon:String
    
    init() {
        self.title = ""
        self.icon = ""
        self.isSelected = false
        
    }
    init(title:String,isselected:Bool,icon:String? = "") {
        self.title = title
        self.isSelected = isselected
        self.icon = icon!
    }
}
