//
//  DefaultResponse.m
//  CabIOS
//
//  Created by Ghafar Tanveer on 09/02/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "DefaultResponse.h"

@implementation DefaultResponse

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"status"                : @"result",
                             @"message"               : @"message"
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}

@end
