//
//  HomeViewModel.swift
//  GoDesto
//
//  Created by Rudaba Fatima on 4/8/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation


class HomeViewModel {
    
    var baseUrl:String
    var baseImageUrl:String
    var blog:NSArray
    var restaurant:[HomeInfoViewModel]
    var happyHour:[HomeInfoViewModel]
    var brunches:[HomeInfoViewModel]
    var ladiesNite:[HomeInfoViewModel]
    var categories:[HomeCategoryViewModel]
    var appCities:NSArray
    var thingToDoList:[HomeInfoViewModel]
    
    init() {
        
        self.baseUrl = ""
        self.baseImageUrl = ""
        self.blog = NSArray()
        self.restaurant = [HomeInfoViewModel]()
        self.happyHour = [HomeInfoViewModel]()
        self.brunches = [HomeInfoViewModel]()
        self.ladiesNite = [HomeInfoViewModel]()
        self.categories = [HomeCategoryViewModel]()
        self.appCities = NSArray()
        self.thingToDoList = [HomeInfoViewModel]()
    }
    
   convenience init(home:HomeLIst) {
        self.init()
        self.baseUrl = home.baseUrl as String? ?? ""
        self.baseImageUrl = home.baseImageUrl as String? ?? ""
        self.blog = home.blog as NSArray? ?? NSArray()
        self.appCities = home.appCities as NSArray? ?? NSArray()
        
        for item in home.restaurant{
            self.restaurant.append(HomeInfoViewModel(homeModel: item as! HomeInfo))
        }
        for item in home.happyHour{
            self.happyHour.append(HomeInfoViewModel(homeModel: item as! HomeInfo))
        }
        for item in home.brunches{
            self.brunches.append(HomeInfoViewModel(homeModel: item as! HomeInfo))
        }
        for item in home.ladiesNite{
            self.ladiesNite.append(HomeInfoViewModel(homeModel: item as! HomeInfo))
        }
        for item in home.categories{
            self.categories.append(HomeCategoryViewModel(cat: item as! HomeCategory))
        }
        
        
    }
    
    convenience init(list:ThingsToDoList){
        self.init()
        
        for item in list.thingsToDoList {
            self.thingToDoList.append(HomeInfoViewModel(homeModel: item as! HomeInfo))
        }
    }
    
   
}

