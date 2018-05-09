//
//  HotelDetailViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
class HotelDetailViewModel {
    
    var shareUrl:String
    var noImage:String
    var images:[String]
    var imageString:String
    var hotelInfo:HotelInfoViewModel
    
    
    init() {
        self.shareUrl = ""
        self.noImage = ""
        self.images = [String]()
        self.imageString = ""
        self.hotelInfo = HotelInfoViewModel()
    }
    
    convenience init(detail:HotelDetail) {
        self.init()
        
        self.shareUrl = detail.shareUrl ?? ""
        self.noImage = detail.noImage ?? ""
        
        self.imageString = detail.images ?? ""
        
        self.images = imageString.components(separatedBy: "##")
        
        if let info = detail.hotelInfo{
            self.hotelInfo = HotelInfoViewModel(hotel:info as NSDictionary)
        }
        
        
    }
    
    
}
