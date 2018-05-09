//
//  RequestMessage.swift
//  InsafiansPTI
//
//  Created by Ghafar Tanveer on 01/01/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class RequestMessage: ServiceRequestMessage {

    var email:String = ""
    var password:String = ""
    var oldPassword:String = ""
    var newPassword:String = ""
    var newsLetterPref: String = ""
    var FCMToken:String = ""
    var clientId:String = ""
    var driverId:String = ""
    var type:String = FCM_TYPE
    var firstName:String = ""
    var lastName:String = "empty"
    var address:String = ""
    var phoneNumber:String = ""
    var city:String = ""
    var country:String = ""
    var region:String = ""
    var title:String = ""
    var imageKey:String = ""
    var image:UIImage = UIImage()
    var companyName:String = COMPANY_NAME
    var pickUpLatLong:String = ""
    var dropLatLong:String = ""
    var pickUpAddress:String = ""
    var dropAddress:String = ""
    var car:String = ""
    var faveroutDriver:String = ""
    var numberOfPassenger:String = "5"
    var fare:String = ""
    var date:String = ""
    var jobId:String = ""
    var latitude:String = ""
    var longitude:String = ""
    var rating:String = ""
    var feedback:String = ""
    var query:String = ""
    var isForRegion:Bool? = false
    var pageNumber:String = "0"
    var hotelParams:[String:String] = [String:String]()
    var queryItemList:[URLQueryItem] = [URLQueryItem]()
    var sessionId:String = ""
    
    var loginId:String = ""
    var text:String = ""
    var hubId:String = ""
    var message: String = ""
    
    
}


