//
//  CancelationViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class CancelationViewModel {
    var quoteId:String
    var status:String
    
    
    init() {
        self.quoteId = ""
        self.status = ""
    }
    
    init(cancelation:Cancelation) {
        self.quoteId = cancelation.quoteId
        self.status = cancelation.status
    }
}
