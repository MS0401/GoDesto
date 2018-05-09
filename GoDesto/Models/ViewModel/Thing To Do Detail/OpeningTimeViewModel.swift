//
//  OpeningTimeViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
class OpeningTimeViewModel {
    
    var day:String
    var to:String
    var from:String
    
    
    init() {
        self.day = ""
        self.to = ""
        self.from = ""
    }
    init(time:Timing) {
        self.day = time.day ?? ""
        self.to = time.to ?? ""
        self.from = time.from ?? ""
        
    }
}
