//
//  SplashInfo.h
//  GoDesto
//
//  Created by Ghafar Tanveer on 22/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>
#import "LandingImage.h"
#import "AppInfo.h"
#import "ExchangeRate.h"
#import "IPInfo.h"

@interface SplashInfo : JSONModel
   
    @property(weak,nonatomic) NSArray <LandingImage> *landingImages;
    @property(weak,nonatomic) AppInfo *appInfo;
    @property(weak,nonatomic) NSDictionary *exchangeInfo;
    @property(weak,nonatomic) NSArray <IPInfo> *ipInfoList;
    
    
@end
