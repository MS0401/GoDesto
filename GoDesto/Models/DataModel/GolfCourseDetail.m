//
//  GolfCourseDetail.m
//  GoDesto
//
//  Created by Muhammad Rashid on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "GolfCourseDetail.h"

@implementation GolfCourseDetail

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{
                            @"gcDetailMindBody"                       : @"mindbody",
                            @"gcDetailCourse"                         : @"golf_course",
                            @"gcDetailAroundTown"                     : @"aroundtown",
                            @"gcDetailResturant"                      : @"restaurant",
                            @"gcDetailHolidayFacility"                : @"holiday_facility",
                            @"gcDetailHolidayVouchers"                : @"holiday_vouchers",
                            @"gcDetailHubOpeningTime"                 : @"hub_opening_time",
                            @"gcDetailReviews"                        : @"h_reviews",
                            @"gcDetailHolidaysPrice"                  : @"holiday_prices",
                            @"imageBaseUrl"                           : @"image_base_url",
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
}
@end
