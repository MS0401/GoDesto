//
//  FacilitiesViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 20/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class FacilitiesViewModel {
    var image:String
    var title:String
    
    
    init() {
        self.image = ""
        self.title = ""
    }
    init(title:String,image:String) {
        self.image = image
        self.title = title
    }
}
