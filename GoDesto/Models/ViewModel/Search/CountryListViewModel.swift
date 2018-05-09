//
//  CountryListViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class CountryListViewModel {
    
    var countryList:[CountryViewModel]
    var countryListByName:[String]
    
    init() {
        self.countryList = [CountryViewModel]()
        self.countryListByName = [String]()
    }
    
    init(list:CountryList) {
        self.countryList = [CountryViewModel]()
        self.countryListByName = [String]()
        if let cList = list.countryList{
            for eachCountry in cList{
                self.countryList.append(CountryViewModel(country: eachCountry as! Country))
            }
        }
        
        for country in self.countryList {
            self.countryListByName.append(country.suggestCountryName)
        }
    }
    func searchCountryByName(text:String) -> String  {
        for country in self.countryListByName {
            if(text.lowercased() == country.lowercased()){
                return country
            }
        }
        return ""
    }
}
