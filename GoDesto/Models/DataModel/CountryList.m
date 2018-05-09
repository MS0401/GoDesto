//
//  CountryList.m
//  InsafiansPTI
//
//  Created by Zaryab on 1/3/18.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "CountryList.h"

@implementation CountryList

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"countryList"                 : @"data"
                             
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}
@end
