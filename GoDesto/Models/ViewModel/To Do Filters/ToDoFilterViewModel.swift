//
//  ToDoFilterViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 13/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
class ToDoFilterViewModel {
    
    var cusineList:[ToDoFilterOptionViewModel]
    var optionList:[ToDoFilterOptionViewModel]
    var searchTitle:String
    var locationName:String
    var cusineTitle:String
    var optionTitle:String
    
    
    init() {
        self.cusineList = [ToDoFilterOptionViewModel]()
        self.optionList = [ToDoFilterOptionViewModel]()
        
        self.searchTitle = "   Find your current location"
        self.cusineTitle = "   Popular Cusines"
        self.optionTitle = "   Top options"
        self.locationName = ""
        
        
        self.cusineList.append(ToDoFilterOptionViewModel(title: "American", dIcon: "IconAmericanDefault", sIcon: "IconAmericanSelected", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "Italian", dIcon: "IconItallianDefault", sIcon: "IconItallianSelected", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "Indian", dIcon: "IconIndianDefault", sIcon: "IconIndianSelected", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "International", dIcon: "IconInternationDefault", sIcon: "IconInternational", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "Japanese", dIcon: "IconJapenese", sIcon: "IconChineseSelected", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "Seafood", dIcon: "IconSeafoodDefault", sIcon: "IconSeaFoodSelected", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "Steak House", dIcon: "IconSteakDefault", sIcon: "IconSteakSelected", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "Arabic", dIcon: "IconMoreDefault", sIcon: "IconMoreDefault", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "British", dIcon: "", sIcon: "", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "Breakfast", dIcon: "", sIcon: "", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "Cajun", dIcon: "", sIcon: "", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "Caribbean", dIcon: "", sIcon: "", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "European", dIcon: "", sIcon: "", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "French", dIcon: "", sIcon: "", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "Greek", dIcon: "", sIcon: "", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "German", dIcon: "", sIcon: "", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "Irish", dIcon: "", sIcon: "", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "Korean", dIcon: "", sIcon: "", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "Halal", dIcon: "", sIcon: "", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "Lebanese", dIcon: "", sIcon: "", isHappy: false, isLady: false))
         self.cusineList.append(ToDoFilterOptionViewModel(title: "Moroccan", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.cusineList.append(ToDoFilterOptionViewModel(title: "Mediterranean", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.cusineList.append(ToDoFilterOptionViewModel(title: "Mexican", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.cusineList.append(ToDoFilterOptionViewModel(title: "Spanish", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.cusineList.append(ToDoFilterOptionViewModel(title: "South American", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.cusineList.append(ToDoFilterOptionViewModel(title: "Thai", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        
        
        
        
        self.optionList.append(ToDoFilterOptionViewModel(title: "Accept Voucher", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "No Alchohol", dIcon: "IconDrinksDefault", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Happy Hour", dIcon: "", sIcon: "", isHappy: true, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Spa", dIcon: "IconSpaDefault", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Bar", dIcon: "IconBarDefault", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Live Entertainment", dIcon: "IconMikeDefault", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Ladies Nights", dIcon: "IconLadiesNightDefault", sIcon: "", isHappy: false, isLady: true))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Shisha", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Outdoor Seating", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Parking", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Valet Parking", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Serve Alcohol", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Brunches", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Outdoor", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Indoor", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Kids Welcome", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Wheelchair Accessible", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Wifi", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Height Restriction", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Age Restriction", dIcon: "", sIcon: "", isHappy: false, isLady: false))
        self.optionList.append(ToDoFilterOptionViewModel(title: "Take Away", dIcon: "", sIcon: "", isHappy: false, isLady: false))
       
        
        
        
        
    }
    
    func getLadiesNight() -> ToDoFilterOptionViewModel {
        for option in self.optionList{
            if(option.isLadiesNight){
                return option
            }
        }
        return ToDoFilterOptionViewModel()
    }
    
    func getHappyHours() -> ToDoFilterOptionViewModel {
        for option in self.optionList{
            if(option.isHappyHour){
                return option
            }
        }
        return ToDoFilterOptionViewModel()
    }
}
