//
//  DefaultResponseViewModel.swift
//  CabIOS
//
//  Created by Ghafar Tanveer on 09/02/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class DefaultResponseViewModel {
    var status:String
    var message:String
    
    
    init() {
        self.status = ""
        self.message = ""
    }
    
    convenience init(response:DefaultResponse){
        self.init()
        
        if let _ = response.status{
            self.status = response.status
        }
        if let _ = response.message{
            self.message = response.message
        }
    }
}
