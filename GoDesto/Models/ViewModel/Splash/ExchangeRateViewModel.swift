//
//  ExchangeRateViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class ExchangeRateViewModel {
    
    var exchangeId:String
    var fromCurrency:String
    var toCurrency:String
    var rate:String
    var date:String
    var symbol:String
    var position:String
    var unicode:String

    
    init() {
        self.exchangeId = ""
        self.fromCurrency = ""
        self.toCurrency = ""
        self.rate = ""
        self.date = ""
        self.symbol = ""
        self.position = ""
        self.unicode = ""

    }
    init(exchange:ExchangeRate) {
        self.exchangeId = exchange.exchangeId ?? ""
        self.fromCurrency = exchange.fromCurrency ?? ""
        self.toCurrency = exchange.toCurrency ?? ""
        self.rate = exchange.rate ?? ""
        self.date = exchange.date ?? ""
        self.symbol = exchange.symbol ?? ""
        self.position = exchange.position ?? ""
        self.unicode = exchange.unicode ?? ""
        
    }
    
    convenience init(dic:NSDictionary) {
        self.init()
        
        if let id = dic.object(forKey: "id") as? String{
            self.exchangeId = id
        }
        if let fromCurrency = dic.object(forKey: "from_cur") as? String{
            self.fromCurrency = fromCurrency
        }
        if let toCurrency = dic.object(forKey: "to_cur") as? String{
            self.toCurrency = toCurrency
        }
        if let rate = dic.object(forKey: "rate") as? String{
            self.rate = rate
        }
        if let date = dic.object(forKey: "dated") as? String{
            self.date = date
        }
        if let symbol = dic.object(forKey: "symbol") as? String{
            self.symbol = symbol
        }
        if let position = dic.object(forKey: "position") as? String{
            self.position = position
        }
        if let unicode = dic.object(forKey: "unicode") as? String{
            self.unicode = unicode
        }
    }
}
