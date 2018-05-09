//
//  TImeList.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 14/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "TImeList.h"

@implementation TImeList

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"sunday"          : @"Sunday",
                             @"monday"          : @"Monday",
                             @"tuesday"         : @"Tuesday",
                             @"wednesday"       : @"Wednesday",
                             @"thursday"        : @"Thursday",
                             @"friday"          : @"Friday",
                             @"satuarday"       : @"Saturday",
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}

@end
