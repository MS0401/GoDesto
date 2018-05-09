//
//  LandingImageViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class LandingImageViewModel{
    var imageId:String
    var defaultImage:String
    var city:String
    var title:String
    var subTitle:String
    var imageUrl:String
    var home:String
    
    
    init() {
        self.imageId = ""
        self.defaultImage = "0"
        self.city = "0"
        self.title = ""
        self.subTitle = ""
        self.imageUrl = ""
        self.home = "0"
    }
    init(image:LandingImage) {
        self.imageId = image.imageId ?? ""
        self.defaultImage = image.defaultImage ?? "0"
        self.city = image.city ?? "0"
        self.title = image.title ?? ""
        self.subTitle = image.subTitle ?? ""
        self.imageUrl = image.imageUrl ?? ""
        self.home = image.home ?? "0"
    }
    
}
