//
//  Review.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "Review.h"

@implementation Review

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"reviewId"        : @"id",
                             @"hubId"           : @"hub_id",
                             @"rated"           : @"rated",
                             @"reviewDetail"    : @"review",
                             @"name"            : @"name",
                             @"imageUrl"        : @"photo",
                             @"timeAdded"       : @"time_added",
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}

@end
