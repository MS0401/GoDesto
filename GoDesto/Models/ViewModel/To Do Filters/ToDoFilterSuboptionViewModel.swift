//
//  ToDoFilterSuboptionViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 13/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class ToDoFilterSuboptionViewModel {
    
    var title:String
    var isSelected:Bool
    var isDayLater:Bool
    var isLaterWeek:Bool
    var timeDetail:ToDoFilterTimeViewModel
    var daysList:[ToDoFilterDayViewModel]
    var height:Int
    
    
    init() {
        self.title = ""
        self.isSelected  = false
        self.isDayLater = false
        self.isLaterWeek = false
        self.timeDetail = ToDoFilterTimeViewModel()
        self.daysList = [ToDoFilterDayViewModel]()
        self.height = 50
        
    }
    
    convenience init(title:String,isDay:Bool,isWeek:Bool) {
        self.init()
        
        self.title = title
        self.isDayLater = isDay
        self.isLaterWeek = isWeek
        
        
        if(self.isLaterWeek){
            
            self.daysList.append(ToDoFilterDayViewModel(title: "Today",day:Utilities.getDayOfWeek(Utilities.getNextDateString(date: Date(), value: 1))!))
            self.daysList.append(ToDoFilterDayViewModel(title: "Tomorrow",day:Utilities.getDayOfWeek(Utilities.getNextDateString(date: Date(), value: 1))!))
            self.daysList.append(ToDoFilterDayViewModel(title: "Sunday",day:Utilities.getDayOfWeek(Utilities.getNextDateString(date: Date(), value: 2))!))
            self.daysList.append(ToDoFilterDayViewModel(title: "Monday",day:Utilities.getDayOfWeek(Utilities.getNextDateString(date: Date(), value: 3))!))
            self.daysList.append(ToDoFilterDayViewModel(title: "Tuesday",day:Utilities.getDayOfWeek(Utilities.getNextDateString(date: Date(), value: 4))!))
            self.daysList.append(ToDoFilterDayViewModel(title: "Wednesday",day:Utilities.getDayOfWeek(Utilities.getNextDateString(date: Date(), value: 5))!))
            self.daysList.append(ToDoFilterDayViewModel(title: "Thursday",day:Utilities.getDayOfWeek(Utilities.getNextDateString(date: Date(), value: 6))!))
        }
    }
    func setDays(day:ToDoFilterDayViewModel)  {
        for item in self.daysList {
            if(day.title != item.title){
                item.isSelected = false
                item.height = 40
            }
        }
    }
    
    func setHeight()  {
        if(self.isDayLater){
            if(self.isSelected){
                self.height = 90
            }else{
                self.height = 50
            }
        }else if(self.isLaterWeek){
            if(self.isSelected){
                self.height = 330
                for day in self.daysList{
                    if(day.isSelected){
                        self.height = 380
                    }
                }
            }else{
                self.height = 50
            }
        }
    }
    func isDaySelected() -> Bool {
        for item in self.daysList{
            if(item.isSelected){
                return true
            }
        }
        return false
    }
    
    func setDayInfo(dayInfo:ToDoFilterDayViewModel)  {
        self.daysList = [ToDoFilterDayViewModel]()
        let day1 = self.getDay(dayString: "sunday")
        day1.day = "Sunday"
        day1.title = "Sunday"
        self.daysList.append(day1)
        
        let day2 = self.getDay(dayString: "monday")
        day1.day = "Monday"
        day1.title = "Monday"
        self.daysList.append(day2)
        
        let day3 = self.getDay(dayString: "tuesday")
        day1.day = "Tuesday"
        day1.title = "Tuesday"
        self.daysList.append(day3)
        
        let day4 = self.getDay(dayString: "wednesday")
        day1.day = "Wednesday"
        day1.title = "Wednesday"
        self.daysList.append(day4)
        
        let day5 = self.getDay(dayString: "thursday")
        day1.day = "Thursday"
        day1.title = "Thursday"
        self.daysList.append(day5)
        
        let day6 = self.getDay(dayString: "friday")
        day1.day = "Friday"
        day1.title = "Friday"
        self.daysList.append(day6)
        
        let day7 = self.getDay(dayString: "satuarday")
        day1.day = "Satuarday"
        day1.title = "Satuarday"
        self.daysList.append(day7)
        
    }
    func getDay(dayString:String) -> ToDoFilterDayViewModel {
        for day in self.daysList{
            if(day.day.lowercased() == dayString){
                return day
            }
        }
        return ToDoFilterDayViewModel()
    }
}
