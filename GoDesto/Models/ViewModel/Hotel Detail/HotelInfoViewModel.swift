//
//  HotelInfoViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class HotelInfoViewModel {
    
    var hotelCode: String
    var name: String
    var city: String
    var cityCode: String
    var country: String
    var countryCode: String
    var rating: String
    var hotelAddress: String
    var hotelPostalCode: String
    var website: String
    var email: String
    var longitute: String
    var latitute: String
    var searchString: String
    var topHotel: String
    var detail: String
    var roomAmenties: String
    var hotelAmenties: String
    var areaName: String
    var areaCode: String
    var allImages: String
    var midCollection: String
    var noImage: String
    var thumbCollection: String
    var mainImage: String
    var dated: String
    var updatedServer: String
    var updateMain: String
    var findInGiata: String
    var findInExpedia: String
    var imageFrom: String
    var findUmap: String
    var hotelType: String
    var expediaCom: String
    var hotelCom: String
    var bookingCom: String
    var averageRating: String
    
    var facilitiesList:[String]
    
    
    init() {
        
        self.hotelCode = ""
        self.name = ""
        self.city = ""
        self.cityCode = ""
        self.country = ""
        self.countryCode = ""
        self.rating = ""
        self.hotelAddress = ""
        self.hotelPostalCode = ""
        self.website = ""
        self.email = ""
        self.longitute = ""
        self.latitute = ""
        self.searchString = ""
        self.topHotel = ""
        self.detail = ""
        self.roomAmenties = ""
        self.hotelAmenties = ""
        self.areaName = ""
        self.areaCode = ""
        self.allImages = ""
        self.midCollection = ""
        self.noImage = ""
        self.thumbCollection = ""
        self.mainImage = ""
        self.dated = ""
        self.updatedServer = ""
        self.updateMain = ""
        self.findInGiata = ""
        self.findInExpedia = ""
        self.imageFrom = ""
        self.findUmap = ""
        self.hotelType = ""
        self.expediaCom = ""
        self.hotelCom = ""
        self.bookingCom = ""
        self.averageRating = ""
        self.facilitiesList = [String]()
    }
    convenience init(hotel:NSDictionary) {
        self.init()
        
        self.hotelCode = hotel.object(forKey: "HotelCode") as? String ?? ""
        self.name = hotel.object(forKey: "name") as? String ?? ""
        self.city = hotel.object(forKey: "city") as? String ?? ""
        self.cityCode = hotel.object(forKey: "city_code") as? String ?? ""
        self.country = hotel.object(forKey: "country") as? String ?? ""
        self.countryCode = hotel.object(forKey: "country_code") as? String ?? ""
        self.rating = hotel.object(forKey: "rating") as? String ?? ""
        self.hotelAddress = hotel.object(forKey: "HotelAddress") as? String ?? ""
        self.hotelPostalCode = hotel.object(forKey: "HotelPostalCode") as? String ?? ""
        self.website = hotel.object(forKey: "website") as? String ?? ""
        self.email = hotel.object(forKey: "email") as? String ?? ""
        self.longitute = hotel.object(forKey: "Latitude") as? String ?? ""
        self.latitute = hotel.object(forKey: "Longitude") as? String ?? ""
        self.searchString = hotel.object(forKey: "SearchString") as? String ?? ""
        self.topHotel = hotel.object(forKey: "TopHotel") as? String ?? ""
        self.detail = hotel.object(forKey: "Description") as? String ?? ""
        self.roomAmenties = hotel.object(forKey: "RoomAmenities") as? String ?? ""
        self.hotelAmenties = hotel.object(forKey: "HotelAmenities") as? String ?? ""
        self.areaName = hotel.object(forKey: "Area_Name") as? String ?? ""
        self.areaCode = hotel.object(forKey: "Area_Code") as? String ?? ""
        self.allImages = hotel.object(forKey: "all_images") as? String ?? ""
        self.midCollection = hotel.object(forKey: "mid_collection") as? String ?? ""
        self.noImage = hotel.object(forKey: "no_image") as? String ?? ""
        self.thumbCollection = hotel.object(forKey: "thumb_collection") as? String ?? ""
        self.mainImage = hotel.object(forKey: "main_image") as? String ?? ""
        self.dated = hotel.object(forKey: "dated") as? String ?? ""
        self.updatedServer = hotel.object(forKey: "updated_server") as? String ?? ""
        self.updateMain = hotel.object(forKey: "update_main") as? String ?? ""
        self.findInGiata = hotel.object(forKey: "find_in_giata") as? String ?? ""
        self.findInExpedia = hotel.object(forKey: "find_in_expedia") as? String ?? ""
        self.imageFrom = hotel.object(forKey: "image_from") as? String ?? ""
        self.findUmap = hotel.object(forKey: "find_umap") as? String ?? ""
        self.hotelType = hotel.object(forKey: "hotel_type") as? String ?? ""
        self.expediaCom = hotel.object(forKey: "expedia_com") as? String ?? ""
        self.hotelCom =  hotel.object(forKey: "hotels_com") as? String ?? ""
        self.bookingCom = hotel.object(forKey: "booking_com") as? String ?? ""
        self.averageRating = hotel.object(forKey: "average_rating") as? String ?? ""
        
        let list = self.hotelAmenties.components(separatedBy: "####")
        self.facilitiesList = list
    
    }
}
