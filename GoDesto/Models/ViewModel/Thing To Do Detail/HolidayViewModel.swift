//
//  HolidayViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
class HolidayViewModel {
    
   var holidayId:String
   var voucherType:String
   var windows:String
   var terms:String
   var hubId:String
    
    init() {
       self.holidayId = ""
       self.voucherType = ""
       self.windows = ""
       self.terms = ""
       self.hubId = ""
    }
    
    init(time:Holiday) {
       self.holidayId = time.holidayId ?? ""
       self.voucherType = time.voucherType ?? ""
       self.windows = time.windows ?? ""
       self.terms = time.terms ?? ""
       self.hubId = time.hubId ?? ""
    }
}

