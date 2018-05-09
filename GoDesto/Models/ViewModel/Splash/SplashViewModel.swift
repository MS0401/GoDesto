//
//  SplashViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 22/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation
class SplashViewModel {
   
    var landingImages:[LandingImageViewModel]
    var appInfo:AppInfoViewModel
    var exchangeInfo:ExchangeRateViewModel
    var ipInfo:IPInfoViewModel
    
    init() {
        
        self.landingImages = [LandingImageViewModel]()
        self.appInfo = AppInfoViewModel()
        self.exchangeInfo = ExchangeRateViewModel()
        self.ipInfo = IPInfoViewModel()
    }
    
    convenience init(splash:SplashInfo) {
        self.init()
        if let images = splash.landingImages{
            for eachImage in images{
                self.landingImages.append(LandingImageViewModel(image: eachImage as! LandingImage))
            }
        }
        if let info = splash.appInfo{
            self.appInfo = AppInfoViewModel(info: info)
        }
        if let info = splash.ipInfoList{
            if(info.count > 0){
                self.ipInfo = IPInfoViewModel(info: info[0] as! IPInfo)
            }
            
        }
        if let exchange = splash.exchangeInfo{
            self.exchangeInfo = ExchangeRateViewModel(dic: exchange)
        }
    }
}
