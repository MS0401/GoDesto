//
//  FilterViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 21/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class FilterViewModel {
    
    var hotelSearch:FilterHotelSearchViewModel
    var priceSearch:FilterPriceViewModel
    var optionList:[FilterOptionViewModel]
    var starsList:[FilterStarsViewModel]
    var mealTypeList:[FilterMealTypeViewModel]
    var accomodationTypeList:[FilterMealTypeViewModel]
    var popularCuicineList:[FilterOptionViewModel]
    
    var tagList:[String]
    
    
    
    init() {
        self.hotelSearch = FilterHotelSearchViewModel()
        self.priceSearch = FilterPriceViewModel()
        self.optionList = [FilterOptionViewModel]()
        self.starsList = [FilterStarsViewModel]()
        self.mealTypeList = [FilterMealTypeViewModel]()
        self.accomodationTypeList = [FilterMealTypeViewModel]()
        self.popularCuicineList = [FilterOptionViewModel]()
        self.tagList = [String]()
        
        self.optionList.append(FilterOptionViewModel(dImage: "SpaDefault", sImage: "SpaSelected", name: "Beauty & Spa", title: "Top options"))
        self.optionList.append(FilterOptionViewModel(dImage: "WifiDefault", sImage: "WifiSelected", name: "Free wifi", title: "Top options"))
        self.optionList.append(FilterOptionViewModel(dImage: "BreakfastDefault", sImage: "BreakfastSelected", name: "Breakfast included", title: "Top options"))
        self.optionList.append(FilterOptionViewModel(dImage: "PoolDefault", sImage: "PoolSelected", name: "Pool", title: "Top options"))
        self.optionList.append(FilterOptionViewModel(dImage: "BeachDefault", sImage: "BeachSelected", name: "Beach", title: "Top options"))
    
       
        self.starsList.append(FilterStarsViewModel(dImage: "1StarDefault", sImage: "1StarSelected",star:"1 Star"))
        self.starsList.append(FilterStarsViewModel(dImage: "2StarDefault", sImage: "2StarSelected",star:"2 Star"))
        self.starsList.append(FilterStarsViewModel(dImage: "3StarDefault", sImage: "3StarSelected",star:"3 Star"))
        self.starsList.append(FilterStarsViewModel(dImage: "4StarDefault", sImage: "4StarSelected",star:"4 Star"))
        self.starsList.append(FilterStarsViewModel(dImage: "5StarDefault", sImage: "5StarSelected",star:"5 Star"))
        
        
        self.mealTypeList.append(FilterMealTypeViewModel(type: "All inclusive", isSelected: false, title: "Filter by Meal type"))
        self.mealTypeList.append(FilterMealTypeViewModel(type: "Room only", isSelected: false, title: "Filter by Meal type"))
        self.mealTypeList.append(FilterMealTypeViewModel(type: "Breakfast included", isSelected: false, title: "Filter by Meal type"))
        self.mealTypeList.append(FilterMealTypeViewModel(type: "Half board", isSelected: false, title: "Filter by Meal type"))
        self.mealTypeList.append(FilterMealTypeViewModel(type: "Full board", isSelected: false, title: "Filter by Meal type"))
        
        self.accomodationTypeList.append(FilterMealTypeViewModel(type: "Hotel", isSelected: false, title: "Filter by Accommodation type"))
        self.accomodationTypeList.append(FilterMealTypeViewModel(type: "Resort", isSelected: false, title: "Filter by Accommodation type"))
        self.accomodationTypeList.append(FilterMealTypeViewModel(type: "Appartments", isSelected: false, title: "Filter by Accommodation type"))
        self.accomodationTypeList.append(FilterMealTypeViewModel(type: "Motel", isSelected: false, title: "Filter by Accommodation type"))
        self.accomodationTypeList.append(FilterMealTypeViewModel(type: "Hostel", isSelected: false, title: "Filter by Accommodation type"))
        
       
        self.popularCuicineList.append(FilterOptionViewModel(image: "", name: "American", title: "Popular Cuisines"))
        self.popularCuicineList.append(FilterOptionViewModel(image: "", name: "Burger joint", title: "Popular Cuisines"))
        self.popularCuicineList.append(FilterOptionViewModel(image: "", name: "Chinese", title: "Popular Cuisines"))
        self.popularCuicineList.append(FilterOptionViewModel(image: "", name: "Indian", title: "Popular Cuisines"))
        self.popularCuicineList.append(FilterOptionViewModel(image: "", name: "International", title: "Popular Cuisines"))
        
        self.popularCuicineList.append(FilterOptionViewModel(image: "", name: "Italian", title: "Popular Cuisines"))
        self.popularCuicineList.append(FilterOptionViewModel(image: "", name: "Japnese", title: "Popular Cuisines"))
        self.popularCuicineList.append(FilterOptionViewModel(image: "", name: "Pizza", title: "Popular Cuisines"))
        self.popularCuicineList.append(FilterOptionViewModel(image: "", name: "Steakhouse", title: "Popular Cuisines"))
        self.popularCuicineList.append(FilterOptionViewModel(image: "", name: "More", title: "Popular Cuisines"))
        
    }
    func setPrice(searchRegion:SearchRegionViewModel)  {
        self.priceSearch.minInAED = searchRegion.min
        self.priceSearch.maxInAED = searchRegion.max

        self.priceSearch.defaultMinAED = searchRegion.min
        self.priceSearch.defaultMaxAED = searchRegion.max

        self.priceSearch.min = searchRegion.min
        self.priceSearch.max = searchRegion.max
        
        let rate = Global.shared.splashInfo!.exchangeInfo.rate
        if(!rate.isEmpty && !searchRegion.min.isEmpty){
            let conversion = Int(Double(rate)! * Double(searchRegion.min)!)
            self.priceSearch.min = "\(conversion)"
        }
        if(!rate.isEmpty && !searchRegion.max.isEmpty){
            let conversion = Int(Double(rate)! * Double(searchRegion.max)!)
            self.priceSearch.max = "\(conversion)"
        }
        self.priceSearch.isChanged = false
    }
    
    func resetFilter()  {
        self.tagList = [String]()
        self.hotelSearch.isAnswered = false
        self.hotelSearch.answer = ""
        
        for eachoption in self.optionList{
            eachoption.isSelected = false
        }
        for eachStar in self.starsList{
            eachStar.isSelected = false
        }
        for eachType in self.mealTypeList{
            eachType.isSelected = false
        }
        for eachType in self.accomodationTypeList{
            eachType.isSelected = false
        }
    }
    func settagList()  {
        self.tagList = [String]()
        for item in self.optionList {
            if(item.isSelected){
                self.tagList.append(item.name)
            }
        }
        for item in self.starsList {
            if(item.isSelected){
                self.tagList.append(item.star)
            }
        }
        for item in self.mealTypeList {
            if(item.isSelected){
                self.tagList.append(item.type)
            }
        }
        for item in self.accomodationTypeList {
            if(item.isSelected){
                self.tagList.append(item.type)
            }
        }
    }
    func setFilters(text:String)  {
        for item in self.optionList {
            if(item.name.lowercased() == text.lowercased()){
                item.isSelected = false
            }
        }
        for item in self.starsList {
            if(item.star.lowercased() == text.lowercased()){
                item.isSelected = false
            }
        }
        for item in self.mealTypeList {
            if(item.type.lowercased() == text.lowercased()){
                item.isSelected = false
            }
        }
        for item in self.accomodationTypeList {
            if(item.type.lowercased() == text.lowercased()){
                item.isSelected = false
            }
        }
    }
    func getOptionString() -> String {
        var option = ""
        for item in self.optionList {
            if(item.isSelected){
                if(option.isEmpty){
                    option = item.name
                }else{
                    option = option + ",\(item.name)"
                }
            }
        }
        return option
    }
    func getStarString() -> String {
        var option = ""
        for i in 0 ..< self.starsList.count {
            if(self.starsList[i].isSelected){
                if(option.isEmpty){
                    option = "\(i + 1)"
                }else{
                    option = option + ",\(i + 1)"
                }
            }
        }
        return option
    }
    func getMealTypeString() -> String {
        var option = ""
        for item in self.mealTypeList{
            if(item.isSelected){
                option = item.type
            }
        }
        return option
    }
    func getAccomodationTypeString() -> String {
        var option = ""
        for item in self.mealTypeList{
            if(item.isSelected){
                option = item.type
            }
        }
        return option
    }
    func isOptionSelected() -> Bool {
        for item in self.optionList {
            if(item.isSelected){
                return true
            }
        }
        return false
    }
    func isMealTypeSelected() -> Bool {
        for item in self.mealTypeList {
            if(item.isSelected){
                return true
            }
        }
        return false
    }
    func isAccomodationTypeSelected() -> Bool {
        for item in self.accomodationTypeList {
            if(item.isSelected){
                return true
            }
        }
        return false
    }
    func isStarSelected() -> Bool {
        for item in self.starsList {
            if(item.isSelected){
                return true
            }
        }
        return false
    }
    func isPriceChanged() -> Bool {
        if(self.priceSearch.isChanged){
            return true
        }
        return false
    }
    
    func isHotelSearching() -> Bool {
        if(self.hotelSearch.isAnswered){
            return true
        }
            return false
        
    }
    func isHotelPriceSearch() -> Bool {
        if(self.hotelSearch.answer.lowercased().contains("price".lowercased())){
            return true
        }
        return false
    }
    
    
    

}
