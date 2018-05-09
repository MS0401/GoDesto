//
//  GCDetailHolidayVouchers.m
//  GoDesto
//
//  Created by Muhammad Rashid on 11/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

#import "GCDetailHolidayVouchers.h"

@implementation GCDetailHolidayVouchers
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
+(JSONKeyMapper*)keyMapper
{
    NSDictionary * dict = @{
                            @"holidayVoucherId" : @"id",
                            @"voucherType" : @"voucher_type",
                            @"windows" : @"windows",
                            @"terms" : @"terms",
                            @"hubId" : @"hub_id",
                            };
    
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:dict];
}
@end
