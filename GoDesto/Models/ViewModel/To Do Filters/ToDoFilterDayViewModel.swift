//
//  ToDoFilterDayViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 13/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class ToDoFilterDayViewModel {
    
    
    var title:String
    var isSelected:Bool
    var timeInfo:ToDoFilterTimeViewModel
    var height:Int
    var day:String
    var timeList:[ToDoFilterTimeViewModel]
    
     var sunday:[ToDoFilterTimeViewModel]
     var monday:[ToDoFilterTimeViewModel]
     var tuesday:[ToDoFilterTimeViewModel]
     var wednesday:[ToDoFilterTimeViewModel]
     var thursday:[ToDoFilterTimeViewModel]
     var friday:[ToDoFilterTimeViewModel]
     var satuarday:[ToDoFilterTimeViewModel]
    
    init() {
        self.title = ""
        self.day = ""
        self.isSelected = false
        self.timeInfo = ToDoFilterTimeViewModel()
        self.height = 40
        self.timeList = [ToDoFilterTimeViewModel]()
        
        self.sunday = [ToDoFilterTimeViewModel]()
        self.monday = [ToDoFilterTimeViewModel]()
        self.tuesday = [ToDoFilterTimeViewModel]()
        self.wednesday = [ToDoFilterTimeViewModel]()
        self.thursday = [ToDoFilterTimeViewModel]()
        self.friday = [ToDoFilterTimeViewModel]()
        self.satuarday = [ToDoFilterTimeViewModel]()
        
        
        
        
    }
    
    convenience init(title:String,day:Int) {
        self.init()
        if(title.lowercased() == "today" || title.lowercased() == "tomorrow"){
            self.title = title
            self.day = title
        }else{
            self.day = self.getDayNameWithString(dayCount: day)
            self.title = self.day
        }
        
        
        
        
    }
    
    convenience init(timeList:TImeList) {
        self.init()
        
        if(self.day.lowercased() == "sunday"){
            for item in timeList.sunday{
                self.sunday.append(ToDoFilterTimeViewModel(time: item as! TIme))
            }
            
        }
        if(self.day.lowercased() == "monday"){
            for item in timeList.monday{
                self.monday.append(ToDoFilterTimeViewModel(time: item as! TIme))
            }
            
        }
        if(self.day.lowercased() == "tuesday"){
            for item in timeList.tuesday{
                self.tuesday.append(ToDoFilterTimeViewModel(time: item as! TIme))
            }
            
        }
        if(self.day.lowercased() == "wednesday"){
            for item in timeList.wednesday{
                self.wednesday.append(ToDoFilterTimeViewModel(time: item as! TIme))
            }
            
        }
        if(self.day.lowercased() == "thursday"){
            for item in timeList.thursday{
                self.thursday.append(ToDoFilterTimeViewModel(time: item as! TIme))
            }
            
        }
        if(self.day.lowercased() == "friday"){
            for item in timeList.friday{
                self.friday.append(ToDoFilterTimeViewModel(time: item as! TIme))
            }
        }
        if(self.day.lowercased() == "satuarday"){
            for item in timeList.satuarday{
                self.satuarday.append(ToDoFilterTimeViewModel(time: item as! TIme))
            }
            
        }
        
    }
   
    
    func getDayNameWithString(dayCount:Int) -> String {
        if(dayCount == 0){
            return "Sunday"
        }else if(dayCount == 1){
            return "Sunday"
        }else if(dayCount == 2){
            return "Monday"
        }else if(dayCount == 3){
            return "Tuesday"
        }else if(dayCount == 4){
            return "Wednesday"
        }else if(dayCount == 5){
            return "Thursday"
        }else if(dayCount == 6){
            return "Friday"
        }else{
            return "Satuarday"
        }
        
    }
    
    
}
