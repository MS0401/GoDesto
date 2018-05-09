//
//  SearchRegion.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 05/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "SearchRegion.h"

@implementation SearchRegion

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"general"       : @"general",
                             @"min"           : @"min",
                             @"max"           : @"max"
                             };
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}

@end
