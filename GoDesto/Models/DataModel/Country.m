//
//  Country.m
//  InsafiansPTI
//
//  Created by Zaryab on 1/3/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "Country.h"

@implementation Country

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"areaName"            : @"area_name",
                             @"countryCode"         : @"country_code",
                             @"cityName"            : @"city_name",
                             @"destType"            : @"dest_type",
                             @"areaCode"            : @"area_code",
                             @"countryName"         : @"country_name",
                             @"name"                : @"name",
                             @"cityCode"            : @"city_code",
                             @"weight"              : @"weight",
                             @"cId"                 : @"id",
                             @"searchString"        : @"search_string",
                             @"hotelCode"           : @"hotel_code",
                             @"version"             : @"_version_",
                             @"suggestCountryName"  :@"label",
                             @"suggestCountryCode"  :@"code"
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}

@end
