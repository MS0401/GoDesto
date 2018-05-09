//
//  Holiday.m
//  GoDesto
//
//  Created by Ghafar Tanveer on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "Holiday.h"

@implementation Holiday

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{ @"holidayId"       : @"id",
                             @"voucherType"     : @"voucher_type",
                             @"windows"           : @"windows",
                             @"terms"             : @"terms",
                             @"hubId"             : @"hub_id"
                             };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
    
}
@end
