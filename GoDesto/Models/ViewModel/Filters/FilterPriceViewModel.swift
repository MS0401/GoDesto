//
//  FilterPriceViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 21/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
class FilterPriceViewModel {
    var defaultMinAED:String
    var defaultMaxAED:String
    var price:Double
    var min:String
    var max:String
    var minInAED:String
    var maxInAED:String
    var title:String
    var isChanged:Bool

    
    init() {
        self.price = 0.0
        self.title = ""
        self.min = ""
        self.max = ""
        self.minInAED = ""
        self.maxInAED = ""
        self.defaultMaxAED = ""
        self.defaultMinAED = ""
        self.isChanged = false
    }
}
