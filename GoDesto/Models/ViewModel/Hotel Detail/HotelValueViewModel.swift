//
//  HotelValueViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
class HotelValueViewModel {
    var id:String
    var cityCode:String
    var text:String
    var amount:String
    var includetext:String
    
    init() {
        self.id = ""
        self.cityCode = ""
        self.text = ""
        self.amount = ""
        self.includetext = ""
    }
    
    init(dic:NSDictionary) {
        self.id = dic.object(forKey: "id") as? String ?? ""
        self.cityCode = dic.object(forKey: "city_code") as? String ?? ""
        self.text = dic.object(forKey: "text") as? String ?? ""
        self.amount = dic.object(forKey: "amount") as? String ?? ""
        self.includetext = dic.object(forKey: "included_text") as? String ?? ""
    }
}
