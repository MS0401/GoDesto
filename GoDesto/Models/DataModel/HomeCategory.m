//
//  HomeCategory.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "HomeCategory.h"

@implementation HomeCategory

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"catId"               : @"id",
                             @"catText"             : @"category_text",
                             @"catField"            : @"category_field",
                             @"appImage"            : @"app_image",
                             @"view"                : @"view",
                             @"city"                : @"city",
                             @"actionType"          : @"action_type"
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}

@end
