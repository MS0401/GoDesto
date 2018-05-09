//
//  HotelSearchDetail.swift
//  GoDesto
//
//  Created by Le Abid on 19/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

struct AdultInformation {
    var title: String = ""
    var firstName = ""
    var lastName = ""
    
}

struct ChildInformation {
    var title: String = ""
    var firstName = ""
    var lastName = ""
    var age = 0
}

struct RoomDetail {
    var adults = [AdultInformation]()
    var children = [ChildInformation]()
    
    var totalPersons : Int {
        return adults.count + children.count
    }
    
}

struct HotelSearchDetail {
    
    var city = ""
    var cityCode = ""
    var checkInDate  = Date()
    var checkOutDate = Date()
    var nationality = ""
    var nationalityCode = ""
    var countryCode = ""
    var sessionId = ""
    var roomDetails = [RoomDetail]()
    
    var totalRooms: Int {
        return roomDetails.count
    }
    
    var totalGuests: Int {
        var total = 0
        for roomDetail in roomDetails {
            total += roomDetail.totalPersons
        }
        return total
    }
}
