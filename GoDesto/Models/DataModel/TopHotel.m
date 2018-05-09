//
//  TopHotel.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 05/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "TopHotel.h"

@implementation TopHotel

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"general"          : @"general",
                             @"min"              : @"min",
                             @"max"              : @"max",
                             @"currencyMin"      : @"currency_min",
                             @"currencyMax"      : @"currency_max",
                             @"currency"         : @"currency",
                             @"hotelList"        : @"live_rez_hotels_result",
                             @"roomTags"         : @"room_xml_tags"
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}


@end
