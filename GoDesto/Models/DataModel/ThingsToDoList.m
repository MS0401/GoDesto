//
//  ThingsToDoList.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "ThingsToDoList.h"

@implementation ThingsToDoList

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"thingsToDoList"  : @"data",
                             @"offset"          : @"offset",
                             @"query"           : @"query",
                             @"ads"             : @"ids",
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}
@end
