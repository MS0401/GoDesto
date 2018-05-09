//
//  SearchRegionViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 05/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class SearchRegionViewModel {
    var general:String
    var min:String
    var max:String
    
    
    init() {
        self.general = ""
        self.min = ""
        self.max = ""
    }
    
    init(region:SearchRegion) {
        self.general = region.general ?? ""
        self.min = region.min ?? ""
        self.max = region.max ?? ""
    }
}
