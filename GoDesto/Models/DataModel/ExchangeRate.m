//
//  ExchangeRate.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 04/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "ExchangeRate.h"

@implementation ExchangeRate

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"exchangeId"          : @"id",
                             @"fromCurrency"        : @"from_cur",
                             @"toCurrency"          : @"to_cur",
                             @"rate"                : @"rate",
                             @"date"                : @"dated",
                             @"symbol"              : @"symbol",
                             @"position"            : @"position",
                             @"unicode"             : @"unicode",
                             };
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}

@end
