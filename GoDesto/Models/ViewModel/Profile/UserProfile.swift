//
//  UserProfile.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 3/28/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
class UserProfile {

    var firstName:String
    var lastName:String
    var emailAddress:String
    var phoneNumber:String
    var streetAddress:String
    var cityAddress:String
    var zipCode:String
    var country:String
    var password:String
    
    var imgICon:UIImage
    
    
    init() {
        
        self.firstName = ""
        self.lastName = ""
        self.emailAddress = ""
        self.phoneNumber = ""
        self.streetAddress = ""
        self.cityAddress = ""
        self.zipCode = ""
        self.country = ""
        self.password = ""
        self.imgICon = UIImage.init()
    }
    
    init(userFile:UserProfile) {
        
        self.firstName = userFile.firstName as String? ?? ""
        self.lastName = userFile.lastName as String? ?? ""
        self.emailAddress = userFile.emailAddress as String? ?? ""
        self.phoneNumber = userFile.phoneNumber as String? ?? ""
        self.streetAddress = userFile.streetAddress as String? ?? ""
        self.cityAddress = userFile.cityAddress as String? ?? ""
        self.zipCode = userFile.zipCode as String? ?? ""
        self.country = userFile.country as String? ?? ""
        self.password = userFile.password as String? ?? ""
        self.imgICon = userFile.imgICon as UIImage? ?? UIImage.init()
    }
    
}
