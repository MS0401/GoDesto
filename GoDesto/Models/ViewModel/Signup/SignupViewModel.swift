//
//  SignupViewModel.swift
//  InsafiansPTI
//
//  Created by Ghafar Tanveer on 12/01/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class SignupViewModel {
//    
    var firstName:String
    var lastName:String
    var phone:String
    var cnic:String
    var password:String
    var district:String
    var province:String
    var na:String
    var uc:String
    var image:UIImage
    var imageUrl:String
    var appId:String
    var accountType:String
    var email:String
    init() {
        self.firstName = ""
        self.lastName = ""
        self.phone = ""
        self.cnic = ""
        self.password = ""
        self.district = ""
        self.province = ""
        self.na = ""
        self.uc = ""
        self.image = UIImage()
        self.imageUrl = ""
        self.appId = ""
        self.accountType = ""
        self.email = ""

    }
    convenience init(login:[String:Any]){
        self.init()
        if let fName = login["first_name"] as? String{
            self.firstName = fName
        }
        if let lName = login["last_name"] as? String{
            self.lastName = lName
        }
        if let email = login["email"] as? String{
            self.email = email
        }
//
        if let picture = login["picture"] as? [String:Any]{
            if let data = picture["data"] as? [String:Any]{
                if let url = data["url"] as? String{
                    self.imageUrl = url
                }
            }
       
        }
    }
    
}
