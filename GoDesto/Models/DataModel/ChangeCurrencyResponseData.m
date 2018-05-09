//
//  ChangeCurrencyResponseData.m
//  GoDesto
//
//  Created by Sohail on 01/05/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "ChangeCurrencyResponseData.h"

@implementation ChangeCurrencyResponseData

+(JSONKeyMapper*)keyMapper
{
    
    
    NSDictionary * dict = @{@"dataID"           : @"id",
                            @"fromCurrency"   : @"from_cur",
                            @"toCurrency"       : @"to_cur",
                            @"rate"          : @"rate",
                            @"dated": @"dated",
                            @"symbol": @"symbol",
                            @"position" : @"position",
                            @"unicode"          : @"unicode",
                            };
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}
@end
