//
//  HotelViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 05/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class HotelViewModel {
    
    var findinBooking:String
    var updateMain:String
    var photo:String
    var updatedServer:String
    var city:String
    var hotelType:String
    var averageRating:String
    var collectionOfRooms:String
    var roomText:String
    var roomDescription:String
    var name:String
    var hotelCode:String
    var longitute:String
    var latitute:String
    var rating:String
    var hotelAddress:String
    var mainImage:String
    var distance:String
    var amenity:String
    var price:String
    var priceWithCurrency:String
    var paramDate:String
    var type:String
    var orignalAmount:String
    var pAmount:String
    var taxValueText:String
    var mealTypes:String
    var sessionId:String
    var countryPrice:String
    var isFavourite:Bool
    var rendomDiscount:String
    init() {
        self.findinBooking = ""
        self.updateMain = ""
        self.photo = ""
        self.updatedServer = ""
        self.city = ""
        self.hotelType = ""
        self.averageRating = ""
        self.collectionOfRooms = ""
        self.roomText = ""
        self.roomDescription = ""
        self.name = ""
        self.hotelCode = ""
        self.longitute = ""
        self.latitute = ""
        self.rating = ""
        self.hotelAddress = ""
        self.mainImage = ""
        self.distance = ""
        self.amenity = ""
        self.price = ""
        self.priceWithCurrency = ""
        self.paramDate = ""
        self.type = ""
        self.orignalAmount = ""
        self.pAmount = ""
        self.taxValueText = ""
        self.mealTypes = ""
        self.sessionId = ""
        self.countryPrice = "0"
        self.isFavourite = false
        self.rendomDiscount = "1"
        
    }
    
    
    init(hotel:Hotel) {
        self.findinBooking = hotel.findinBooking ?? ""
        self.updateMain = hotel.updateMain ?? ""
        self.photo = hotel.photo ?? ""
        self.updatedServer = hotel.updatedServer ?? ""
        self.city = hotel.city ?? ""
        self.hotelType = hotel.hotelType ?? ""
        self.averageRating = hotel.averageRating ?? ""
        self.collectionOfRooms = hotel.collectionOfRooms ?? ""
        self.roomText = hotel.roomText ?? ""
        self.roomDescription = hotel.roomDescription ?? ""
        self.name = hotel.name ?? ""
        self.hotelCode = hotel.hotelCode ?? ""
        self.longitute = hotel.longitute ?? ""
        self.latitute = hotel.latitute ?? ""
        self.rating = hotel.rating ?? ""
        self.hotelAddress = hotel.hotelAddress ?? ""
        self.mainImage = hotel.mainImage ?? ""
        self.distance = hotel.distance ?? ""
        self.amenity = hotel.amenity ?? ""
        self.price = hotel.price ?? ""
        self.priceWithCurrency = hotel.priceWithCurrency ?? ""
        self.paramDate = hotel.paramDate ?? ""
        self.type = hotel.type ?? ""
        self.orignalAmount = hotel.orignalAmount ?? ""
        self.pAmount = hotel.pAmount ?? ""
        self.taxValueText = hotel.taxValueText ?? ""
        self.mealTypes = hotel.mealTypes ?? ""
        self.sessionId =  hotel.sessionId ?? ""
        self.countryPrice = "0"
        self.isFavourite = false
        self.rendomDiscount = "1"
        self.rendomDiscount = self.getDiscount()
        
        
        if let splash = Global.shared.splashInfo{
            
            let rate = splash.exchangeInfo.rate
            let price = self.price
            if(!rate.isEmpty && !price.isEmpty){
                let conversion = Int(Double(rate)! * Double(price)!)
                self.countryPrice = "\(conversion)"
            }
        }
        
        var favouriteList = [String]()
        if let list = UserDefaults.standard.value(forKey: UserDefaultKeys.Favourite) as? [String]{
            favouriteList = list
        }
        if(favouriteList.count  > 0){
            for item in favouriteList{
                if(item == self.hotelCode){
                    self.isFavourite = true
                }
            }
        }
        
    }
    
    func getDiscount() -> String {
        let array = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20",]
        let randomIndex = Int(arc4random_uniform(UInt32(array.count)))
        print(array[randomIndex])
        return array[randomIndex]
    }
}
