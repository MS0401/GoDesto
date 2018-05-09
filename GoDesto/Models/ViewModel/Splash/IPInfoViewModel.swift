//
//  IPInfoViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class IPInfoViewModel {
    var currencyCode:String
    var iso:String
    var ipFrom:String
    var ipTo:String
    var countryCode:String
    var countryname:String

    init() {
       self.currencyCode = ""
       self.iso = ""
       self.ipFrom = ""
       self.ipTo = ""
       self.countryCode = ""
       self.countryname = ""

    }
    
    init(info:IPInfo) {
        self.currencyCode = info.countryCode ?? ""
        self.iso = info.iso ?? ""
        self.ipFrom = info.ipFrom ?? ""
        self.ipTo = info.ipTo ?? ""
        self.countryCode = info.countryCode ?? ""
        self.countryname = info.countryname ?? ""
    }
}
