//
//  DescriptionViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 12/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class DescriptionViewModel {
    var detail:String
    var isSelected:Bool
    
    
    init() {
        self.detail = ""
        self.isSelected = false
    }
    init(text:String) {
        self.detail = text
        self.isSelected = false
    }
}
