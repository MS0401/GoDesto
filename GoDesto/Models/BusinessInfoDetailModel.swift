//
//  BusinessInfoDetailModel.swift
//  GoDesto
//
//  Created by Sohail on 01/05/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class BusinessInfoDetailModel: NSObject {

    var  title: String = ""
    var detail : String = ""
    
    override init() {
        super.init()
    }
    
    convenience init(title:String, detail : String)
    {
        self.init()
        
        self.title = title
        self.detail = detail
    }
}
