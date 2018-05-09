//
//  TIme.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 14/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "TIme.h"

@implementation TIme

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"value"        : @"value",
                             @"display"      : @"display"
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}

@end
