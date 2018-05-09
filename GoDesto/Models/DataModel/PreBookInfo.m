//
//  PreBookInfo.m
//  GoDesto
//
//  Created by Le Abid on 19/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "PreBookInfo.h"
//ChangeCurrencyResponse
@implementation PreBookInfo

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{@"stay"           : @"duration_counter",
                            @"contractType"   : @"RoomTypeCollection",
                            @"roomType"       : @"RoomDescription",
                            @"price"          : @"TotalPriceVAjax_decode",
                            @"taxIncludedText": @"tax_included_text",
                            @"cancelationText": @"html_cancellation",
                            @"cancelationInfoText" : @"info_cancel",
                            @"terms"          : @"godesto_terms.text",
                           };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}

@end
