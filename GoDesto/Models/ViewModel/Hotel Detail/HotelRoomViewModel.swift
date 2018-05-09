//
//  HotelRoomViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
class HotelRoomViewModel {
    var quoteId:String
    var roomText:String
    var roomDescription:String
    var showPriceSelection:String
    var showPriceSep:String
    var previousPrice:String
    var dataPreviousPrice:String
    var dataCurrentPrice:String
    var currentCurrencyPrice:String
    var isNonRefund:Bool
    var isRoomOnly:Bool
    
    init() {
        self.quoteId  = ""
        self.roomText  = ""
        self.roomDescription  = ""
        self.showPriceSelection  = ""
        self.showPriceSep  = ""
        self.previousPrice  = ""
        self.dataPreviousPrice  = ""
        self.dataCurrentPrice  = ""
        self.currentCurrencyPrice = ""
        
        self.isNonRefund = false
        self.isRoomOnly = false
    }
    init(room:HoteRoom) {
        self.quoteId  = room.quoteId ?? ""
        self.roomText  = room.roomText ?? ""
        self.roomDescription  = room.roomDescription ?? ""
        self.showPriceSelection  = room.showPriceSelection ?? ""
        self.showPriceSep  = room.showPriceSep ?? ""
        self.previousPrice  = room.previousPrice ?? ""
        self.dataPreviousPrice  = room.dataPreviousPrice ?? ""
        self.dataCurrentPrice  = room.dataCurrentPrice ?? ""
        self.currentCurrencyPrice = ""
        self.isNonRefund = false
        self.isRoomOnly = false
        
        if(self.roomDescription.lowercased() == "Room only".lowercased()){
            self.isRoomOnly = true
        }
        
        if let splash = Global.shared.splashInfo{
            
            let rate = splash.exchangeInfo.rate
            let price = self.showPriceSelection
            if(!rate.isEmpty && !price.isEmpty){
                let conversion = Int(Double(rate)! * Double(price)!)
                self.currentCurrencyPrice = "\(conversion)"
            }
        }
    }
}
