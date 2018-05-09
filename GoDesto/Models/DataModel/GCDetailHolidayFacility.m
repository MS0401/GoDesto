//
//  GCDetailHolidayFacility.m
//  GoDesto
//
//  Created by Muhammad Rashid on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "GCDetailHolidayFacility.h"

@implementation GCDetailHolidayFacility
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{
                            @"holidayFacilityId" : @"id",
                            @"headline" : @"headline",
                            @"description" : @"description",
                            @"hubId" : @"hub_id",
                            };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
}
@end
