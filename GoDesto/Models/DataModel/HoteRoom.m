//
//  HoteRoom.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "HoteRoom.h"

@implementation HoteRoom


+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"quoteId"              : @"QuoteId",
                             @"roomText"             : @"RoomText",
                             @"roomDescription"      : @"RoomDescription",
                             @"showPriceSelection"   : @"show_price_collection",
                             @"showPriceSep"         : @"show_price_sep",
                             @"previousPrice"        : @"previous_price_collection",
                             @"dataPreviousPrice"    : @"data_previous_price",
                             @"dataCurrentPrice"     : @"data_current_price"
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}

@end
