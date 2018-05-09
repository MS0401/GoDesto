//
//  ToDoFilterOptionViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 13/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation


class ToDoFilterOptionViewModel {
    
    var title:String
    var isSelected:Bool
    var defaultImage:String
    var selectedImage:String
    var isHappyHour:Bool
    var isLadiesNight:Bool
    var height:Int
    var subOptions:[ToDoFilterSuboptionViewModel]
    
    
    init() {
        self.title = ""
        self.isSelected = false
        self.defaultImage = ""
        self.selectedImage = ""
        self.isHappyHour = true
        self.isLadiesNight = true
        self.height = 50
        self.subOptions = [ToDoFilterSuboptionViewModel]()
    }
    
    convenience init(title:String,dIcon:String,sIcon:String,isHappy:Bool,isLady:Bool) {
        self.init()
        
        self.title = title
        self.defaultImage = dIcon
        self.selectedImage = sIcon
        self.isHappyHour = isHappy
        self.isLadiesNight = isLady
        
        if(self.isHappyHour){
            self.subOptions.append(ToDoFilterSuboptionViewModel(title: "Availabel Now", isDay: false, isWeek: false))
             self.subOptions.append(ToDoFilterSuboptionViewModel(title: "Availabel Later Today", isDay: true, isWeek: false))
             self.subOptions.append(ToDoFilterSuboptionViewModel(title: "Availabel Later This Week", isDay: false, isWeek: true))
        }
        if(self.isLadiesNight){
            self.subOptions.append(ToDoFilterSuboptionViewModel(title: "Availabel Now", isDay: false, isWeek: false))
            self.subOptions.append(ToDoFilterSuboptionViewModel(title: "Availabel Later Today", isDay: true, isWeek: false))
            self.subOptions.append(ToDoFilterSuboptionViewModel(title: "Availabel Later This Week", isDay: false, isWeek: true))
        }
        
    }
    func setSubOptions(subOption:ToDoFilterSuboptionViewModel) {
        for item in self.subOptions{
            if(item.title != subOption.title){
                item.isSelected = false
                item.height = 50
            }
        }
    }
    
    
    
}
