//
//  CountryList.h
//  InsafiansPTI
//
//  Created by Zaryab on 1/3/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Country.h"
#import "DataModelProtocols.h"

@interface CountryList: JSONModel
@property(strong,nonatomic) NSArray <Country> *countryList;

@end
