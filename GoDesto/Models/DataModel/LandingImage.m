//
//  LandingImage.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "LandingImage.h"

@implementation LandingImage

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"imageId"            : @"id",
                             @"defaultImage"       : @"default_image",
                             @"city"               : @"city",
                             @"title"              : @"heading_text",
                             @"subTitle"           : @"sub_heading_text",
                             @"imageUrl"           : @"app_image",
                             @"home"               : @"home"
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}

@end

