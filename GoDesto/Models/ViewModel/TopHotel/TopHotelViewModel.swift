//
//  TopHotelViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 05/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation


class TopHotelViewModel {
    var general:String
    var min:String
    var max:String
    var currencyMin:String
    var currencyMax:String
    var currency:String
    var hotelList:[HotelViewModel]
    var roomTags:String
    
    init() {
        self.general = ""
        self.min = ""
        self.max = ""
        self.currencyMin = ""
        self.currencyMax = ""
        self.currency = ""
        self.hotelList = [HotelViewModel]()
        self.roomTags = ""
    }
    
    convenience init(topHotel:TopHotel) {
        self.init()
        
        self.general = topHotel.general ?? ""
        self.min = topHotel.min ?? ""
        self.max = topHotel.max ?? ""
        self.currencyMin = topHotel.currencyMin ?? ""
        self.currencyMax = topHotel.currencyMax ?? ""
        self.currency = topHotel.currency ?? ""
        if let _ = topHotel.hotelList{
            for eachHotel in topHotel.hotelList{
                self.hotelList.append(HotelViewModel(hotel: eachHotel as! Hotel))
            }
        }
        self.roomTags = topHotel.roomTags ?? ""
    }
    convenience init(moreHote:LoadMoreHotel){
        self.init()
        if let _ = moreHote.hotelList{
            for eachHotel in moreHote.hotelList{
                self.hotelList.append(HotelViewModel(hotel: eachHotel as! Hotel))
            }
        }
    }
    
    func addMoreHotels(list:[HotelViewModel])  {
        for eachHotel in list {
            self.hotelList.append(eachHotel)
        }
    }
}
