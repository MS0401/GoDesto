//
//  IPInfo.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "IPInfo.h"

@implementation IPInfo

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"currencyCode"       : @"currency_code",
                             @"iso"                : @"iso3",
                             @"ipFrom"             : @"ip_from",
                             @"ipTo"               : @"ip_to",
                             @"countryCode"        : @"country_code",
                             @"countryname"        : @"country_name"
                             };
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}

@end
