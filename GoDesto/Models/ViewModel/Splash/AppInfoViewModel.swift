//
//  AppInfoViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class AppInfoViewModel {
    var infoId:String
    var globalText:String
    var dubaiText:String
    
    init() {
        self.infoId = ""
        self.globalText = ""
        self.dubaiText = ""
    }
    
    init(info:AppInfo) {
        self.infoId = info.infoId ?? ""
        self.globalText = info.globalText ?? ""
        self.dubaiText = info.dubaiText ?? ""
    }
}
