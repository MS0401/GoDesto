//
//  ThingToDoDetail.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "ThingToDoDetail.h"


@implementation ThingToDoDetail

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"hubMain"                 : @"hub_main",
                             @"holidayBrunchList"       : @"holiday_brunch",
                             @"ladiesNightList"         : @"ladiesnights",
                             @"holidayVoucherList"      : @"holiday_vouchers",
                             @"reviewList"              : @"h_reviews",
                             @"timingList"              : @"hub_opening_time",
                             @"hubHappyHours"           : @"hub_happy_hour",
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}

@end
