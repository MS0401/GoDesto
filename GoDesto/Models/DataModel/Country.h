//
//  Country.h
//  InsafiansPTI
//
//  Created by Zaryab on 1/3/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "DataModelProtocols.h"
//#import "Province.h"

@interface Country : JSONModel

@property (strong,nonatomic) NSString *areaName;
@property (strong,nonatomic) NSString *countryCode;
@property (strong,nonatomic) NSString *cityName;
@property (strong,nonatomic) NSString *destType;
@property (strong,nonatomic) NSString *areaCode;
@property (strong,nonatomic) NSString *countryName;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *cityCode;
@property (strong,nonatomic) NSString *weight;
@property (strong,nonatomic) NSString *cId;
@property (strong,nonatomic) NSString *searchString;
@property (strong,nonatomic) NSString *hotelCode;
@property (strong,nonatomic) NSString *version;
@property (strong,nonatomic) NSString *suggestCountryName;
@property (strong,nonatomic) NSString *suggestCountryCode;


@end
