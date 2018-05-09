
//
//  LoginViewModel.swift
//  InsafiansPTI
//
//  Created by Ghafar Tanveer on 26/12/2017.
//  Copyright © 2017 Ghafar Tanveer. All rights reserved.
//

import Foundation

class LoginViewModel:NSObject,NSCoding {
 
    var loginId:String
    var email:String
    var date:String
    var firstName:String
    var lastName:String
    var addUrl:String
    var city:String
    var region:String
    var country:String
    var title:String
    var zip:String
    var password:String
    var registerFC:String
    var refferalCode:String
    var travelCredit:String
    var phone:String
    var letterDuration:String
    var countryCode:String
    var tenPlus:String
    var forgotLink:String
    var wish:String
    var unsub:String
    var app:String
    var directLink:String
    var dirwctLinkTime:String
    var emailTextFriend:String
    
    override init() {
        self.loginId = ""
        self.email = ""
        self.date = ""
        self.firstName = ""
        self.lastName = ""
        self.addUrl = ""
        self.city = ""
        self.region = ""
        self.country = ""
        self.title = ""
        self.zip = ""
        self.password = ""
        self.registerFC = ""
        self.refferalCode = ""
        self.travelCredit = ""
        self.phone = ""
        self.letterDuration = ""
        self.countryCode = ""
        self.tenPlus = ""
        self.forgotLink = ""
        self.wish = ""
        self.unsub = ""
        self.app = ""
        self.directLink = ""
        self.dirwctLinkTime = ""
        self.emailTextFriend = ""
    }
    
    
    convenience init(login:Login) {
        self.init()
        
        self.loginId = login.loginId as String? ?? ""
        self.email = login.email as String? ?? ""
        self.date = login.date as String? ?? ""
        self.firstName = login.firstName as String? ?? ""
        self.lastName = login.lastName as String? ?? ""
        self.addUrl = login.addUrl as String? ?? ""
        self.city = login.city as String? ?? ""
        self.region = login.region as String? ?? ""
        self.country = login.country as String? ?? ""
        self.title = login.title as String? ?? ""
        self.zip = login.zip as String? ?? ""
        self.password = login.password as String? ?? ""
        self.registerFC = login.registerFC as String? ?? ""
        self.refferalCode = login.refferalCode as String? ?? ""
        self.travelCredit = login.travelCredit as String? ?? ""
        self.phone = login.phone as String? ?? ""
        self.letterDuration = login.letterDuration as String? ?? ""
        self.countryCode = login.countryCode as String? ?? ""
        self.tenPlus = login.tenPlus as String? ?? ""
        self.forgotLink = login.forgotLink as String? ?? ""
        self.wish = login.wish as String? ?? ""
        self.unsub = login.unsub as String? ?? ""
        self.app = login.app as String? ?? ""
        self.directLink = login.directLink as String? ?? ""
        self.dirwctLinkTime = login.dirwctLinkTime as String? ?? ""
        self.emailTextFriend = login.emailTextFriend as String? ?? ""
       

    }
   
    
    required init(coder decoder: NSCoder) {
        
            self.loginId =  decoder.decodeObject(forKey: "loginId") as? String ?? ""
            self.email = decoder.decodeObject(forKey: "email") as? String ?? ""
            self.date = decoder.decodeObject(forKey: "date") as? String ?? ""
            self.firstName = decoder.decodeObject(forKey: "firstName") as? String ?? ""
            self.lastName = decoder.decodeObject(forKey: "lastName") as? String ?? ""
            self.addUrl = decoder.decodeObject(forKey: "addUrl") as? String ?? ""
            self.city = decoder.decodeObject(forKey: "city") as? String ?? ""
            self.region = decoder.decodeObject(forKey: "region") as? String ?? ""
            self.country = decoder.decodeObject(forKey: "country") as? String ?? ""
            self.title = decoder.decodeObject(forKey: "title") as? String ?? ""
            self.zip = decoder.decodeObject(forKey: "zip") as? String ?? ""
            self.password = decoder.decodeObject(forKey: "password") as? String ?? ""
            self.registerFC = decoder.decodeObject(forKey: "registerFC") as? String ?? ""
            self.refferalCode = decoder.decodeObject(forKey: "refferalCode") as? String ?? ""
            self.travelCredit = decoder.decodeObject(forKey: "travelCredit") as? String ?? ""
            self.phone = decoder.decodeObject(forKey: "phone") as? String ?? ""
            self.letterDuration = decoder.decodeObject(forKey: "letterDuration") as? String ?? ""
            self.countryCode = decoder.decodeObject(forKey: "countryCode") as? String ?? ""
            self.tenPlus = decoder.decodeObject(forKey: "tenPlus") as? String ?? ""
            self.forgotLink = decoder.decodeObject(forKey: "forgotLink") as? String ?? ""
            self.wish = decoder.decodeObject(forKey: "wish") as? String ?? ""
            self.unsub = decoder.decodeObject(forKey: "unsub") as? String ?? ""
            self.app = decoder.decodeObject(forKey: "app") as? String ?? ""
            self.directLink = decoder.decodeObject(forKey: "directLink") as? String ?? ""
            self.dirwctLinkTime = decoder.decodeObject(forKey: "dirwctLinkTime") as? String ?? ""
            self.emailTextFriend = decoder.decodeObject(forKey: "emailTextFriend") as? String ?? ""
    }
    func encode(with coder: NSCoder) {
        coder.encode(self.loginId, forKey: "loginId")
        coder.encode(self.email, forKey: "email")
        coder.encode(self.date, forKey: "date")
        coder.encode(self.firstName, forKey: "firstName")
        coder.encode(self.lastName, forKey: "lastName")
        coder.encode(self.addUrl, forKey: "addUrl")
        coder.encode(self.city, forKey: "city")
        coder.encode(self.region, forKey: "region")
        coder.encode(self.country, forKey: "country")
        coder.encode(self.title, forKey: "title")
        coder.encode(self.zip, forKey: "zip")
        coder.encode(self.password, forKey: "password")
        coder.encode(self.registerFC, forKey: "registerFC")
        coder.encode(self.refferalCode, forKey: "refferalCode")
        coder.encode(self.travelCredit, forKey: "travelCredit")
        coder.encode(self.phone, forKey: "phone")
        
        coder.encode(self.letterDuration, forKey: "letterDuration")
        coder.encode(self.countryCode, forKey: "countryCode")
        coder.encode(self.tenPlus, forKey: "tenPlus")
        coder.encode(self.forgotLink, forKey: "forgotLink")
        coder.encode(self.wish, forKey: "wish")
        coder.encode(self.unsub, forKey: "unsub")
        coder.encode(self.app, forKey: "app")
        coder.encode(self.directLink, forKey: "directLink")
        coder.encode(self.dirwctLinkTime, forKey: "dirwctLinkTime")
        coder.encode(self.emailTextFriend, forKey: "emailTextFriend")
    }
    
}
