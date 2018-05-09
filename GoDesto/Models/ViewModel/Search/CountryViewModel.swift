//
//  CountryViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class CountryViewModel {
    var areaName:String
    var countryCode:String
    var cityName:String
    var destType:String
    var areaCode:String
    var countryName:String
    var name:String
    var cityCode:String
    var weight:String
    var cId:String
    var searchString:String
    var hotelCode:String
    var version:String
    var suggestCountryName:String
    var suggestCountryCode:String
    
    
    init() {
        self.areaName = ""
        self.countryCode = ""
        self.cityName = ""
        self.destType = ""
        self.areaCode = ""
        self.countryName = ""
        self.name = ""
        self.cityCode = ""
        self.weight = ""
        self.cId = ""
        self.searchString = ""
        self.hotelCode = ""
        self.version = ""
        self.suggestCountryName = ""
        self.suggestCountryCode = ""
    }
    
    convenience init(country:Country) {
        self.init()
        
        self.areaName = country.areaName ?? ""
        self.countryCode = country.countryCode ?? ""
        self.cityName = country.cityName ?? ""
        self.destType = country.destType ?? ""
        self.areaCode = country.areaCode ?? ""
        self.countryName = country.countryName ?? ""
        self.name = country.name ?? ""
        self.cityCode = country.cityCode ?? ""
        self.weight = country.weight ?? ""
        self.cId = country.cId ?? ""
        self.searchString = country.searchString ?? ""
        self.hotelCode = country.hotelCode ?? ""
        self.version = country.version ?? ""
        self.suggestCountryName = country.suggestCountryName ?? ""
        self.suggestCountryCode = country.suggestCountryCode ?? ""
        
    }
}
