//
//  ChangeCurrencyResponse.m
//  GoDesto
//
//  Created by Sohail on 01/05/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "ChangeCurrencyResponse.h"

@implementation ChangeCurrencyResponse

+(JSONKeyMapper*)keyMapper
{

    
    NSDictionary * dict = @{@"status" : @"status",
                            @"data" : @"data",
                            @"message" : @"message",
                            @"result" : @"result"
                            };
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];

}
@end
