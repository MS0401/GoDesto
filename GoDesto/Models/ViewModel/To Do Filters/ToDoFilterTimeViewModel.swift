//
//  ToDoFilterTimeViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 13/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class ToDoFilterTimeViewModel {
    
    var title:String
    var isSelected:Bool
    var selectedTitle:String
    var bookingTimes:[String]
    var value:String
    var display:String
    
    init() {
        self.title = ""
        self.isSelected = false
        self.selectedTitle = ""
        self.value = ""
        self.display = ""
        self.bookingTimes = [String]()
    }
    
    convenience init(time:TIme) {
        
        self.init()
        
        self.value = time.value ?? ""
        self.display = time.display ?? ""
    }
}
