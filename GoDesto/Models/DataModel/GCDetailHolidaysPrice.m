//
//  GCDetailHolidaysPrice.m
//  GoDesto
//
//  Created by Muhammad Rashid on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "GCDetailHolidaysPrice.h"

@implementation GCDetailHolidaysPrice
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{
                            @"holidayPriceId" : @"id",
                            @"priceStartingDate" : @"price_starting_date",
                            @"priceEndingDate" : @"price_ending_date",
                            @"priceType" : @"price_type",
                            @"peakType" : @"peak_type",
                            @"hubId" : @"hub_id",
                            @"priceToTime" : @"price_to_time",
                            @"priceFromTime" : @"price_from_time",
                            @"priceValue" : @"price_value",
                            @"ss" : @"ss",
                            };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
}
@end
