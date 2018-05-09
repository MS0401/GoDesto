//
//  OpeningTimesViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 20/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class OpeningTimesViewModel {
    var day:String
    var time:String
    var to :String
    var from:String
    var fullTime:String
    
    init() {
        self.day = ""
        self.to = ""
        self.from = ""
        self.time = ""
        self.fullTime = ""
    }
    
    init(day:String,time:String) {
        self.day = day
        self.time = time
        self.to = ""
        self.from = ""
        self.fullTime = ""
    }
   
    init(time:Timing) {
        self.time = ""
        self.day = time.day ?? ""
        self.to = time.to ?? ""
        self.from = time.from ?? ""
        
        self.fullTime = "\(self.from) to \(self.to)"
    }
}
