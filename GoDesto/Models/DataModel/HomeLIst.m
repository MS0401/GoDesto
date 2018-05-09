//
//  HomeLIst.m
//  GoDesto
//
//  Created by Rudaba Fatima on 4/8/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "HomeLIst.h"

@implementation HomeLIst


+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}

+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"baseUrl"                            : @"base_url",
                             @"baseImageUrl"                       : @"base_image_url",
                             @"blog"                               : @"blog",
                             @"restaurant"                         : @"restaurant",
                             @"happyHour"                          : @"happy_hour",
                             @"brunches"                           : @"brunches",
                             @"ladiesNite"                         : @"ladies_nite",
                             @"categories"                         : @"categories",
                             @"appCities"                          : @"app_cities"
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}


@end

