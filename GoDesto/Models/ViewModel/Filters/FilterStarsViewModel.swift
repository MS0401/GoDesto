//
//  FilterStarsViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 21/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class FilterStarsViewModel {
    var imageDefault:String
    var imageSelected:String
    var isSelected:Bool
    var title:String
    var star:String
    
    init() {
        self.imageDefault = ""
        self.imageSelected = ""
        self.isSelected = false
        self.title = ""
        self.star = ""
    }
    init(dImage:String,sImage:String,star:String) {
        self.imageDefault = dImage
        self.imageSelected = sImage
        self.isSelected = false
        self.title = ""
        self.star = star
    }
}
