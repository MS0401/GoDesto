//
//  FilterHotelSearchViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 21/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class FilterHotelSearchViewModel {
    var name:String
    var title:String
    var isAnswered:Bool
    var answer:String
    init() {
        self.name = ""
        self.title = ""
        self.isAnswered = false
        self.answer = ""
    }
}
