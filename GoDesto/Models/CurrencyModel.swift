//
//  CurrencyModel.swift
//  GoDesto
//
//  Created by Sohail on 01/05/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class CurrencyModel: NSObject {
    var  name: String = ""
    var countries : String = ""
    
    override init() {
        super.init()
    }
    
    convenience init(name:String, countries : String)
    {
        self.init()
        
        self.name = name
        self.countries = countries
    }
}
